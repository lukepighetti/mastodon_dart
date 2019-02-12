// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      day: DateTime.parse(json['day'] as String),
      uses: json['uses'] as int,
      accounts: json['accounts'] as int);
}
