// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
      name: json['name'] as String,
      website: json['website'] == null
          ? null
          : Uri.parse(json['website'] as String));
}
