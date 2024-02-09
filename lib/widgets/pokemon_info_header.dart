import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/permissions/camera.dart';

class PokemonInfoHeader extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height / 3.5),
              child: IconButton(
                icon: const Icon(Icons.add_a_photo),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () async {
                  await requestCameraPermission(pokemon: pokemon); 
                },
              )),
          Image(
            image: NetworkImage(pokemon.sprites.frontDefault),
            fit: BoxFit.fill,
            height: 160,
            width: 180,
          )
        ]));
  }
}
