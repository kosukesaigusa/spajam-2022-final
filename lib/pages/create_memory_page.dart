import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/memory/memory.dart';
import 'chat_room_page.dart';

class CreateMemoryPage extends StatefulHookConsumerWidget {
  const CreateMemoryPage({super.key});

  static const path = '/create-memory/:chatRoomId';
  static const name = 'CreateMemoryPage';
  static String location({required String chatRoomId}) =>
      '/create-memory/$chatRoomId';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateMemoryPageState();
}

class _CreateMemoryPageState extends ConsumerState<CreateMemoryPage> {
  final confettiController =
      ConfettiController(duration: const Duration(minutes: 10));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentController = useTextEditingController();
    final uploadedImageUrl = ref.watch(uploadedImageUrlProvider);
    final chatRoomId = ref.watch(chatRoomIdProvider);
    final displaySize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Memory'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: displaySize.width * 0.9,
                  height: displaySize.height * 0.4,
                  child: Card(
                    elevation: 30,
                    child: uploadedImageUrl.isEmpty
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              IconButton(
                                iconSize: 100,
                                onPressed: () async {
                                  await ref.read(uploadImageProvider).call();
                                  confettiController.play();
                                },
                                icon: const Icon(Icons.add_a_photo),
                              ),
                              if (ref.watch(isUploadingProvider))
                                const CircularProgressIndicator(),
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              uploadedImageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Memory Title',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await ref.read(createMemoryProvider).call(
                          comment: commentController.text,
                          chatRoomId: chatRoomId,
                        );
                    // if (result == true) {
                    //   confettiController.play();
                    //   await Future.delayed(const Duration(seconds: 10), () {
                    //     Navigator.of(context).pop();
                    //   });
                    // }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
          Container(
            // padding: const EdgeInsets.all(30),
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: pi / 2,
              emissionFrequency: 0.1,
              numberOfParticles: 5,
              maxBlastForce: 15,
              minBlastForce: 1,
              shouldLoop: true,
              gravity: 0.1,
              maximumSize: const Size(15, 15),
              minimumSize: const Size(10, 10),
            ),
          )
        ],
      ),
    );
  }
}
