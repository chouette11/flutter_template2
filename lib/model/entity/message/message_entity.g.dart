// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageEntity _$$_MessageEntityFromJson(Map<String, dynamic> json) =>
    _$_MessageEntity(
      content: json['content'] as String,
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isQuestion: json['isQuestion'] as bool?,
    );

Map<String, dynamic> _$$_MessageEntityToJson(_$_MessageEntity instance) =>
    <String, dynamic>{
      'content': instance.content,
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
      'isQuestion': instance.isQuestion,
    };
