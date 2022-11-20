import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/memory.dart';
import '../../repositories/firebase_storage_repository.dart';
import '../../repositories/firestore/attending_chat_room.dart';
import '../../repositories/firestore/memory_repository.dart';
import '../../utils/exceptions/base.dart';
import '../../utils/image_picker_service.dart';
import '../../utils/loading.dart';
import '../../utils/scaffold_messenger_service.dart';
import '../../utils/uuid.dart';
import '../auth/auth.dart';

final uploadedImageUrlProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final isUploadingProvider = StateProvider<bool>((ref) {
  return false;
});

final createMemoryProvider = Provider<
    Future<bool?> Function({
  required String comment,
  required String chatRoomId,
})>(
  (ref) {
    return ({
      required comment,
      required chatRoomId,
    }) async {
      try {
        final currentUserId = ref.watch(userIdProvider).value;
        if (currentUserId == null) {
          throw const AppException(message: 'サインインが必要です。');
        }
        ref.read(overlayLoadingProvider.notifier).update((state) => true);
        final attendingChatRoom = await ref
            .read(attendingChatRoomRepositoryProvider)
            .fetchAttendingChatRoom(
              appUserId: currentUserId,
              chatRoomId: chatRoomId,
            );
        final partnerId = attendingChatRoom?.partnerId;
        if (partnerId == null) {
          throw const AppException(message: 'パートナーが見つかりません。');
        }
        final uploadedImage = ref.read(uploadedImageUrlProvider);
        if (uploadedImage.isEmpty) {
          throw const AppException(message: '思い出の写真を選択しましょう😌');
        }
        final memory = Memory(
          memoryId: uuid,
          partnerId: partnerId,
          imageUrl: uploadedImage,
          comment: comment,
        );
        await ref.read(memoryRepositoryProvider).setMemory(memory: memory);
        ref.read(scaffoldMessengerServiceProvider).showSnackBar('思い出を作成しました🙌');
      } on Exception catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
        return false;
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((state) => false);
      }
      return true;
    };
  },
);

final uploadImageProvider = Provider<Future<void> Function()>(
  (ref) {
    return () async {
      ref.read(isUploadingProvider.notifier).update((state) => true);
      try {
        final pickedImage =
            await ref.read(imagePickerServiceProvider).getImage();
        if (pickedImage == null) {
          return;
        }
        final imageUrl =
            await ref.read(firebaseStorageRepositoryProvider).upload(
                  path: pickedImage.name,
                  uint8list: await pickedImage.readAsBytes(),
                );
        ref.read(uploadedImageUrlProvider.notifier).update((state) => imageUrl);
      } on Exception catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
      } finally {
        ref.read(isUploadingProvider.notifier).update((state) => false);
      }
    };
  },
);

final memoriesProvider = FutureProvider<List<Memory>>((ref) async {
  return ref.watch(memoryRepositoryProvider).fetchMemories();
});
