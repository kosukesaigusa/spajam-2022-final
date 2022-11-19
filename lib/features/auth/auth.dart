import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/app_user.dart';
import '../../repositories/firestore/app_user_repository.dart';
import '../../utils/enum/country.dart';
import '../../utils/exceptions/base.dart';
import '../../utils/extensions/list.dart';
import '../../utils/firebase_messaging.dart';
import '../../utils/firebase_options.dart';
import '../../utils/loading.dart';
import '../../utils/logger.dart';

final _authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(_authProvider).userChanges(),
);

final userIdProvider = Provider<AsyncValue<String?>>(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

final isSignedInProvider = Provider(
  (ref) => ref.watch(userIdProvider).whenData((userId) => userId != null),
);

/// test1@example.com 〜 test5@example.com
final signInAsTestUserProvider = Provider.autoDispose.family<Future<void> Function(), int>(
  (ref, userNumber) => () async {
    try {
      final userCredential = await ref.watch(_authProvider).signInWithEmailAndPassword(
            email: 'test$userNumber@example.com',
            password: '12345678',
          );
      final user = userCredential.user;
      if (user == null) {
        throw const AppException(message: 'Email とパスワードによるサインインに失敗しました。');
      }
      final fcmToken = await ref.read(getFcmTokenProvider)();
      await ref
          .read(appUserRepositoryProvider)
          .updateUserFcmToken(appUserId: user.uid, fcmToken: fcmToken);
    } on FirebaseException catch (e) {
      logger.warning(e.toString());
    } on AppException catch (e) {
      logger.warning(e.toString());
    }
  },
);

/// FirebaseAuth の匿名ログインを行って、そのユーザー ID でユーザードキュメントを作成する。
final signInAnonymouslyProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      final userCredential = await ref.watch(_authProvider).signInAnonymously();
      final user = userCredential.user;
      if (user == null) {
        throw const AppException(message: '匿名サインインに失敗しました。');
      }
      final fcmToken = await ref.read(getFcmTokenProvider)();
      // await ref.read(appUserRepositoryProvider).setUser(appUserId: user.uid, fcmToken: fcmToken);
    } on FirebaseException catch (e) {
      logger.warning(e.toString());
    } on AppException catch (e) {
      logger.warning(e.toString());
    }
  },
);

/// FirebaseAuth からログアウトする。
final signOutProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);
      await ref.watch(_authProvider).signOut();
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// Firebase Google SignIn からログインする。
final googleSignInProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);
      final googleUser = await GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      ).signIn();
      if (googleUser == null) {
        throw const AppException(message: 'Google サインインに失敗しました。');
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      final appUserId = FirebaseAuth.instance.currentUser?.uid;
      if (appUserId == null) {
        throw const AppException(message: 'Google サインインに失敗しました。');
      }
      final existingAppUser =
          await ref.read(appUserRepositoryProvider).fetchAppUser(appUserId: appUserId);
      // 新規作成のときのみ先に進む
      if (existingAppUser != null) {
        return;
      }
      final name = googleUser.displayName ?? '未設定';
      final imageUrl = googleUser.photoUrl ?? '';
      final country =
          Country.values.where((e) => e != Country.unknown).map((e) => e.name).toList().random;
      final fcmToken = await ref.read(getFcmTokenProvider)();
      final appUser = AppUser(
        appUserId: appUserId,
        name: name,
        imageUrl: imageUrl,
        country: country,
        comment: [
          '国際交流したいです！',
          'よろしくお願いします！',
          'Hello!',
          'Looking forward to seeing you:)',
        ].random,
        fcmTokens: fcmToken == null ? [] : [fcmToken],
      );
      await ref.read(appUserRepositoryProvider).createUser(appUser);
    } on Exception {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);
