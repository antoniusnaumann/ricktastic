// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      id: json['id'] as int,
      name: json['name'] as String,
      airDate: json['air_date'] as String?,
      code: json['episode'] as String,
      characterUrls: (json['characters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'air_date': instance.airDate,
      'episode': instance.code,
      'characters': instance.characterUrls,
      'url': instance.url,
      'created': instance.created,
    };
