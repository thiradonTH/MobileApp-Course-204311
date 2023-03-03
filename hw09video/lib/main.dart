import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> images = [
    "assets/images/v1.png",
    "assets/images/v2.png",
    "assets/images/v3.png",
    "assets/images/v4.png",
    "assets/images/v5.png"
  ];

  List<String> time = [
    "1 hours ago",
    "1 hours ago",
    "1 hours ago",
    "1 hours ago",
    "1 hours ago",
  ];

  List<String> name = [
    "Meme1.mp4",
    "Meme2.mp4",
    "Meme3.mp4",
    "Meme4.mp4",
    "Meme5.mp4"
  ];

  List<String> videos = [
    "assets/video/vdo1.mp4",
    "assets/video/vdo2.mp4",
    "assets/video/vdo3.mp4",
    "assets/video/vdo4.mp4",
    "assets/video/vdo5.mp4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Youtube Demo")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VideoYoutubePlayer(
                            videoName: name[index], video: videos[index])));
              },
              child: Column(
                children: [
                  Image.asset(images[index]),
                  Row(
                    children: [
                      const Icon(Icons.account_circle),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name[index]),
                          Text('Username ${time[index]}')
                        ],
                      )
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}

class VideoYoutubePlayer extends StatefulWidget {
  const VideoYoutubePlayer(
      {super.key, required this.videoName, required this.video});

  final String videoName;
  final String video;
  @override
  State<VideoYoutubePlayer> createState() => _VideoYoutubePlayerState();
}

class _VideoYoutubePlayerState extends State<VideoYoutubePlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.videoName),
          ),
        ),
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
}
