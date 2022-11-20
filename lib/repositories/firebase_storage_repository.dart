import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
      final compressedData = await _compressImageFromList(uint8list);
      final uploadTask = storageRef.putData(compressedData);
      final snapshot = await Future.value(uploadTask);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException {
      rethrow;
    }
  }

  static Future<Uint8List> _compressImageFromList(
    Uint8List data, {
    int limitSize = 204800,
  }) async {
    if (data.lengthInBytes <= limitSize) {
      return data;
    }

    final qualities = <int>[90, 80, 70, 60, 50, 40, 30, 20, 10, 5];
    try {
      late Uint8List bytes;

      for (final q in qualities) {
        final compressedBytes = await FlutterImageCompress.compressWithList(
          data,
          minHeight: 200,
          minWidth: 200,
          quality: q,
        );

        if (compressedBytes.lengthInBytes <= limitSize) {
          bytes = compressedBytes;
          break;
        }
        if (q == qualities.last) {
          bytes = compressedBytes;
        }
      }

      return bytes;
    } on Exception catch (e, stackTrace) {
      throw Exception('画像の圧縮に失敗しました。error: $e, stackTrace: $stackTrace');
    }
  }
}
