library vimeoplayer;

import 'package:advertisers/features/advertising_story_details/vimo_video/quality_links.dart';
import 'package:better_player/better_player.dart';
import 'package:better_player/src/video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:vimeoplayer_trinity/src/controls_config.dart';

//Video player class
class VimeoPlayer extends StatefulWidget {
  /// Vimeo video id
  final String? id;

  /// Whether player should autoplay video
  final bool autoPlay;

  /// Whether player should loop video
  final bool looping;

  /// Start playing in fullscreen.default is false
  final bool allowFullScreen;

  /// Configure controls
  final ControlsConfig? controlsConfig;

  /// Progress indicator color
  final Color? loaderColor;

  /// Progress indicator background color
  final Color? loaderBackgroundColor;
  BetterPlayerController? betterPlayerController;

  VimeoPlayer({
    required this.id,
    this.autoPlay = false,
    this.looping = false,
    this.controlsConfig,
    this.loaderColor,
    this.loaderBackgroundColor,
    this.allowFullScreen = false,
    this.betterPlayerController,
    Key? key,
  })  : assert(id != null && allowFullScreen != null),
        super(key: key);

  @override
  _VimeoPlayerState createState() => _VimeoPlayerState();
}

class _VimeoPlayerState extends State<VimeoPlayer> {
  int? position;
  bool fullScreen = false;

  //Quality Class
  late QualityLinks _quality;
  var _qualityValue;


  @override
  void initState() {
    fullScreen = widget.allowFullScreen;



    // //The video page takes precedence over portrait orientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    super.initState();
    print("on trinty Viemoplay"+widget.betterPlayerController!.videoPlayerController!.value.duration.toString());
   // widget.betterPlayerController.betterPlayerDataSource.du
  }

  //Build player element
  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.betterPlayerController == null
          ? CircularProgressIndicator(
              color: widget.loaderColor,
              backgroundColor: widget.loaderBackgroundColor)
          : AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: widget.betterPlayerController as BetterPlayerController,
              ),
            ),
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    // initFuture = null;
    super.dispose();
  }

     VideoPlayerController?  getPlayer(){
      return widget.betterPlayerController?.videoPlayerController;
  }
}
