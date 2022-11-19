import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/auth.dart';
import '../../features/message/attending_chat_room.dart';
import '../../repositories/firestore/chat_room_repository.dart';
import '../../utils/exceptions/common.dart';
import '../chat_room_page.dart';

class ContactButton extends HookConsumerWidget {
  const ContactButton({
    super.key,
    required this.partnerId,
    this.chatButtonLabel,
  });

  final String partnerId;
  final String? chatButtonLabel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
            .watch(
          matchAttendingChatRoomProvider(partnerId),
        )
            .whenData(
          (attendingChatRooms) {
            if (attendingChatRooms.isEmpty) {
              return ElevatedButton(
                onPressed: () async {
                  final appUserId = ref.watch(userIdProvider).value;
                  if (appUserId == null) {
                    throw const SignInRequiredException();
                  }
                  final chatRmId =
                      await ref.read(chatRoomRepositoryProvider).createChatRoom(
                            appUserId: appUserId,
                            partnerId: partnerId,
                          );
                  await Navigator.pushNamed<void>(
                    context,
                    ChatRoomPage.location(
                      chatRoomId: chatRmId,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  '連絡',
                ),
              );
            } else {
              if (chatButtonLabel == null) {
                return IconButton(
                  onPressed: () {
                    Navigator.pushNamed<void>(
                      context,
                      ChatRoomPage.location(
                        chatRoomId: attendingChatRooms.first.chatRoomId,
                      ),
                    );
                  },
                  icon: const Icon(Icons.chat),
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed<void>(
                      context,
                      ChatRoomPage.location(
                        chatRoomId: attendingChatRooms.first.chatRoomId,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: Text(chatButtonLabel!),
                );
              }
            }
          },
        ).value ??
        Container();
  }
}
