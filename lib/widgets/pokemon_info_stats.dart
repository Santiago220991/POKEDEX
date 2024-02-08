import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class PokemonInfoStats extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoStats({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text("Stats",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/hp.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Hp",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[0].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/attack.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Attack",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[1].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/defense.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Defense",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[2].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/special_attack.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Special attack",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[3].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/special_defense.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Special defense",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[4].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Row(children: [
            Image(
              width: 25,
              height: 25,
              image: AssetImage("assets/speed.png"),
            ),
            SizedBox(width: 30, height: 50),
            Text("Speed",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ]),
          Text(pokemon.stats[5].baseStat.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
        ]),
      ]),
    );
  }
}
