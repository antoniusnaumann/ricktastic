import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'episode.g.dart';

@JsonSerializable(explicitToJson: false, fieldRename: FieldRename.snake)
class Episode implements Entity {
  @override final int id;
  final String name;
  final String? airDate;
  @JsonKey(name: 'episode')
  final String code;
  @JsonKey(name: 'characters')
  final List<String>? characterUrls;
  final String url;
  final String created;

  Episode({
    required this.id,
    required this.name,
    this.airDate,
    required this.code,
    this.characterUrls,
    required this.url,
    required this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}