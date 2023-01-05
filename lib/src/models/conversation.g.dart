// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastStatus: json['last_status'] == null
          ? null
          : Status.fromJson(json['last_status'] as Map<String, dynamic>),
      unread: json['unread'] as bool,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accounts': instance.accounts,
      'unread': instance.unread,
      'last_status': instance.lastStatus,
    };
