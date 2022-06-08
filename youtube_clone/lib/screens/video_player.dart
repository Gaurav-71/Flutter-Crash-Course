import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoPlayer extends StatefulWidget {
  final Video video;
  const VideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  VideoPlayerState createState() => VideoPlayerState();
}

class VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  bool _muted = true;

  // final String _id = 'nPt8bK2gbaU';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.video.videoUrl).toString(),
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
          _controller.setVolume(100);
        },
      ),
      builder: (context, player) => Column(
        children: [
          player,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: _isPlayerReady
                        ? () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            setState(() {});
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: _isPlayerReady
                      ? () {
                          _muted ? _controller.unMute() : _controller.mute();
                          setState(() {
                            _muted = !_muted;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.favorite))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isPlayerReady ? _videoMetaData.title : "Loading Title ...",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${widget.video.viewCount} views • ${timeago.format(widget.video.timestamp)}',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14.0),
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                _ActionsRow(video: widget.video),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                _AuthorInfo(user: widget.video.author),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Video video;

  const _ActionsRow({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_outlined, video.dislikes),
        _buildAction(context, Icons.reply_outlined, 'Share'),
        _buildAction(context, Icons.download_outlined, 'Download'),
        _buildAction(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    user.username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.0),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${user.subscribers} subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'SUBSCRIBE',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
