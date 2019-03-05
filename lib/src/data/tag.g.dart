// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
      name: json['name'] as String,
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      history: (json['history'] as List)
          ?.map((e) =>
              e == null ? null : History.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      day: DateTime.parse(json['day'] as String),
      uses: History._stringToInt(json['uses'] as String),
      accounts: History._stringToInt(json['accounts'] as String));
}
