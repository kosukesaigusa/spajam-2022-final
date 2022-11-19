// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_issue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostIssueResponse _$$_PostIssueResponseFromJson(Map<String, dynamic> json) =>
    _$_PostIssueResponse(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      issue: json['issue'] == null
          ? Issue.defaultValue
          : Issue.fromJson(json['issue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostIssueResponseToJson(
        _$_PostIssueResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'issue': instance.issue,
    };
