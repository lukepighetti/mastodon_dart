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

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'default_posting_visibility':
          _$PostingVisibilityEnumMap[instance.defaultPostingVisibility]!,
      'is_sensitive_by_default': instance.isSensitiveByDefault,
      'default_language': instance.defaultLanguage,
      'media_defaults': _$MediaDefaultsEnumMap[instance.mediaDefaults]!,
      'expand_spoilers_by_default': instance.expandSpoilersByDefault,
    };

const _$PostingVisibilityEnumMap = {
  PostingVisibility.public: 'public',
  PostingVisibility.unlisted: 'unlisted',
  PostingVisibility.private: 'private',
  PostingVisibility.direct: 'direct',
};

const _$MediaDefaultsEnumMap = {
  MediaDefaults.defaultSensitive: 'default_sensitive',
  MediaDefaults.showAll: 'show_all',
  MediaDefaults.hideAll: 'hide_all',
};
