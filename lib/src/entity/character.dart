class Character {
  final int id;
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
}

class Origin { 
  final String name;
  final String url;

  const Origin({required this.name, required this.url});
}

class Location {
  final String name;
  final String url;

  const Location({required this.name, required this.url});
}