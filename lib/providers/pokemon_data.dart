import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/services/pokemonfetcher.dart';

class PokemonData extends ChangeNotifier {
  int pokemonId = 10;
  final List<Pokemon> _pokemonList = [];
  void getFirstPokemons() async {
    for (int i = 1; i <= 10; i++) {
      var pokemon = await fetchPokemon(i.toString());
      _pokemonList.add(pokemon);
    }
    notifyListeners();
  }

  void addPokemon(int pokemonId) async {
    var pokemon = await fetchPokemon(pokemonId.toString());
    _pokemonList.add(pokemon);
    notifyListeners();
  }

  void setPokemonId(int value) {
    pokemonId = value;
    notifyListeners();
  }

  List<Pokemon> get pokemonList => _pokemonList;
}
