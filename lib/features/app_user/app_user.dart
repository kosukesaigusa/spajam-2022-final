import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_user.dart';
import '../../repositories/firestore/app_user_repository.dart';

/// 指定した userId の AppUser ドキュメントを購読する StreamProvider
final appUserStreamProvider =
    StreamProvider.autoDispose.family<AppUser?, String>((ref, userId) {
  return ref
      .read(appUserRepositoryProvider)
      .subscribeAppUser(appUserId: userId);
});

/// 指定した userId の AppUser ドキュメントを取得する FutureProvider
final appUserFutureProvider =
    FutureProvider.autoDispose.family<AppUser?, String>((ref, userId) {
  return ref.read(appUserRepositoryProvider).fetchAppUser(appUserId: userId);
});
