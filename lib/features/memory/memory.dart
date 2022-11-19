import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/memory.dart';
import '../../repositories/firebase_storage_repository.dart';
import '../../repositories/firestore/memory_repository.dart';
import '../../utils/exceptions/base.dart';
import '../../utils/firestore_refs.dart';
import '../../utils/image_picker_service.dart';
import '../../utils/loading.dart';
import '../../utils/scaffold_messenger_service.dart';
import '../../utils/uuid.dart';
import '../auth/auth.dart';

final uploadedImageUrlProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final createMemoryProvider = Provider<
    Future<void> Function({
  required String comment,
  required String chatRoomId,
})>(
  (ref) {
    return ({
      required comment,
      required chatRoomId,
    }) async {
      try {
        ref.read(overlayLoadingProvider.notifier).update((state) => true);
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
        final currentUserId = ref.watch(userIdProvider).value;
        if (currentUserId == null) {
          throw const AppException(message: 'サインインが必要です。');
        }
        final attendingChatRoomDoc = await attendingChatRoomRef(
          appUserId: currentUserId,
          chatRoomId: chatRoomId,
        ).get();
        final partnerId = attendingChatRoomDoc.data()?.partnerId;
        if (partnerId == null) {
          throw const AppException(message: 'パートナーが見つかりません。');
        }
        final memory = Memory(
          memoryId: uuid,
          partnerId: partnerId,
          imageUrl: imageUrl,
          comment: comment,
        );
        await ref.read(memoryRepositoryProvider).setMemory(memory: memory);
      } on Exception catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((state) => false);
      }
    };
  },
);
