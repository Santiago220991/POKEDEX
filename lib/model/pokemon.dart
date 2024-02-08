class Pokemon {
  int id;
  String name;
  List<TypeElement> types;
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
        types: List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromJson(x))),
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

class TypeElement {
  int slot;
  TypeType type;

  TypeElement({
    required this.slot,
    required this.type,
  });

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
        slot: json["slot"],
        type: TypeType.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class TypeType {
  String name;
  String url;

  TypeType({
    required this.name,
    required this.url,
  });

  factory TypeType.fromJson(Map<String, dynamic> json) => TypeType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
