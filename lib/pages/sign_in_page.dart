import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/auth.dart';
import '../utils/extensions/build_context.dart';
import '../utils/scaffold_messenger_service.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  static const path = '/signIn';
  static const name = 'SignInPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サインイン'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SignInButton(
              Buttons.Google,
              text: 'Google でサインイン',
              onPressed: () async {
                try {
                  await ref.read(googleSignInProvider)();
                  Navigator.pop(context);
                  ref
                      .read(
                        scaffoldMessengerServiceProvider,
                      )
                      .showSnackBar('ログインしました。');
                } on Exception catch (e) {
                  ref
                      .read(
                        scaffoldMessengerServiceProvider,
                      )
                      .showSnackBarByException(e);
                }
              },
            ),
          ),
          const Gap(8),
          TextButton(
            onPressed: () {
              ref.watch(scaffoldMessengerServiceProvider).showModalBottomSheetByBuilder<Widget>(
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(32),
                      for (var i = 0; i < 5; i++)
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await ref.read(signInAsTestUserProvider(i + 1))();
                            // try {
                            //   Navigator.pop(context);
                            //   ref.read(overlayLoadingProvider.notifier).update((state) => true);
                            //   await ref.read(signInAsTestUserProvider(i + 1))();
                            // } finally {
                            //   ref.read(overlayLoadingProvider.notifier).update((state) => false);
                            // }
                          },
                          child: Text('ユーザー ${i + 1} でログイン'),
                        ),
                      const Gap(32),
                    ],
                  );
                },
              );
            },
            child: Text(
              'テストアカウントでサインイン',
              style: context.bodySmall!.copyWith(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
