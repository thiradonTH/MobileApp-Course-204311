import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoritePokemons();
  }
}

class FavoritePokemons extends StatefulWidget {
  const FavoritePokemons({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePokemonsState();
}

class _FavoritePokemonsState extends State<FavoritePokemons> {
  final items = List<String>.generate(
      150,
      (i) =>
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'); // generate a list of 150 Pokemon
  List<bool> stateItem = List<bool>.generate(150, (i) => false);
  @override
  Widget build(BuildContext context) {
    int count = stateItem.where((element) => element == true).length;
    String title = "Pokemon List ($count)";

    // ignore: no_leading_underscores_for_local_identifiers
    void _toggleFavorite(int i) {
      setState(() {
        if (stateItem[i]) {
          stateItem[i] = false;
        } else {
          stateItem[i] = true;
        }
      });
    }

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: (count != 0 ? Text(title) : const Text("Pokemon List")),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              child: ListView.builder(
                itemCount: items.length ~/
                    3, // 3 items per row so we divide the number of items by 3
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                          child: Stack(
                        // Stack is for overlaying Favorite icon on top of image
                        children: [
                          Image.network(items[index * 3]),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() => _toggleFavorite(index * 3));
                            },
                            iconSize: 50,
                            icon: (stateItem[index * 3]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pink.shade400,
                                  )
                                : const Icon(Icons.favorite_border)),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Stack(
                        children: [
                          Image.network(items[index * 3 + 1]),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() => _toggleFavorite(index * 3 + 1));
                            },
                            iconSize: 50,
                            icon: (stateItem[index * 3 + 1]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pink.shade400,
                                  )
                                : const Icon(Icons.favorite_border)),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Stack(
                        children: [
                          Image.network(items[index * 3 + 2]),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() => _toggleFavorite(index * 3 + 2));
                            },
                            iconSize: 50,
                            icon: (stateItem[index * 3 + 2]
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pink.shade400,
                                  )
                                : const Icon(Icons.favorite_border)),
                          ),
                        ],
                      )),
                    ],
                  );
                },
              ),
            )));
  }
}
