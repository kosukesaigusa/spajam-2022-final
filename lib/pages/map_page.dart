import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/auth.dart';
import '../features/map/map.dart';
import '../models/app_user.dart';
import '../utils/extensions/build_context.dart';
import '../utils/extensions/int.dart';
import '../utils/geo.dart';
import '../utils/scaffold_messenger_service.dart';
import 'app_user_detail_page.dart';
import 'attending_chat_rooms_page.dart';
import 'widgets/contact_button.dart';

const double _stackedGreyBackgroundHeight = 200;
const double _stackedGreyBackgroundBorderRadius = 36;
const double _stackedGreyBackgroundPaddingTop = 8;
const double _nearMeCircleSize = 32;
const double _nearMeIconSize = 20;
const double _pageViewHorizontalMargin = 4;
const double _pageViewVerticalMargin = 8;
const double _pageViewHorizontalPadding = 8;
const double _pageViewVerticalPadding = 16;
const double _pageViewBorderRadius = 16;

/// マップページ
class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  static const path = '/map';
  static const name = 'MapPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        /// 初期表示の時にユーザの位置情報を更新する
        ref.read(updateUserLocation)();
        return null;
      },
      [],
    );

    return Scaffold(
      // TODO: マップは消すかもしれないけど、
      //  開発中は他の画面に遷移したりするボタンを配置したいので。
      appBar: AppBar(
        title: const Text('マップ'),
        actions: [
          ref.watch(isSignedInProvider).value ?? false
              ? IconButton(
                  onPressed: () async {
                    await ref.read(signOutProvider)();
                    ref
                        .read(scaffoldMessengerServiceProvider)
                        .showSnackBar('ログアウトしました。');
                  },
                  icon: const Icon(Icons.logout),
                )
              : IconButton(
                  onPressed: () async {
                    await ref
                        .read(scaffoldMessengerServiceProvider)
                        .showDialogByBuilder<void>(
                          builder: (context) => AlertDialog(
                            title: const Text('テストユーザーでログイン'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await ref.read(
                                        googleSignInProvider,
                                      )();
                                      Navigator.pop(context);
                                      ref
                                          .read(
                                            scaffoldMessengerServiceProvider,
                                          )
                                          .showSnackBar('ログインしました。');
                                    } on Exception catch (e) {
                                      // 本来は Exception 型を指定したいがここではスナックバーを表示することにする。
                                      // GoogleSIgnIn を使用する際にアカウント選択時にキャンセルされるとエラーが発生するためにこのような実装とする。
                                      ref
                                          .read(
                                            scaffoldMessengerServiceProvider,
                                          )
                                          .showSnackBarByException(e);
                                    }
                                  },
                                  child: const Text('Google アカウントでサインイン'),
                                ),
                                for (var i = 0; i < 5; i++)
                                  ElevatedButton(
                                    onPressed: () async {
                                      await ref.read(
                                        signInAsTestUserProvider(i + 1),
                                      )();
                                      Navigator.pop(context);
                                      ref
                                          .read(
                                            scaffoldMessengerServiceProvider,
                                          )
                                          .showSnackBar('ログインしました。');
                                    },
                                    child:
                                        Text('test${i + 1}@example.com でログイン'),
                                  ),
                              ],
                            ),
                          ),
                        );
                  },
                  icon: const Icon(Icons.login),
                ),
          IconButton(
            onPressed: () => Navigator.pushNamed<void>(
              context,
              AttendingChatRoomsPage.location,
            ),
            icon: const FaIcon(FontAwesomeIcons.message),
          ),
        ],
      ),
      body: Stack(
        children: [
          const GoogleMapWidget(),
          if (kDebugMode)
            const Positioned(
              child: Align(
                alignment: Alignment.topCenter,
                child: MapDebugIndicator(),
              ),
            ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _stackedGreyBackGround,
            ),
          ),
          const Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppUserPageView(),
            ),
          ),
        ],
      ),
    );
  }

  static final Widget _stackedGreyBackGround = Container(
    height: _stackedGreyBackgroundHeight,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_stackedGreyBackgroundBorderRadius),
        topRight: Radius.circular(_stackedGreyBackgroundBorderRadius),
      ),
    ),
  );
}

///
class GoogleMapWidget extends HookConsumerWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      circles: {
        Circle(
          circleId: const CircleId('value'),
          center: ref.watch(centerLatLngProvider),
          radius: 1000,
          fillColor: Colors.black12,
          strokeWidth: 0,
        ),
      },
      onMapCreated: (googleMapController) => ref
          .read(googleMapControllerProvider.notifier)
          .update((state) => googleMapController),
      initialCameraPosition: CameraPosition(
        target: ref.watch(centerLatLngProvider),
        zoom: ref.watch(zoomProvider),
      ),
      markers: ref.watch(markersProvider),
      minMaxZoomPreference:
          const MinMaxZoomPreference(minZoomLevel, maxZoomLevel),
      onCameraIdle: () {},
      onCameraMove: (cameraPosition) => ref
          .read(cameraPositionProvider.notifier)
          .update((state) => cameraPosition),
    );
  }
}

/// Map 内の検出範囲や検出結果などをデバッグように表示するウィジェット。
class MapDebugIndicator extends HookConsumerWidget {
  const MapDebugIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final center = ref.watch(centerLatLngProvider);
    final zoom = ref.watch(zoomProvider);
    final radius = ref.watch(radiusProvider);
    final markers = ref.watch(markersProvider);
    final selectedAppUser = ref.watch(selectedAppUserProvider);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 48, left: 16, right: 16),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'デバッグウィンドウ',
            style: context.titleSmall!.copyWith(color: Colors.white),
          ),
          const Gap(8),
          Text(
            '検出範囲は、画面中央を中心とする薄灰色の円の内側です。',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          Text(
            'Center: (lat, lng) = ('
            '${(center.latitude * 1000).round() / 1000}, '
            '${(center.longitude * 1000).round() / 1000})',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          Text(
            'Zoom level: ${(zoom * 100).round() / 100}',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          Text(
            'Radius: ${radius.toInt().withComma} km',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          Text(
            'Detected  markers: ${markers.length.withComma}',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          Text(
            '選択中: ${selectedAppUser?.appUserId ?? ''}',
            style: context.bodySmall!.copyWith(color: Colors.white),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

/// マップ上で検出されている AppUser を表示する部分。
class AppUserPageView extends HookConsumerWidget {
  const AppUserPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 32),
          width: _nearMeCircleSize,
          height: _nearMeCircleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.primaryColor,
          ),
          child: GestureDetector(
            onTap: () {
              ref.read(backToCurrentPositionProvider)();
              ref.read(updateUserLocation)();
            },
            child: const Icon(
              Icons.near_me,
              size: _nearMeIconSize,
              color: Colors.white,
            ),
          ),
        ),
        const Gap(_pageViewVerticalMargin),
        const SizedBox(
          height: _stackedGreyBackgroundHeight -
              _pageViewVerticalMargin * 2 -
              _nearMeCircleSize -
              _stackedGreyBackgroundPaddingTop,
          child: AppUsersOnMapPageView(),
        ),
        const Gap(_pageViewVerticalMargin),
      ],
    );
  }
}

/// マップ上で検出されている AppUser の PageView ウィジェット。
class AppUsersOnMapPageView extends HookConsumerWidget {
  const AppUsersOnMapPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUsersOnMap = ref.watch(appUsersOnMapProvider);
    return PageView(
      controller: ref.watch(pageControllerProvider),
      physics: const ClampingScrollPhysics(),
      onPageChanged: (index) => ref.read(onPageChangedProvider)(index),
      children: [
        if (appUsersOnMap.isEmpty)
          _wrapper(
            child: Center(
              child: Text('周辺にデータが見つかりません。', style: context.bodySmall),
            ),
          ),
        for (final appUser in appUsersOnMap)
          _wrapper(child: AppUserPageViewItem(appUser: appUser)),
      ],
    );
  }

  /// PageViewItem を囲む Container ウィジェット。
  static Widget _wrapper({required Widget child}) => Container(
        margin:
            const EdgeInsets.symmetric(horizontal: _pageViewHorizontalMargin),
        padding: const EdgeInsets.symmetric(
          horizontal: _pageViewHorizontalPadding,
          vertical: _pageViewVerticalPadding,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(_pageViewBorderRadius)),
        ),
        child: child,
      );
}

/// PageView のひとつひとつのウィジェット。
class AppUserPageViewItem extends HookConsumerWidget {
  const AppUserPageViewItem({
    super.key,
    required this.appUser,
  });

  final AppUser appUser;

  static const double pageViewImageBorderRadius = 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed<void>(
        context,
        AppUserDetailPage.location(appUserId: appUser.appUserId),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(pageViewImageBorderRadius),
                child: Image.network(appUser.imageUrl),
              ),
            ),
          ),
          const Gap(8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appUser.appUserId,
                  style: context.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Gap(4),
                Text(
                  appUser.comment,
                  style: context.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    ContactButton(partnerId: appUser.appUserId),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
