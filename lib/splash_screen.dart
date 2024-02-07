import 'dart:async';
import 'package:pokedex/providers/pokemon_data.dart';
import 'package:pokedex/views/pokemon_list.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    Provider.of<PokemonData>(context, listen: false).getFirstPokemons();
  }

  startTimer() async {
    var duration = const Duration(seconds: 7);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const PokemonList()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/pokemon_logo.png"),
            const Text("Loading",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: 100,
              appearance: CircularSliderAppearance(
                infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                )),
                customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColor: Colors.black,
                    shadowColor: Colors.white,
                    trackColor: Colors.white),
                spinnerDuration: 5,
                animDurationMultiplier: 5,
                animationEnabled: true,
                startAngle: 0.0,
                angleRange: 360,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
