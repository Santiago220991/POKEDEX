class Pokemon {
  int id;
  String name;
  List<String> types;
  Sprites sprites;
  int weight;
  List<StatElement> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
    required this.weight,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        types: List<String>.from(
            json['types'].map((type) => type['type']['name'] as String)),
        sprites: Sprites.fromMap(json["sprites"]),
        weight: json['weight'],
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
      );
}

class Sprites {
  String frontDefault;

  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
      );
}

class StatElement {
  int baseStat;
  int effort;

  StatElement({
    required this.baseStat,
    required this.effort,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        effort: json["effort"],
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
      };
}
