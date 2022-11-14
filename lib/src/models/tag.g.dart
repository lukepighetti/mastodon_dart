// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
      url: Uri.parse(json['url'] as String),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      day: DateTime.parse(json['day'] as String),
      uses: History._stringToInt(json['uses'] as String),
      accounts: History._stringToInt(json['accounts'] as String),
    );
