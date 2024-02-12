import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_data.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonSavedList extends StatefulWidget {
  const PokemonSavedList({Key? key}) : super(key: key);

  @override
  PokemonSavedListState createState() => PokemonSavedListState();
}

class PokemonSavedListState extends State<PokemonSavedList> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My pokemons"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: pokemonProvider.savedPokemonList.length,
        itemBuilder: (context, index) {
          return PokemonCard(pokemon: pokemonProvider.savedPokemonList[index], previousPath: "myPokemons");
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.white),
      ),
    );
  }
}
