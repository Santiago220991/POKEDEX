import 'package:flutter/material.dart';
import 'package:pokedex/pokemon%20card.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];
class PokemonList extends StatelessWidget {

  const PokemonList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon List View"),
        backgroundColor: Colors.grey[50],
      ),
      body: ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return const PokemonCard();
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(
      color: Colors.white
    ),
  )
    );
  }
}