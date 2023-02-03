import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider( //create notifier
      create: (_) => PokemonService(), child: const MyPokemonApp()));
}

class MyPokemonApp extends StatefulWidget {
  const MyPokemonApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyPokemonApp();
}

class _MyPokemonApp extends State<MyPokemonApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(
      builder: (_, pokemonService, __) {
        return MaterialApp(
          title: 'Pokemon Demo',
          theme: ThemeData(
            primarySwatch: MaterialColor(
                pokemonService.themeColor, pokemonService.shadeColor), //theme color and shade color from pokemonService.
          ),
          home: const MyBottomNavigation(),
        );
      },
    );
  }
}
