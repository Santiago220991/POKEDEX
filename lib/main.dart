import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_data.dart';
import 'package:pokedex/views/pokemon_info.dart';
import 'package:pokedex/views/pokemon_list.dart';
import 'package:provider/provider.dart';
import 'splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PokemonData(),
        child: MaterialApp(
          initialRoute: "/splashScreen",
          routes: {
            "/splashScreen": (context) => const SplashScreen(),
            "/home": (context) => const PokemonList(),
            "/info": (context) => const PokemonInfo(),
          },
        ));
  }
}
