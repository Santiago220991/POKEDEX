import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/utils/strings.dart';

class PokemonInfoDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(capitalize(pokemon.name),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const Text("Weight:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("${pokemon.weight} Pounds", style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
