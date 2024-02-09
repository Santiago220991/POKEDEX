import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/utils/strings.dart';

class PokemonTypeCard extends StatelessWidget {
  final TypeType type;
  const PokemonTypeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
            height: 50, width: 50, image: AssetImage("assets/types/${type.name}.png")),
        const SizedBox(width: 30, height: 150),
        Text(capitalize(type.name), style: const TextStyle(fontSize: 40))
      ]),
    );
  }
}
