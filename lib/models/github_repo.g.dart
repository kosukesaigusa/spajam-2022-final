// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repo _$$_RepoFromJson(Map<String, dynamic> json) => _$_Repo(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      owner: json['owner'] == null
          ? Owner.defaultValue
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      stargazersCount: json['stargazers_count'] as int? ?? 0,
      forksCount: json['forks_count'] as int? ?? 0,
      watchersCount: json['watchers_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$_RepoToJson(_$_Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
      'watchers_count': instance.watchersCount,
    };
