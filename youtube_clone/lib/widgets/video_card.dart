import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_clone/screens/video_screen.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoScreen(
                    video: video,
                  )),
        );
      },
      child: Column(
        children: [
          Stack(children: [
            Image.network(
              video.thumbnailUrl,
              height: 220.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // for timestamp in thumbnail
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                color: Colors.black,
                child: Text(
                  video.duration,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      foregroundImage:
                          NetworkImage(video.author.profileImageUrl),
                    )),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15.0),
                      )),
                      Flexible(
                        child: Text(
                            '${video.author.username} - ${video.viewCount} - ${timeago.format(video.timestamp)} ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 14.0)),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
