library vimeoplayer;

import 'package:advertisers/features/advertising_story_details/vimo_video/quality_links.dart';
import 'package:better_player/better_player.dart';
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

  VimeoPlayer({
    required this.id,
    this.autoPlay = false,
    this.looping = false,
    this.controlsConfig,
    this.loaderColor,
    this.loaderBackgroundColor,
    this.allowFullScreen = false,
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
  BetterPlayerController? _betterPlayerController;

  @override
  void initState() {
    fullScreen = widget.allowFullScreen;

    //Create class
    _quality = QualityLinks(widget.id);

    //Initializing video controllers when receiving data from Vimeo
    _quality.getQualitiesSync("").then((value) {
      _qualityValue = value[value.lastKey()];

      // Create resolutions map
      Map<String, String> resolutionsMap = {};
      value.keys.forEach((key) {
        String processedKey = key.split(" ")[0];
        resolutionsMap[processedKey] = value[key];
      });

      BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network, _qualityValue,
          resolutions: resolutionsMap);

      setState(() {
        _betterPlayerController = BetterPlayerController(
            BetterPlayerConfiguration(
                autoPlay: widget.autoPlay,

                aspectRatio:9/32,
                fit: BoxFit.fill,
                looping: widget.looping,
                fullScreenByDefault: fullScreen,
                controlsConfiguration: BetterPlayerControlsConfiguration(enableQualities: false,  enableOverflowMenu :false,
                  enablePlaybackSpeed : false,
                  enableSubtitles : false,)
            ),
            betterPlayerDataSource: betterPlayerDataSource);
      });

      //Update orientation and rebuilding page
      // setState(() {
      //   SystemChrome.setPreferredOrientations(
      //       [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      // });
    });

    // //The video page takes precedence over portrait orientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    super.initState();
  }

  //Build player element
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _betterPlayerController == null
          ? CircularProgressIndicator(
          color: widget.loaderColor,
          backgroundColor: widget.loaderBackgroundColor)
          : /*BetterPlayer(
        controller:_betterPlayerController as BetterPlayerController,
      )*/ Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BetterPlayer(
                controller:_betterPlayerController as BetterPlayerController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    // initFuture = null;
    super.dispose();
  }
}
