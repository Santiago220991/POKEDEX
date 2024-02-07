class Pokemon {
  int id;
  String name;
  List<String> types;
  Sprites sprites;
  int weight;

  Pokemon(
      {required this.id,
      required this.name,
      required this.types,
      required this.sprites,
      required this.weight,
      });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        types: List<String>.from(
            json['types'].map((type) => type['type']['name'] as String)),
        sprites: Sprites.fromMap(json["sprites"]),
        weight: json['weight']
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
