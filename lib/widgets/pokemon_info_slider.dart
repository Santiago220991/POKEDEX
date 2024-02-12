import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/providers/pokemon_data.dart';
import 'package:pokedex/widgets/local_image_loader.dart';
import 'package:provider/provider.dart';

class ImageSliderScreen extends StatefulWidget {
  final Pokemon pokemon;
  const ImageSliderScreen({super.key, required this.pokemon});
  @override
  ImageSliderScreenState createState() => ImageSliderScreenState();
}

class ImageSliderScreenState extends State<ImageSliderScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<PokemonData>(context, listen: false)
        .setPokemonPicturesPaths([]);
    Provider.of<PokemonData>(context, listen: false)
        .getPokemonPicturePaths(widget.pokemon.name);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final picturePaths = Provider.of<PokemonData>(context).pokemonPicturesPaths;
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: 200,
        width: 200,
        child: PageView.builder(
          controller: _pageController,
          itemCount: picturePaths.length,
          itemBuilder: (context, index) {
            return LocalImageLoader(picturePath: picturePaths[index]);
          },
        ),
      ),
      Positioned(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(picturePaths),
        ),
      ),
    ]);
  }

  List<Widget> _buildPageIndicator(picturePaths) {
    List<Widget> indicators = [];
    for (int i = 0; i < picturePaths.length; i++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}
