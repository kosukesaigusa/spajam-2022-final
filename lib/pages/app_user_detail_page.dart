import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/app_user/app_user.dart';
import '../models/app_user.dart';
import '../utils/exceptions/base.dart';
import '../utils/routing/app_router_state.dart';

final _appUserIdProvider = Provider.autoDispose<String>(
  (ref) {
    final state = ref.watch(appRouterStateProvider);
    final appUserId = state.params['appUserId'];
    if (appUserId == null) {
      throw const AppException(message: 'ユーザーが見つかりませんでした。');
    }
    return appUserId;
  },
  dependencies: [
    extractExtraDataProvider,
    appRouterStateProvider,
  ],
);

class AppUserDetailPage extends HookConsumerWidget {
  const AppUserDetailPage({super.key});

  static const path = '/appUser/:appUserId';
  static const name = 'AppUserDetailPage';
  static String location({required String appUserId}) => '/appUser/$appUserId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ref
            .watch(
          appUserFutureProvider(
            ref.watch(_appUserIdProvider),
          ),
        )
            .when(
          data: (user) {
            print(user);
            return UserView(user: user!);
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (error, stack) {
            return Center(child: Text(error.toString()));
          },
        ),
      ),
    );
  }
}

class UserView extends HookConsumerWidget {
  const UserView({super.key, required this.user});
  final AppUser user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            const Text('名前: '),
            Text(user.name),
          ],
        ),
        Row(
          children: [
            const Text('国: '),
            Text(user.country.name),
          ],
        ),
        Row(
          children: [
            const Text('国旗: '),
            Text(user.flags.map((e) => e.name).toList().join()),
          ],
        ),
      ],
    );
  }
}
