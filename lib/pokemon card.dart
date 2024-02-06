import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: Image.network(
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            scale: 1.5,
          ),
          title: Text(
            capitalize("pikachu"),
            style: const TextStyle(fontSize: 40),
          ),
          subtitle: Text(
            capitalize("electrico"),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}




