import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/screens/video_player.dart';

class VideoScreen extends StatelessWidget {
  final Video video;
  const VideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: Column(children: [
        VideoPlayer(video: video),
      ]),
    );
  }
}
