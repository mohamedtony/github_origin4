import 'package:advertisers/features/advertising_story_details/story_model.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final Rx<List<Story>> _videoList = Rx<List<Story>>([]);

  List<Story> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    /*_videoList.bindStream(
        StoryScreen(stories: stories)
    );*/
  }

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
  changeIndex(int index){
    clickedIndex.value = index;
  }
}