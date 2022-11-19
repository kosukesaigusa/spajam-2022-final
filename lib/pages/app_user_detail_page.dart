import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/app_user/app_user.dart';
import '../features/auth/auth.dart';
import '../models/app_user.dart';
import '../utils/enums/country.dart';
import '../utils/exceptions/base.dart';
import '../utils/routing/app_router_state.dart';
import 'widgets/contact_button.dart';

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
        padding: const EdgeInsets.all(16),
        child: ref
            .watch(
          appUserFutureProvider(
            ref.watch(_appUserIdProvider),
          ),
        )
            .when(
          data: (user) {
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CircleAvatar(
          radius: 80,
          foregroundImage: NetworkImage(user.imageUrl),
        ),
        Row(
          children: [
            const Text('名前: '),
            Text(user.name),
          ],
        ),
        Row(
          children: [
            const Text('国: '),
            user.country.icon(
              width: 50,
              height: 50,
            ),
          ],
        ),
        if (user.flags.isNotEmpty)
          Row(
            children: [
              const Text('国旗: '),
              Expanded(
                child: Wrap(
                  children: user.flags
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: e.icon(
                            width: 50,
                            height: 50,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          )
        else
          const Text('まだ交流した人はいません。'),
        if (user.comment.isNotEmpty)
          Row(
            children: [
              const Text('一言: '),
              Text(user.comment),
            ],
          ),
        if (user.appUserId != ref.watch(userIdProvider).value)
          ContactButton(
            partnerId: user.appUserId,
            chatButtonLabel: 'メッセージを送る',
          ),
      ],
    );
  }
}
