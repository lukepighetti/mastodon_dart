// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return UserPreferences(
    defaultPostingVisibility: _$enumDecode(
        _$PostingVisibilityEnumMap, json['default_posting_visibility']),
    isSensitiveByDefault: json['is_sensitive_by_default'] as bool,
    defaultLanguage: json['default_language'],
    mediaDefaults: _$enumDecode(_$MediaDefaultsEnumMap, json['media_defaults']),
    expandSpoilersByDefault: json['expand_spoilers_by_default'] as bool,
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$PostingVisibilityEnumMap = {
  PostingVisibility.public: 'public',
  PostingVisibility.unlisted: 'unlisted',
  PostingVisibility.private: 'private',
  PostingVisibility.direct: 'direct',
};

const _$MediaDefaultsEnumMap = {
  MediaDefaults.defaultSensitive: 'defaultSensitive',
  MediaDefaults.show_all: 'show_all',
  MediaDefaults.hide_all: 'hide_all',
};
