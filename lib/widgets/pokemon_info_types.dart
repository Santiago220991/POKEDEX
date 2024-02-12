import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widgets/pokemon_type_card.dart';

class PokemonInfoTypes extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoTypes({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Types",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: pokemon.types.length,
            itemBuilder: (context, index) {
              return PokemonTypeCard(type: pokemon.types[index].type);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.white),
          ))
    ]);
  }
}
