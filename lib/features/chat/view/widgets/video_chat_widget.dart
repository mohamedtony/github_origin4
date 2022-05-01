import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:video_player/video_player.dart';

class VideoChatWidget extends StatefulWidget {
  const VideoChatWidget({ this.url, Key? key}) : super(key: key);
  final String?  url;
  @override
  State<VideoChatWidget> createState() => _VideoChatWidgetState();
}

class _VideoChatWidgetState extends State<VideoChatWidget> {
  late VideoPlayerController _controller;
  late bool visible;

  @override
  void initState() {
    visible = false;
    super.initState();
    _controller = widget.url!.contains('http')?VideoPlayerController.network(
        widget.url??''//"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    ):VideoPlayerController.file(
        File(widget.url??'')//"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        Container(
          height: 139,
          width: 301.w,
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
          }, backgroundColor: Colors.transparent,
          child: Icon(
            _controller.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,

          ),
        ),

      ],
    );
  }

 
}
