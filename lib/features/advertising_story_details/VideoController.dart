import 'package:advertisers/features/advertising_story_details/Story.dart';
import 'package:get/get.dart';

enum ButtonState { paused, playing, loading, }

class VideoController extends GetxController {
  final Rx<List<Story>> _videoList = Rx<List<Story>>([]);

  List<Story> get videoList => _videoList.value;
  //late AudioPlayer audioPlayer;

  @override
  void onInit() {
    super.onInit();
 //   audioPlayer = AudioPlayer();

    /*_videoList.bindStream(
        StoryScreen(stories: stories)
    );*/
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