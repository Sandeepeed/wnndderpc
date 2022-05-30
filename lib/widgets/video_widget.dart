import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  String url;
  VideoApp({Key? key, required this.url}) : super(key: key);


  @override
  _VideoAppState createState() => _VideoAppState(
    url: this.url,
  );
}
class _VideoAppState extends State<VideoApp> {
  String url;
  _VideoAppState({required this.url,});
  late VideoPlayerController _controller;
  @override
  void initState() {

    super.initState();
    _controller = VideoPlayerController.asset(url)
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: _controller.value.isInitialized
              ? LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: constraints.maxWidth * _controller.value.aspectRatio,
                      height:constraints.maxHeight,
                      child: VideoPlayer(_controller),
                    ),
                  )
                  );
                }
              )
              : Container(),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}