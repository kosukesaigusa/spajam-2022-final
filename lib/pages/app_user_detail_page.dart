import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppUserDetailPage extends HookConsumerWidget {
  const AppUserDetailPage({super.key});

  static const path = '/appUser/:appUserId';
  static const name = 'AppUserDetailPage';
  static String location({required String appUserId}) => '/appUser/$appUserId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox();
  }
}
