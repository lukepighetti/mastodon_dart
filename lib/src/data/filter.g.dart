// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      id: json['id'] as String,
      phrase: json['phrase'] as String,
      context: (json['context'] as List<dynamic>)
          .map((e) => $enumDecode(_$FilterContextEnumMap, e))
          .toList(),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      irreversible: json['irreversible'] as bool,
      wholeWord: json['whole_word'] as bool,
    );

const _$FilterContextEnumMap = {
  FilterContext.home: 'home',
  FilterContext.notifications: 'notifications',
  FilterContext.public: 'public',
  FilterContext.thread: 'thread',
};
