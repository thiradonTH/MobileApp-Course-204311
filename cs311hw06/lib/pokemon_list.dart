import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<StatefulWidget> createState() => _PokemonList();
}

class _PokemonList extends State<PokemonList> {
  int chooseIdx = 1; // state of selecting.
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              //use for onClick function.
              onTap: () {
                setState(() {
                  chooseIdx = index + 1; //change pokemon selected.
                  pokemonService
                      .changetheme(index + 1); //send pokemon to poekmon service.
                });
              },
              child: (chooseIdx == index + 1 //check if it is selected.
                  ? Container(
                      //selected case. 
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 5, color: Colors.blue.shade200)),
                      child: Image.network(genPokemonImageUrl(index + 1)))
                  : Image.network(
                      genPokemonImageUrl(index + 1))), // non-selected case.
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
