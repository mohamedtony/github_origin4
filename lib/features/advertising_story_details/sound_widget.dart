/*
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/lang/localization_get.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class SoundWidget extends StatelessWidget {
  SoundWidget({Key? key,this.audioUrl}) : super(key: key);
  final VideoController videoGetxController = Get.find();
  String? audioUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // CurrentSongTitle(),
          //Playlist(),
          //AddRemoveSongButtons(),
          AudioProgressBar(),
          AudioControlButtons(audioUrl: audioUrl,),
        ],
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  AudioProgressBar({Key? key}) : super(key: key);
  final VideoController videoGetxController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ProgressBar(
          progress: videoGetxController.progressNotifier.value.current,
          buffered: videoGetxController.progressNotifier.value.buffered,
          total: videoGetxController.progressNotifier.value.total,
          onSeek: videoGetxController.seek,
        ));
  }
}

class AudioControlButtons extends StatelessWidget {
   AudioControlButtons({Key? key,this.audioUrl}) : super(key: key);
   String? audioUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // RepeatButton(),
          // PreviousSongButton(),
          PlayButton(audioUrl:audioUrl),
          //NextSongButton(),
          // ShuffleButton(),
        ],
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  PlayButton({Key? key,this.audioUrl}) : super(key: key);
  final VideoController videoGetxController = Get.find();
  String? audioUrl;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (videoGetxController.playButtonNotifier.value) {
        case ButtonState.loading:
          return Container(
            margin: EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: CircularProgressIndicator(),
          );
        case ButtonState.paused:
          return IconButton(
            icon: Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: (){
              videoGetxController.play(audioUrl!);
            },
          );
        case ButtonState.playing:
          return IconButton(
            icon: Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: videoGetxController.pause,
          );
      }
    });
  }
}
*/
