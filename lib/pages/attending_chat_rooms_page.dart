import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/app_user/app_user.dart';
import '../features/auth/auth.dart';
import '../features/message/attending_chat_room.dart';
import '../models/attending_chat_room.dart';
import '../utils/extensions/build_context.dart';
import '../utils/extensions/date_time.dart';
import '../utils/loading.dart';
import '../widgets/empty_placeholder.dart';
import '../widgets/image.dart';
import 'chat_room_page.dart';

class AttendingChatRoomsPage extends HookConsumerWidget {
  const AttendingChatRoomsPage({super.key});

  static const path = '/attendingChatRooms';
  static const name = 'AttendingChatRoomsPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('メッセージ')),
      body: ref.watch(attendingChatRoomsProvider).when(
            data: (attendingChatRooms) => attendingChatRooms.isEmpty
                ? const EmptyPlaceholderWidget(
                    widget: FaIcon(
                      FontAwesomeIcons.solidComment,
                      size: 48,
                      color: Colors.black45,
                    ),
                    message: 'まだメッセージしている相手がいません。',
                  )
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        AttendingChatRoomWidget(attendingChatRoom: attendingChatRooms[index]),
                    itemCount: attendingChatRooms.length,
                  ),
            error: (e, __) => EmptyPlaceholderWidget(message: e.toString()),
            loading: () => const PrimarySpinkitCircle(),
          ),
    );
  }
}

/// AttendingChatRoom ページのひとつひとつのウィジェット。
class AttendingChatRoomWidget extends HookConsumerWidget {
  const AttendingChatRoomWidget({
    super.key,
    required this.attendingChatRoom,
  });

  final AttendingChatRoom attendingChatRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider).value;
    return userId != null
        ? InkWell(
            onTap: () async {
              // 非同期的に lastReadAt を更新する
              // unawaited(
              //   ref
              //       .read(messageRepositoryProvider)
              //       .readStatusRef(chatRoomId: attendingChatRoom.chatRoomId, readStatusId: userId)
              //       .set(const ReadStatus(), SetOptions(merge: true)),
              // );
              await Navigator.pushNamed<void>(
                context,
                ChatRoomPage.location(chatRoomId: attendingChatRoom.chatRoomId),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  AttendingChatRoomPartnerImageWidget(partnerId: attendingChatRoom.partnerId),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AttendingChatRoomPartnerNameWidget(partnerId: attendingChatRoom.partnerId),
                        const Gap(4),
                        AttendingChatRoomLatestMessageWidget(
                          chatRoomId: attendingChatRoom.chatRoomId,
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      // LatestMessageCreatedAtWidget(chatRoomId: attendingChatRoom.chatRoomId),
                      Gap(4),
                      // UnreadCountBadgeWidget(chatRoomId: attendingChatRoom.chatRoomId),
                    ],
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}

/// 参加中のチャットルームの相手の画像を表示するウィジェット。
class AttendingChatRoomPartnerImageWidget extends HookConsumerWidget {
  const AttendingChatRoomPartnerImageWidget({
    super.key,
    required this.partnerId,
  });

  final String partnerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appUserStreamProvider(partnerId)).when(
          data: (appUser) => appUser == null
              ? const CircleImagePlaceholder(diameter: 48)
              : CircleImageWidget(diameter: 48, imageURL: appUser.imageUrl),
          error: (_, __) => const CircleImagePlaceholder(diameter: 48),
          loading: () => const CircleImagePlaceholder(diameter: 48),
        );
  }
}

/// 参加中のチャットルームの相手の名前を表示するウィジェット。
class AttendingChatRoomPartnerNameWidget extends HookConsumerWidget {
  const AttendingChatRoomPartnerNameWidget({
    super.key,
    required this.partnerId,
  });

  final String partnerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(appUserStreamProvider(partnerId)).when(
          data: (appUser) => Text(
            appUser == null ? '-' : appUser.name,
            style: context.titleLarge,
          ),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const SizedBox(),
        );
  }
}

/// 参加中のチャットルームの直近のメッセージを表示するウィジェット。
class AttendingChatRoomLatestMessageWidget extends HookConsumerWidget {
  const AttendingChatRoomLatestMessageWidget({
    super.key,
    required this.chatRoomId,
  });

  final String chatRoomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(latestMessageOfRoomProvider(chatRoomId));
    return Text(
      message == null ? 'ルームが作成されました。' : message.message,
      style: context.bodySmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

/// 直近のメッセージの日時を表示するウィジェット。
class LatestMessageCreatedAtWidget extends HookConsumerWidget {
  const LatestMessageCreatedAtWidget({
    super.key,
    required this.chatRoomId,
  });

  final String chatRoomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(latestMessageOfRoomProvider(chatRoomId));
    if (message == null) {
      return const SizedBox();
    }
    return Text(
      humanReadableDateTimeString(message.createdAt.dateTime),
      style: context.bodySmall,
    );
  }
}

/// 未読数カウントのバッジウィジェット。
// class UnreadCountBadgeWidget extends HookConsumerWidget {
//   const UnreadCountBadgeWidget({
//     super.key,
//     required this.chatRoomId,
//   });

//   final String chatRoomId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(unreadCountProvider(chatRoomId)).when(
//           data: (count) => count > 0
//               ? Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: context.theme.primaryColor,
//                   ),
//                   child: Center(
//                     child: Text(
//                       count > 9 ? '9+' : count.toString(),
//                       style: context.titleSmall!.copyWith(color: Colors.white),
//                     ),
//                   ),
//                 )
//               : const SizedBox(width: 20, height: 20),
//           error: (_, __) => const SizedBox(width: 20, height: 20),
//           loading: () => const SizedBox(width: 20, height: 20),
//         );
//   }
// }
