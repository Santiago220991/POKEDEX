import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_data.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  PokemonListState createState() => PokemonListState();
}

class PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonData>(context);
    var pokemonIdCounter = pokemonProvider.pokemonId;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon List View"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: pokemonProvider.pokemonList.length,
        itemBuilder: (context, index) {
          return PokemonCard(pokemon: pokemonProvider.pokemonList[index]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pokemonProvider.setPokemonId(pokemonIdCounter + 1);
          pokemonProvider.addPokemon(pokemonProvider.pokemonId);
        },
        tooltip: 'Will add one pokemon to the list',
        child: const Icon(Icons.add),
      ),
    );
  }
}
