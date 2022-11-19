import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/auth/auth.dart';
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
            ),
          ),
          const Gap(8),
          TextButton(
            onPressed: () {
              ref
                  .watch(scaffoldMessengerServiceProvider)
                  .showModalBottomSheetByBuilder<Widget>(
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(16),
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
                          child: Text('test${i + 1}@example.com でログイン'),
                        ),
                    ],
                  );
                },
              );
            },
            child: const Text('テストアカウントでサインイン'),
          )
        ],
      ),
    );
  }
}
