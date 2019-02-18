// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
      name: json['name'] as String,
      website:
          json['website'] == null ? null : Uri.parse(json['website'] as String),
      history: (json['history'] as List)
          ?.map((e) =>
              e == null ? null : History.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      day: DateTime.parse(json['day'] as String),
      uses: json['uses'] as int,
      accounts: json['accounts'] as int);
}
