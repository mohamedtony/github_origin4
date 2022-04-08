import 'package:advertisers/features/advertising_story_details/story_page_controller_forsmall.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerUrl extends StatefulWidget {
  VideoPlayerUrl(this.videoPlayerController,this.animationController,this.url);
  VideoPlayerController videoPlayerController;
  AnimationController animationController;
  String url;
  @override
  _VideoPlayerUrlState createState() => _VideoPlayerUrlState();
}

class _VideoPlayerUrlState extends State<VideoPlayerUrl> {
  /// For clarity, I added the terms compulsory and optional to certain sections
  /// to maintain clarity as to what is really needed for a functioning audio player
  /// and what is added for further interaction.
  ///
  /// 'Compulsory': A functioning audio player with:
  ///             - Play/Pause button
  ///
  /// 'Optional': A functioning audio player with:
  ///             - Play/Pause button
  ///             - time stamps for progress and duration
  ///             - slider to jump within the audio file
  ///
  /// Compulsory
  // AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  // String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  StorySmallGetxController  storySmallGetxController = Get.find();
  @override
  void initState() {
    super.initState();
    //widget.audioPlayer.play(url);
    /// Compulsory
    storySmallGetxController.videoController = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        //storySmallGetxController.update();

        if (storySmallGetxController.videoController!.value.isInitialized) {
         // widget.videoPlayerController.videoIsInitailized.value = true;
          storySmallGetxController.animController!.duration =  widget.videoPlayerController.value.duration;
          storySmallGetxController.videoController!.setVolume(50);
          storySmallGetxController.videoController!.play();
          storySmallGetxController.animController!.forward();
        }
      });

  }

  /// Compulsory
  @override
  void dispose() {
   // widget.videoPlayerController.release();
    storySmallGetxController.videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFCFCF) ,
      body:
      (storySmallGetxController.videoController?.value != null &&
          storySmallGetxController.videoController!.value.isInitialized)
    ?FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height:   MediaQuery.of(context).size.height,
          child: VideoPlayer(  storySmallGetxController.videoController!),
        ),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
                color: Colors.white.withOpacity(0.5)),
          ),
        ],
      )
    );
  }

/* static void mMethod(int time){
    timeProgress = time;
  }*/
}