import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widgets/pokemon_info_details.dart';
import 'package:pokedex/widgets/pokemon_info_header.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Pokemon List View"),
        ),
        body: Column(
          children: [
            PokemonInfoHeader(pokemon: pokemon),
            PokemonInfoDetails(pokemon: pokemon)
          ],
        ));
  }
}
