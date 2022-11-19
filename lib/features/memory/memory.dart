import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../repositories/firebase_storage_repository.dart';
import '../../utils/image_picker_service.dart';
import '../../utils/loading.dart';
import '../../utils/scaffold_messenger_service.dart';

final createMemoryProvider = Provider<Future<void> Function()>(
  (ref) {
    return () async {
      try {
        ref.read(overlayLoadingProvider.notifier).update((state) => true);
        final pickedImage =
            await ref.read(imagePickerServiceProvider).getImage();
        if (pickedImage == null) {
          return;
        }
        await ref.read(firebaseStorageRepositoryProvider).upload(
              path: pickedImage.name,
              uint8list: await pickedImage.readAsBytes(),
            );
        // TODO(shimizu-saffle): Firestore に保存する
      } on Exception catch (e) {
        ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
      } finally {
        ref.read(overlayLoadingProvider.notifier).update((state) => false);
      }
    };
  },
);
