import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_user.dart';
import '../../models/firestore_position.dart';
import '../../repositories/firestore/app_user_repository.dart';
import '../../repositories/firestore/chat_room_repository.dart';
import '../../utils/exceptions/common.dart';
import '../../utils/firestore_refs.dart';
import '../../utils/geo.dart';
import '../auth/auth.dart';

/// マップのデフォルトの緯度経度。
const _defaultLatLng = LatLng(35.6812, 139.7671);

/// マップのデフォルトのズームレベル。
const double _defaultZoom = 15;

/// マップのデフォルトの検出半径。
const double _defaultRadius = 1;

/// 現在地の位置情報を提供する
final currentLocationProvider = StateProvider.autoDispose<LatLng>(
  (ref) => ref.watch(initialCenterLatLngProvider),
);

/// GoogleMap ウィジェットを作成する際に値を更新して使用する。
final googleMapControllerProvider =
    StateProvider<GoogleMapController?>((_) => null);

/// GeoFlutterFire のインスタンスを提供する Provider。
// final geoProvider = Provider.autoDispose((_) => Geoflutterfire());

/// マップの初期中心位置を提供する Provider。ProviderScope.overrides でオーバーライドして使用する。
final initialCenterLatLngProvider =
    Provider<LatLng>((_) => throw UnimplementedError());

/// マップの中心位置を管理する StateProvider。
final centerLatLngProvider =
    StateProvider.autoDispose((ref) => ref.watch(initialCenterLatLngProvider));

/// マップのズームレベルを管理する StateProvider。
final zoomProvider = StateProvider.autoDispose<double>((_) => _defaultZoom);

/// マップの検出半径を管理する StateProvider。
final radiusProvider = StateProvider.autoDispose<double>((_) => _defaultRadius);

/// マップのカメラ位置を管理する StateProvider。
final cameraPositionProvider = StateProvider(
  (_) => const CameraPosition(target: _defaultLatLng, zoom: _defaultZoom),
);

/// マップで検出されている AppUser 一覧を管理する StateProvider。
final selectedAppUserProvider = StateProvider<AppUser?>((_) => null);

/// マップの検出範囲をリセットするかどうかを管理する StateProvider。
final willResetDetectionRangeProvider = StateProvider((_) => true);

/// マップの検出範囲をリセットするメソッドを提供する Provider。
final resetDetectionRangeProvider = Provider.autoDispose(
  (ref) => () {
    final latLng = ref.watch(cameraPositionProvider).target;
    final zoom = ref.watch(cameraPositionProvider).zoom;
    ref.read(centerLatLngProvider.notifier).update((state) => latLng);
    ref.read(zoomProvider.notifier).update((state) => zoom);
    ref
        .read(radiusProvider.notifier)
        .update((state) => getRadiusFromZoom(zoom));
  },
);

/// マップを現在位置とデフォルトのズームレベルに戻すメソッドを提供する Provider。
final backToCurrentPositionProvider = Provider.autoDispose(
  (ref) => () async {
    final p = await currentPosition;
    final latLng = p == null ? _defaultLatLng : LatLng(p.latitude, p.longitude);
    await ref.read(googleMapControllerProvider)?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: _defaultZoom),
          ),
        );
  },
);

/// マップの現在の検出範囲内に入っている AppUser の DocumentSnapshot 一覧を
/// 購読する Stream を提供する Provider。
final appUserDocumentSnapshotsStream = StreamProvider.autoDispose((ref) {
  final center = ref.watch(centerLatLngProvider);
  final radius = ref.watch(radiusProvider);

  return GeoCollectionRef<AppUser>(appUsersRef).within(
    center: GeoFirePoint(center.latitude, center.longitude),
    radiusInKm: radius,
    field: 'location',
    geopointFrom: (appUser) => appUser.location.geopoint,
    strictMode: true,
  );

  // return ref.watch(geoProvider).collectionWithConverter(collectionRef: appUsersRef).within(
  //       center: GeoFirePoint(center.latitude, center.longitude),
  //       radius: radius,
  //       field: 'location',
  //       geopointFrom: (appUser) => appUser.location.geopoint,
  //       strictMode: true,
  //     );
});

/// マップ上に検出された AppUser 一覧のマーカーを提供する Provider。
final markersProvider = Provider.autoDispose((ref) {
  final userId = ref.watch(userIdProvider).value;

  final documentSnapshots =
      ref.watch(appUserDocumentSnapshotsStream).value ?? [];
  final markers = <Marker>{};
  for (final ds in documentSnapshots) {
    final appUser = ds.documentSnapshot.data();
    // final appUser = ds.data();
    if (appUser == null || appUser.appUserId == userId) {
      continue;
    }
    final marker = ref.watch(getMarkerFromAppUserProvider)(appUser);
    markers.add(marker);
  }

  return markers;
});

/// マップ上に検出された AppUser 一覧を提供する Provider。
final appUsersOnMapProvider = Provider.autoDispose((ref) {
  final userId = ref.watch(userIdProvider).value;
  final documentSnapshots =
      ref.watch(appUserDocumentSnapshotsStream).value ?? [];
  final appUsers = <AppUser>[];
  for (final ds in documentSnapshots) {
    final appUser = ds.documentSnapshot.data();
    // final appUser = ds.data();
    if (appUser == null || appUser.appUserId == userId) {
      continue;
    }
    appUsers.add(appUser);
  }

  return appUsers;
});

/// AppUser から GoogleMap の Marker インスタンスを作成して返すメソッドを提供する Provider。
final getMarkerFromAppUserProvider =
    Provider.autoDispose<Marker Function(AppUser)>(
  (ref) => (appUser) {
    final geopoint = appUser.location.geopoint;
    final lat = geopoint.latitude;
    final lng = geopoint.longitude;
    final markerId = _getMarkerIdFromLatLng(LatLng(lat, lng));
    final selected = ref.watch(selectedAppUserProvider) == appUser;
    return Marker(
      markerId: markerId,
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        selected ? BitmapDescriptor.hueBlue : BitmapDescriptor.hueRed,
      ),
      zIndex: selected ? 10 : 0,
      onTap: () async {
        ref
            .read(willResetDetectionRangeProvider.notifier)
            .update((state) => true);
        ref
            .read(centerLatLngProvider.notifier)
            .update((state) => LatLng(lat, lng));
        ref.read(selectedAppUserProvider.notifier).update((state) => appUser);
      },
    );
  },
);

/// LatLng から GoogleMap の MarkerId インスタンスを作成して返す。
MarkerId _getMarkerIdFromLatLng(LatLng latLng) =>
    MarkerId(latLng.latitude.toString() + latLng.longitude.toString());

/// PageView ウィジェットのコントローラを提供する Provider。
final pageControllerProvider = Provider.autoDispose(
  (_) => PageController(viewportFraction: viewportFraction),
);

/// PageView ウィジェトの onPageChanged プロパティに指定するメソッドを提供する Provider。
final onPageChangedProvider = Provider.autoDispose<Future<void> Function(int)>(
  (ref) => (index) async {
    ref.read(willResetDetectionRangeProvider.notifier).update((state) => false);
    final appUser = ref.read(appUsersOnMapProvider).elementAt(index);
    final geopoint = appUser.location.geopoint;
    await ref.read(googleMapControllerProvider)?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(geopoint.latitude, geopoint.longitude),
              zoom: ref.read(zoomProvider),
            ),
          ),
        );
    ref.read(selectedAppUserProvider.notifier).update((state) => appUser);
  },
);

/// 位置情報の許可を確認して、許可されている場合は現在の位置を返す。
Future<Position?> get currentPosition async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }
  final permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return null;
  }
  return Geolocator.getCurrentPosition();
}

/// デフォルトのマップ中心位置を決めるためのメソッド。
/// ProviderScope.overrides に指定してアプリの起動時にコールされる。
Future<LatLng> get initialCenterLatLng async {
  final p = await currentPosition;
  return p == null ? _defaultLatLng : LatLng(p.latitude, p.longitude);
}

/// ユーザの現在位置の更新
final updateUserLocation = Provider.autoDispose(
  (ref) => () async {
    final p = await currentPosition;
    final geoPoint = p == null
        ? GeoPoint(_defaultLatLng.latitude, _defaultLatLng.longitude)
        : GeoPoint(p.latitude, p.longitude);
    // final geo = Geoflutterfire();
    final geoFirePoint = GeoFirePoint(geoPoint.latitude, geoPoint.longitude);
    // final geoFirePoint = GeoFirePoint(
    //   geoPoint.latitude,
    //   geoPoint.longitude,
    // );
    final location = FirestorePosition(
      geohash: geoFirePoint.geohash,
      geopoint: geoPoint,
    );

    final userId = ref.watch(userIdProvider).value;
    if (userId == null) {
      throw const SignInRequiredException();
    }
    ref
        .read(centerLatLngProvider.notifier)
        .update((state) => LatLng(geoPoint.latitude, geoPoint.longitude));

    await ref.read(appUserRepositoryProvider).updateLocation(
          appUserId: userId,
          location: location,
        );
  },
);

// 連絡ボタン押下
final startContactProvider = Provider.autoDispose.family<Function, String>(
  (ref, partnerId) => () async {
    final appUserId = ref.watch(userIdProvider).value;
    if (appUserId == null) {
      throw const SignInRequiredException();
    }

    final id = await ref.read(chatRoomRepositoryProvider).createChatRoom(
          appUserId: appUserId,
          partnerId: partnerId,
        );
    return id;
  },
);
