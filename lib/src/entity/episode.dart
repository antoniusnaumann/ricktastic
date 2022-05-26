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

  int? get season => code.season;
  int? get episode => code.episode;

  bool operator<(Episode other) => code < other.code;
  bool operator>(Episode other) => code > other.code;
  bool operator<=(Episode other) => code <= other.code;
  bool operator>=(Episode other) => code >= other.code;
}

extension EpisodeCode on String {
  int? get season => length >= 3 ? int.tryParse(substring(1, 3)) : null;
  int? get episode => length >= 6 ? int.tryParse(substring(4, 6)) : null;

  get isCodeValid => season != null && episode != null;

  bool operator<(String? otherCode) { 
    if (otherCode == null || !otherCode.isCodeValid) return false;
    if (!isCodeValid) return true;

    return season! < otherCode.season! || (season == otherCode.season && episode! < otherCode.episode!);
  }
  bool operator>(String? otherCode) => otherCode == null ? true : otherCode < this;
  bool operator<=(String? otherCode) => this < otherCode || this == otherCode;
  bool operator>=(String? otherCode) => this > otherCode || this == otherCode;
}