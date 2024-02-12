import 'package:http/http.dart' as http;
import 'package:pokedex/constants/constants.dart';
import 'dart:convert';
import 'package:pokedex/model/pokemon.dart';

const url = baseURL;

Future<Pokemon> fetchPokemon(String pokemonId) async {
  var uri = Uri.parse("$baseURL$pokemonId");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch pokemon: ${response.statusCode}');
  }
}

Future<Pokemon> fetchPokemonByName(String pokemonName) async {
  var uri = Uri.parse("$baseURL$pokemonName");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to fetch pokemon: ${response.statusCode}');
  }
}
