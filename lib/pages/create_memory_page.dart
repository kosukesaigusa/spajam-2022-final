import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/memory/memory.dart';
import 'chat_room_page.dart';

class CreateMemoryPage extends HookConsumerWidget {
  const CreateMemoryPage({super.key});

  static const path = '/create-memory/:chatRoomId';
  static const name = 'CreateMemoryPage';
  static String location({required String chatRoomId}) =>
      '/create-memory/$chatRoomId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final uploadedImageUrl = ref.watch(uploadedImageUrlProvider);
    final chatRoomId = ref.watch(chatRoomIdProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Card(
                elevation: 30,
                child: Center(
                  child: uploadedImageUrl.isEmpty
                      ? IconButton(
                          iconSize: 100,
                          onPressed: () async {
                            await ref.read(createMemoryProvider).call(
                                  comment: commentController.text,
                                  chatRoomId: chatRoomId,
                                );
                          },
                          icon: const Icon(Icons.add_a_photo),
                        )
                      : Image.network(uploadedImageUrl),
                ),
              ),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextField(
                controller: commentController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Memory Title',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
