// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetRepoResponse _$$_GetRepoResponseFromJson(Map<String, dynamic> json) =>
    _$_GetRepoResponse(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      repo: json['repo'] == null
          ? Repo.defaultValue
          : Repo.fromJson(json['repo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetRepoResponseToJson(_$_GetRepoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'repo': instance.repo,
    };
