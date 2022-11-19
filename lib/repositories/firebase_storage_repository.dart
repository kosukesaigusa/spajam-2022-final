import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseStorageRepositoryProvider =
    Provider<FirebaseStorageRepository>((ref) => FirebaseStorageRepository());

class FirebaseStorageRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// image_pickerによって取得したXFileから変換したバイトデータをFirebaseStorageにアップロードし、downloadURLを返す。
  Future<String> upload({
    required String path,
    required Uint8List uint8list,
  }) async {
    final storageRef = _firebaseStorage.ref().child(path);
    try {
      final uploadTask = storageRef.putData(uint8list);
      final snapshot = await Future.value(uploadTask);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException {
      rethrow;
    }
  }
}
