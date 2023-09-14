// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alpha Player'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          backgroundColor: Colors.teal[900],
        ),
        drawer: Drawer(
          child: ListView(
            children:<Widget> [
              const UserAccountsDrawerHeader
                (accountName: Text("kamrul_02"),
                  accountEmail: Text("hasankamrul@gmail.com")),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text("Folder"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.playlist_add),
                title: Text("Playlist"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.download),
                title: Text("Download"),
                onTap: () {},
              ),

              ListTile(
                leading: Icon(Icons.headset),
                title: Text("Audio Music"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: MyPlayerPage(),
      ),
    );
  }
}

class MyPlayerPage extends StatefulWidget {
  const MyPlayerPage({Key? key}) : super(key: key);

  @override
  State<MyPlayerPage> createState() => _MyPlayerPageState();
}

class _MyPlayerPageState extends State<MyPlayerPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _controller.value.isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.all(16),
                    ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),),
                ],
              )
            : Container());
  }
}
