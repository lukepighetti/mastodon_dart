// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      ancestors: (json['ancestors'] as List<dynamic>)
          .map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
      descendants: (json['descendants'] as List<dynamic>)
          .map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
