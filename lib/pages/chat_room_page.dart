import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomPage extends HookConsumerWidget {
  const ChatRoomPage({super.key});

  static const path = '/chatRoom/:chatRoomId';
  static const name = 'ChatRoomPage';
  static String location({required String chatRoomId}) => '/chatRoom/$chatRoomId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox();
  }
}
