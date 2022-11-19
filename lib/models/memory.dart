import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_converters/union_timestamp.dart';

part 'memory.freezed.dart';
part 'memory.g.dart';

@freezed
class Memory with _$Memory {
  factory Memory({
    required String memoryId,
    required String appUserId,
    required String imageUrl,
    @Default('') String comment,
    @unionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp createdAt,
  }) = _Memory;

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);
}
