// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubIssue _$$_GithubIssueFromJson(Map<String, dynamic> json) =>
    _$_GithubIssue(
      id: json['id'] as int? ?? 0,
      number: json['number'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      htmlUrl: json['html_url'] as String? ?? '',
      state: json['state'] as String? ?? '',
      description: json['description'] as String? ?? '',
      body: json['body'] as String? ?? '',
      comments: json['comments'] as int? ?? 0,
      assignee: json['assignee'] as String?,
      assignees: (json['assignees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
    );

Map<String, dynamic> _$$_GithubIssueToJson(_$_GithubIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'html_url': instance.htmlUrl,
      'state': instance.state,
      'description': instance.description,
      'body': instance.body,
      'comments': instance.comments,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
    };
