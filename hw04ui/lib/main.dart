import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  //Color *******************************************************************
  static const appBarColor = Color.fromRGBO(26, 28, 27, 1);

  static const pinkIconColor = Color.fromARGB(255, 237, 176, 176);

  //Icon ********************************************************************
  static const leadingIcon = IconButton(
    icon: Icon(Icons.arrow_back_ios, color: pinkIconColor),
    onPressed: null,
  );

  static const shareIcon = IconButton(
    icon: Icon(Icons.ios_share, color: pinkIconColor),
    onPressed: null,
  );

  static const favoriteIcon = IconButton(
    icon: Icon(
      Icons.favorite_border_outlined,
      color: Colors.white,
    ),
    onPressed: null,
  );

  // Structure **************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: leadingIcon,
        title: const Center(
            child: Text("Chiang Mai",
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: const [shareIcon, favoriteIcon],
      ),
    );
  }
}
