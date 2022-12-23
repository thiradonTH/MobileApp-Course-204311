import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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

  static const greyTextColor = Color.fromARGB(255, 197, 197, 197);
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
      Icons.favorite_outline_outlined,
      color: Colors.white,
    ),
    onPressed: null,
  );

  //Text Style **************************************************************
  static const smallGrey = TextStyle(
    color: greyTextColor,
    fontSize: 10 * 1.5,
  );

  static const mediumGrey = TextStyle(
    color: greyTextColor,
    fontSize: 15 * 1.5,
  );

  static const mediumGrey2 = TextStyle(
    color: greyTextColor,
    fontSize: 12 * 1.5,
  );

  static const bigWhite =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);

  static const mediumWhite = TextStyle(
      color: Colors.white, fontSize: 15 * 1.5, fontWeight: FontWeight.bold);

  static const smallBlueSky = TextStyle(
      color: Color.fromARGB(255, 168, 207, 245),
      fontSize: 10 * 1.5,
      fontWeight: FontWeight.bold);

  // Structure **************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: appBarColor,
          leading: leadingIcon,
          title: const Center(
              child: Text("Chiang Mai",
                  style: TextStyle(fontWeight: FontWeight.bold))),
          actions: const [shareIcon, favoriteIcon],
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
          child: Column(
            children: [
              ImageSlideshow(
                  indicatorColor: Colors.white,
                  indicatorBackgroundColor: Colors.grey.shade200,
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: null,
                  isLoop: true,
                  children: [
                    Image.asset('assets/image/shang_flutter.png'),
                    Image.asset('assets/image/shang_flutter.png'),
                    Image.asset('assets/image/shang_flutter.png'),
                    Image.asset('assets/image/shang_flutter.png'),
                    Image.asset('assets/image/shang_flutter.png'),
                  ]),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 0, top: 20, bottom: 0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "UNESCO Sustainable Travel pledge",
                        style: smallGrey,
                      ),
                      Text(
                        "Shangri-La Chiang Mai",
                        style: bigWhite,
                      ),
                      Text(
                        "★★★★★",
                        style: mediumGrey,
                      ),
                      Text(
                        "Luxury hotel with free water park, near",
                        style: mediumGrey,
                      ),
                      Text(
                        "Chiang Mai Night Bazaar",
                        style: mediumGrey,
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 0, top: 45, bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "9.0/10 Superb",
                        style: mediumWhite,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "1,000 verified Hotels.com guest reviews",
                        style: smallGrey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "See all 1,000 reviews   >",
                        style: smallBlueSky,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 0, top: 20, bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Popular amenities",
                        style: mediumWhite,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.wifi,
                                      color: greyTextColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Free WiFi",
                                      style: mediumGrey2,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.ac_unit_rounded,
                                      color: greyTextColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Air conditioning",
                                      style: mediumGrey2,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.fitness_center,
                                      color: greyTextColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Gym",
                                      style: mediumGrey2,
                                    ),
                                  ],
                                )
                              ]),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.pool,
                                        color: greyTextColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Pool",
                                        style: mediumGrey2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.drive_eta,
                                        color: greyTextColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Free parking",
                                        style: mediumGrey2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.thermostat_sharp,
                                        color: greyTextColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Refrigerator",
                                        style: mediumGrey2,
                                      ),
                                    ],
                                  )
                                ]),
                          )
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              Image.asset("assets/image/shang-map.png")
            ],
          ),
        )),
        floatingActionButton: InkWell(
          onTap: null,
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 168, 207, 245),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(3, 5),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Select a room',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
