import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_clone/widgets/video_info.dart';

class VideoScreen extends StatelessWidget {
  final Video video;
  const VideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(video.title)),
      body: Column(children: [
        Image.network(
          video.thumbnailUrl,
          height: 220.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const LinearProgressIndicator(
          value: 0.4,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.red,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              minimumSize: const Size.fromHeight(45),
            ),
            child: const Icon(Icons.play_arrow),
          ),
        ),
        const SizedBox(height: 10.0),
        VideoInfo(video: video)
      ]),
    );
  }
}
