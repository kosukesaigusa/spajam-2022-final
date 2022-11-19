import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/memory.dart';
import '../../repositories/firebase_storage_repository.dart';
import '../../repositories/firestore/memory_repository.dart';
import '../../utils/image_picker_service.dart';
import '../../utils/loading.dart';
import '../../utils/scaffold_messenger_service.dart';
import '../../utils/uuid.dart';

final createMemoryProvider = Provider<
    Future<void> Function({
  required String comment,
})>(
  (ref) {
    return ({
      required comment,
    }) async {
      try {
        ref.read(overlayLoadingProvider.notifier).update((state) => true);
        final pickedImage =
            await ref.read(imagePickerServiceProvider).getImage();
        if (pickedImage == null) {
          return;
        }
        // TODO(shimizu-saffle): 動作確認
        final imageUrl =
            await ref.read(firebaseStorageRepositoryProvider).upload(
                  path: pickedImage.name,
                  uint8list: await pickedImage.readAsBytes(),
                );
        final memory = Memory(
          memoryId: uuid,
          // TODO(shimizu-saffle): 引数を渡す
          partnerId: '',
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
