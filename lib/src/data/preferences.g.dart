// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      defaultPostingVisibility: $enumDecode(
          _$PostingVisibilityEnumMap, json['default_posting_visibility']),
      isSensitiveByDefault: json['is_sensitive_by_default'] as bool,
      defaultLanguage: json['default_language'],
      mediaDefaults:
          $enumDecode(_$MediaDefaultsEnumMap, json['media_defaults']),
      expandSpoilersByDefault: json['expand_spoilers_by_default'] as bool,
    );

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
