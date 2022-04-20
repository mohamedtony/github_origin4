import 'package:advertisers/features/advertising_story_details/Story.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'data.dart';

enum ButtonState { paused, playing, loading, }

class StorySmallGetxController extends GetxController with GetSingleTickerProviderStateMixin{
  final Rx<List<Story>> stories = Rx<List<Story>>([]);

  //List<Story> get videoList => _videoList.value;
  //late AudioPlayer audioPlayer;

  PageController? pageController,tiktokPageController;
  AnimationController? animController;
  VideoPlayerController? videoController;
  AudioPlayer? audioPlayer;
  var videoIsInitailized = false.obs;

  var currentIndex =0.obs;
  var story = Story().obs;

  void update2(){
    print("inMUpdate");
    stories.value= mStories;
    pageController = PageController();
    //animController = AnimationController(vsync: this);
    animController?.stop();
    animController?.reset();
    final Story firstStory = stories.value.first;
    loadStory(story: firstStory, animateToPage: false);

    animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        videoIsInitailized.value=false;
        videoController?.dispose();
        videoController = null;
        animController?.stop();
        animController?.reset();
        // setState(() {
        if (currentIndex.value + 1 < stories.value.length) {
          currentIndex.value += 1;
          loadStory(story: stories.value[currentIndex.value]);
        } else {
          print("pageController1");
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          //_currentIndex = 0;
          // _loadStory(story: widget.stories[_currentIndex]);
          /*widget.pageController1?.nextPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);*/
        }
        // });
      }
    });
  }
  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
    print("inMUpdate3");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("inMUpdate4");
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    print("inMUpdate2");
    //   audioPlayer = AudioPlayer();

    /*_videoList.bindStream(
        StoryScreen(stories: stories)
    );*/
    stories.value= mStories;
    pageController = PageController();
    animController = AnimationController(vsync: this);
    final Story firstStory = stories.value.first;
    loadStory(story: firstStory, animateToPage: false);

    animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        videoIsInitailized.value=false;
        videoController?.dispose();
        videoController = null;
        animController?.stop();
        animController?.reset();
        // setState(() {
        if (currentIndex.value + 1 < stories.value.length) {
          currentIndex.value += 1;
          loadStory(story: stories.value[currentIndex.value]);
        } else {
          print("pageController1");
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          //_currentIndex = 0;
          // _loadStory(story: widget.stories[_currentIndex]);
          /*widget.pageController1?.nextPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);*/
        }
        // });
      }
    });

/*    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _videoController?.dispose();
        _videoController = null;
        _animController?.stop();
        _animController?.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            print("pageController1");
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            //_currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);
            widget.pageController1?.nextPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          }
        });
      }
    });*/
  }

  Future<void> loadStory({Story? story, bool animateToPage = true}) async {
    print("nextPage");
    animController?.stop();
    animController?.reset();
    videoController?.dispose();
    videoController = null;
    switch (story!.media) {
      case MediaType.image:
        animController!.duration = story.duration;
        animController?.forward();
        break;
      case MediaType.video:
        videoController?.dispose();
        videoController = null;
        videoController = VideoPlayerController.network(story.url!);

        videoController?.initialize().then((_) {
            // setState(() {});
            if ( videoController!=null && videoController!.value.isInitialized) {
              animController!.duration =  videoController!.value.duration;
              videoController?.setVolume(50);
              videoController!.play();
              animController!.forward();
            }
          });
        break;
      case MediaType.audio:
      //videoGetxController.playButtonNotifier.value = ButtonState.paused;
      //Duration? dur = await videoGetxController.play(story.url);
      /// print("mDuration= ${dur?.inMinutes}");
      /*audioPlayer?.release();
           audioPlayer?.dispose();*/
        audioPlayer = null;
        audioPlayer = AudioPlayer();
        /*audioPlayer = null;
       audioPlayer?.release();
       audioPlayer?.dispose();
      audioPlayer = AudioPlayer();*/
        /*     audioPlayer ??= AudioPlayer();
      audioPlayer?.setUrl(story.url);
      audioPlayer?.onDurationChanged.listen((Duration duration) {
        _animController!.duration =duration;
        audioPlayer?.play(story.url);
        _animController!.forward();
        //_animController?.forward(from: 10);
      });*/
        /*audioPlayer?.onAudioPositionChanged.listen((Duration position) async {
        setState(() {
          _animController?.duration = position;
          _animController!.forward(from: position.);
        });
      });*/
        //print("mDuration= ${duration}");

        /*_animController!.duration = Duration(minutes: 3);
        _animController!.forward();*/
        /*_videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController!.value.isInitialized) {
              _animController!.duration = _videoController!.value.duration;
              _videoController!.play();
              _animController!.forward();
            }
          });*/
        break;
    }
    if (animateToPage) {
      pageController?.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  var playButtonNotifier = (ButtonState.paused).obs;

/*  void _listenForChangesInPlayerState() {
    audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        audioPlayer.seek(Duration.zero);
        audioPlayer.pause();
      }
    });
  }

  var progressNotifier = ProgressBarState(  current: Duration.zero,buffered: Duration.zero,
    total: Duration.zero,).obs;

  void _listenForChangesInPlayerPosition() {
    audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    //audioPlayer.durationStream.listen((totalDuration) {
      print("ddd ${totalDuration}");
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }*/


/*  Future<Duration?> play(String url) async {
    audioPlayer = AudioPlayer();

    audioPlayer.setUrl(url).then((value){
      print("mm= "+ value!.inMilliseconds.toString());
    });
*//*    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    print("Duration= ${duration?.inSeconds}");
     audioPlayer.play();
     return duration;*//*
  }*/


  likeVideo(String id) async {
    /*DocumentSnapshot doc = await fireStore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await fireStore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await fireStore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }*/
  }
  var clickedIndex=0.obs;
  var isVisible = false.obs;
  changeIndex(int index){
    clickedIndex.value = index;
  }
}


class ProgressBarState {
  const ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}