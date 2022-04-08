import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerUrl extends StatefulWidget {
  AudioPlayerUrl(this.audioPlayer,this.animationController,this.url);
  AudioPlayer audioPlayer;
  AnimationController animationController;
  String url;
  @override
  _AudioPlayerUrlState createState() => _AudioPlayerUrlState();
}

class _AudioPlayerUrlState extends State<AudioPlayerUrl> {
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

  /// Optional
  Widget slider() {
    print("timeProgress=${timeProgress}");
    print("audioDuration=${audioDuration}");
    return Container(
      width: 300.0,
      child:  Directionality(
        textDirection: TextDirection.ltr,
        child:Slider.adaptive(
            value: timeProgress.toDouble(),
            max: audioDuration.toDouble(),

            onChanged: (value) {
              print("mvalue=${value}");
              seekToSec(value.toInt());
              // widget.animationController.value= 197;
              final double t = (value / audioDuration).clamp(0.0, 1.0);
              print("tttttttt+ ${t}");
              widget.animationController.forward(from: t);
              //widget.animationController.animateTo(value);
              //widget.animationController.animateTo(duration: Duration(seconds: value.toInt()));
            }),
      ),
    );
  }

  @override
 void initState() {
    super.initState();
    //widget.audioPlayer.play(url);
    /// Compulsory
    widget.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if(mounted) {
        setState(() {
          audioPlayerState = state;
        });
      }
    });


    /// Optional
   // widget.audioPlayer.setUrl(url);
    // Triggers the onDurationChanged listener and sets the max duration string
    //if(audioPlayerState==PlayerState.)

    setUp();

    widget.audioPlayer.onAudioPositionChanged.listen((Duration position) async {
      if(mounted) {
        print("timeProgressposition${position.inSeconds}");
        if(timeProgress<audioDuration) {
          setState(() {
            timeProgress = position.inSeconds;
          });
        }
      }
    });
  }

  /// Compulsory
  @override
  void dispose() {
    widget.audioPlayer.release();
    widget.audioPlayer.dispose();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await widget.audioPlayer.play(widget.url);
    //widget.animationController.forward();
  }

  /// Compulsory
  pauseMusic() async {
    await widget.audioPlayer.pause();
    widget.animationController.stop();
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    widget.audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  /// Optional
  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFCFCF) ,
      body: Container(
          alignment: Alignment.center,
          child: audioDuration!=0?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Compulsory
              IconButton(
                  iconSize: 50,
                  onPressed: () {
                    audioPlayerState == PlayerState.PLAYING
                        ? pauseMusic()
                        : playMusic();
                  },
                  icon: Icon(audioPlayerState == PlayerState.PLAYING
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded
                      ,color: Colors.blue,
                  )),
              /// Optional
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  Text(getTimeString(timeProgress),style: TextStyle(color: Colors.blue),),
                  SizedBox(width: 20),
                  Container(
                      width: 200, child: slider(

                  )),
                  SizedBox(width: 20),
                  Text(getTimeString(audioDuration),style:TextStyle(color: Colors.blue))
                ],
              )
            ],
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                    color: Colors.blue
                ),
              ),
            ],
          )),
    );
  }

  Future<void> setUp() async {
    await widget.audioPlayer.setUrl(widget.url);
    widget.audioPlayer.onDurationChanged.listen((Duration duration) {
      print("mDDDDuration=${duration.inSeconds}");

      if(mounted) {
        if (duration.inSeconds!=0) {
          setState(() {
            audioDuration = duration.inSeconds;
          });
          widget.animationController.duration = duration;
          playMusic();
          widget.animationController.forward();
        }
      }
    });
  }
 /* static void mMethod(int time){
    timeProgress = time;
  }*/
}