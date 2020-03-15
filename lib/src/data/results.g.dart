// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    accounts: (json['accounts'] as List)
        .map((e) => Account.fromJson(e as Map<String, dynamic>))
        .toList(),
    statuses: (json['statuses'] as List)
        .map((e) => Status.fromJson(e as Map<String, dynamic>))
        .toList(),
    hashtags: (json['hashtags'] as List)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
