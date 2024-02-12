import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/services/pokemonfetcher.dart';
import 'package:pokedex/utils/storage.dart';

class PokemonData extends ChangeNotifier {
  int pokemonId = 10;
  final List<Pokemon> _pokemonList = [];
  final List<Pokemon> _pokemonSavedList = [];
  List<String> _pokemonPicturesPaths = [];

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

  void getSavedPokemons() {
    readStorageFolder(addPokemonToSavedList);
  }

  void addPokemonToSavedList(String pokemonName) async {
    var pokemon = await fetchPokemonByName(pokemonName);
    _pokemonSavedList.add(pokemon);
    notifyListeners();
  }

  void setPokemonPicturesPaths(List<String> paths) {
    _pokemonPicturesPaths=paths;
  }

  void addPokemonPicturePath(String path) {
    _pokemonPicturesPaths.add(path);
    notifyListeners();
    print("los paths añadidos: $_pokemonPicturesPaths");
  }

  void getPokemonPicturePaths (String name){
    readStoragePicturePaths(addPokemonPicturePath, name );
  }

  List<Pokemon> get pokemonList => _pokemonList;
  List<Pokemon> get savedPokemonList => _pokemonSavedList;
  List<String>  get pokemonPicturesPaths => _pokemonPicturesPaths; 
}
