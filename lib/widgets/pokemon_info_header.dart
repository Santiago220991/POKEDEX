import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class PokemonInfoHeader extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Image(
          image: NetworkImage(pokemon.sprites.frontDefault),
          fit: BoxFit.fill,
          height: 160,
          width: 180,
        ));
  }
}
