import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class GuidesVideosCard extends StatefulWidget {
  const GuidesVideosCard({this.text, this.url, Key? key}) : super(key: key);
  final String? text, url;
  @override
  State<GuidesVideosCard> createState() => _GuidesVideosCardState();
}

class _GuidesVideosCardState extends State<GuidesVideosCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url??" ")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27.0),
                  child: Text(
                    widget.text ?? ' ',
                  ),
                )),
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            Container(
              height: 169.h,
              width: 342.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child:
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: VideoPlayer(_controller)),
                        )
                      : Container(),
               ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },backgroundColor: Colors.transparent,
              child: Icon(
                _controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,

              ),
            )
          ],
        ),

      ],

      ),
    );
  }
}
