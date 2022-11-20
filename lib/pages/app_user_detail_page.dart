import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/app_user/app_user.dart';
import '../features/auth/auth.dart';
import '../features/memory/memory.dart';
import '../models/app_user.dart';
import '../utils/enums/country.dart';
import '../utils/exceptions/base.dart';
import '../utils/extensions/build_context.dart';
import '../utils/routing/app_router_state.dart';
import '../utils/scaffold_messenger_service.dart';
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
      backgroundColor: const Color.fromARGB(255, 241, 233, 233),
      appBar: AppBar(
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
              : Container()
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
          SliverGrid.count(
            crossAxisCount: 3,
            children: ref.watch(memoriesProvider).when(
              data: (memories) {
                return memories
                    .map(
                      (e) => Image.network(
                        e.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList();
              },
              error: (error, stack) {
                return [];
              },
              loading: () {
                return [];
              },
            ),
          ), // ),
        ],
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
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Gap(40),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(user.imageUrl),
            ),
          ),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: context.displayMedium,
            ),
          ],
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Comment(comment: user.comment),
          ],
        ),
        const Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('住んでいる国'),
                  const Gap(16),
                  user.country.icon(
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
              const Gap(16),
              FlagsView(flags: user.flags),
            ],
          ),
        ),
        const Gap(24),
        ContactButtonView(
          userId: user.appUserId,
        ),
      ],
    );
  }
}

class ContactButtonView extends ConsumerWidget {
  const ContactButtonView({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userId != ref.watch(userIdProvider).value) {
      return SizedBox(
        width: 250,
        child: ContactButton(
          partnerId: userId,
          chatButtonLabel: 'メッセージを送る',
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class FlagsView extends ConsumerWidget {
  const FlagsView({super.key, required this.flags});

  final List<Country> flags;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (flags.isNotEmpty) {
      return Row(
        children: [
          const Text('国際交流'),
          const Gap(24),
          Expanded(
            child: Wrap(
              children: flags
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: e.icon(
                        width: 60,
                        height: 50,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return const Text('まだ交流した人はいません。');
    }
  }
}

class Comment extends ConsumerWidget {
  const Comment({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return comment.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              child: Text(
                comment,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
  }
}
