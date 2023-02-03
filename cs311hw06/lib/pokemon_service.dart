import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1; 
  late PokemonInfo pokemonInfo;
  int themeColor = 0xFF7AC74C; //theme starter.

  Map<String, int> type = {
    "normal": 0xFFA8A77A,
    "fire": 0xFFEE8130,
    "water": 0xFF6390F0,
    "electric": 0xFFF7D02C,
    "grass": 0xFF7AC74C,
    "ice": 0xFF96D9D6,
    "fighting": 0xFFC22E28,
    "poison": 0xFFA33EA1,
    "ground": 0xFFE2BF65,
    "flying": 0xFFA98FF3,
    "psychic": 0xFFF95587,
    "bug": 0xFFA6B91A,
    "rock": 0xFFB6A136,
    "ghost": 0xFF735797,
    "dragon": 0xFF6F35FC,
    "dark": 0xFF705746,
    "steel": 0xFFB7B7CE,
    "fairy": 0xFFD685AD,
  }; //mapping type of pokemon to integer base 16 color code.

  Map<int, Color> shadeColor = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  }; //required MaterailColor argument.

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void changetheme(int index) async {
    pokemonInfo = await fetchPokemonInfo(index); //get pokemon data.

    themeColor = type[pokemonInfo.types[0]]!; //change theme color from the first of pokemon.

    notifyListeners();
  }
}
