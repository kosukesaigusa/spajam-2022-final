import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_user.dart';
import '../../models/firestore_position.dart';
import '../../utils/firestore_refs.dart';
import '../../utils/logger.dart';

final appUserRepositoryProvider = Provider.autoDispose((_) => AppUserRepository());

class AppUserRepository {
  /// 指定した AppUser を取得する。
  Future<AppUser?> fetchAppUser({
    required String appUserId,
  }) async {
    final ds = await appUserRef(appUserId: appUserId).get();
    if (!ds.exists) {
      logger.warning('Document not found: ${ds.reference.path}');
      return null;
    }
    return ds.data()!;
  }

  /// 指定した AppUser を購読する。
  Stream<AppUser?> subscribeAppUser({
    required String appUserId,
  }) {
    final docStream = appUserRef(appUserId: appUserId).snapshots();
    return docStream.map((ds) => ds.data());
  }

  /// 指定した userId のユーザーを作成する。
  /// 通知を受け取るために必要な fcmToken も登録する。
  Future<void> createUser(AppUser appUser) async {
    await appUserRef(appUserId: appUser.appUserId).set(appUser);
  }

  /// 指定した userId のユーザーの fcmToken を更新する。
  Future<void> updateUserFcmToken({
    required String appUserId,
    String? fcmToken,
  }) async {
    if (fcmToken == null) {
      return;
    }
    await appUserRef(appUserId: appUserId).update(
      <String, dynamic>{
        'fcmTokens': <String>[fcmToken]
      },
    );
  }

  /// 指定した userId のユーザーの location を更新する。
  Future<void> updateLocation({
    required String appUserId,
    FirestorePosition? location,
  }) async {
    if (location == null) {
      return;
    }
    await appUserRef(appUserId: appUserId).update(
      <String, dynamic>{
        'location': location.toJson(),
      },
    );
  }
}
