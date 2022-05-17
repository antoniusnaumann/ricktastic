import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: false)
class Character implements Entity {
  @override final int id;
  final String name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Location? location;
  final List<String>? episodes;
  final String image;
  final String url;
  final String created;

  const Character({
    required this.id,
    required this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.episodes,
    required this.image,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable(explicitToJson: false)
class Origin { 
  final String name;
  final String url;

  const Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable(explicitToJson: false)
class Location {
  final String name;
  final String url;

  const Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}