import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/auth.dart';
import '../../models/memory.dart';
import '../../utils/exceptions/base.dart';
import '../../utils/firestore_refs.dart';

final memoryRepositoryProvider = Provider<MemoryRepository>((ref) {
  return MemoryRepository(ref);
});

class MemoryRepository {
  MemoryRepository(this._ref);
  final Ref _ref;

  /// 指定したユーザーの Todo を作成する。
  Future<void> setMemory({
    required Memory memory,
    SetOptions? setOptions,
  }) async {
    final userId = _ref.watch(userIdProvider).value;
    if (userId == null) {
      throw const AppException(message: 'サインインが必要です。');
    }
    await memoryRef(
      memoryId: memory.memoryId,
      appUserId: userId,
    ).set(memory, setOptions);
  }
}
