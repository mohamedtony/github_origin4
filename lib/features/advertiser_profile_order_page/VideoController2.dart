import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/requests/GetAdsRequest.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

enum ButtonState { paused, playing, loading, }

class VideoController2 extends GetxController {
 // final Rx<List<Story>> _videoList = Rx<List<Story>>([]);

//  List<Story> get videoList => _videoList.value;
  late TextEditingController commentController;
  TextEditingController? reportController;
  //RxList<GetAdvertisersModel> advertisersModel = <GetAdvertisersModel>[].obs;
  //final Rx<List<AdsListModel>> adslistList = Rx<List<AdsListModel>>([]);
  RxList<AdsListModel> adslistList = <AdsListModel>[].obs;
  OverlayHandlerProvider2 overlayHandlerProvider = Get.find();
  AdvertiserProfileOrderController advertiserProfileOrderController =Get.find();
  //List<Story> get adslistList => _videoList.value;
  //late AudioPlayer audioPlayer;
   var isSmall = false.obs;
   var isFavoriate = false.obs;

  late PageController pageController;
  String? myToken ;
  int videoDuration = 0;

  @override
  Future<void> onInit() async {
    reportController = TextEditingController();
    myToken = await storage.read("token");
    getAdsList(advertiserProfileOrderController.selectedAdvertiseId);
    super.onInit();
    commentController=TextEditingController();
    pageController = PageController(initialPage: overlayHandlerProvider.currentPage, viewportFraction: 1,);
 //   audioPlayer = AudioPlayer();

    /*_videoList.bindStream(
        StoryScreen(stories: stories)
    );*/
  }
  @override
  void onReady() {
    // TODO: implement onReady
    print("onReady");
    super.onReady();
  }
  Future<void>  seenAds(int? id)async{
    client!.seenAds(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        // Get.back();
        print("copon seen ${id}");
        Logger().i(value.data.toString());
      }
    });
  }
  Future<void> commentAds(int? id) async {
    if(commentController.text==null || commentController.text.isEmpty){
      showMyToast("???????? ?????????? ?????????? !");
      return;
    }
    if(myToken==null ) {
      showMyToast("?????????? ?????? ???????????? !");
      return;
    }

    client!.commentAd(id!,commentController.text,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        commentController.text="";
        Fluttertoast.showToast(
            msg: "???? ?????????? ???????????? ?????????? !",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            //fontFamily: 'Arabic-Regular',
            fontSize: 16.0);

        // Get.back();
        print("token used");
        Logger().i(value.data.toString());
      }
    });
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

  Future<void> getAdsList(int userId) async {
   String myToken = await storage.read("token");

    client!.getAdsList(advertiserProfileOrderController.selectedAdvertiseId,1,"Bearer " + myToken,GetAdsRequest())
        .then((value) {
      if (value.status == 200 && value.data != null && value.data!.isNotEmpty) {
        Logger().d(value.data.toString());
        /*isLoading.value = false;
        isEmpty.value = false;
        advertisersModel.value = value.data!;*/
        adslistList.value = value.data!;
      } else {
        /*isLoading.value = false;
        isEmpty.value = true;*/
      }
    });
  }

  void favoriteAds(int id) {
    if(myToken==null ) {
      showMyToast("?????????? ?????? ???????????? !");
      return;
    }
    client!.favouriteAd(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        if(value.data?.liked!=null && value.data!.liked==1){
          Fluttertoast.showToast(
              msg: "???? ?????????? ?????? ?????????????? ?????? ?????????????? ?????????? !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              //fontFamily: 'Arabic-Regular',
              fontSize: 16.0);
        }else{
          Fluttertoast.showToast(
              msg: "???? ?????? ?????? ?????????????? ???? ?????????????? ?????????? !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              //fontFamily: 'Arabic-Regular',
              fontSize: 16.0);
        }


        // Get.back();
        print("token used");
        Logger().i(value.data.toString());
      }
    });
  }

  void likeAds(int id) {
    if(myToken==null ) {
      showMyToast("?????????? ?????? ???????????? !");
      return;
    }
    client!.likeAd(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        showMyToast("???? ?????????????? ???????? ?????????????? ?????????? !");
      }
    });
  }

  void dislikeAd(int id) {
    if(myToken==null ) {
      showMyToast("?????????? ?????? ???????????? !");
      return;
    }
    client!.dislikeAd(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        showMyToast("???? ?????????? ?????????????? ???????? ?????????????? ?????????? !");
      }
    });
  }

  void showMyToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        //fontFamily: 'Arabic-Regular',
        fontSize: 16.0);
  }

  void onReportSavedClicked(BuildContext context,int id) {
    if(myToken==null ) {
      showMyToast("?????????? ?????? ???????????? !");
      return;
    }else if(reportController?.text==null){
      showMyToast("???? ???????? ???????? ?????????? ?????? ???????????? !");
      return;
    }else if(reportController!.text.isEmpty){
      showMyToast("???? ???????? ???????? ?????????? ?????? ???????????? !");
      return;
    }
    LoadingDailog().showLoading(context);
    client!.reportAds(id,reportController!.text,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        showMyToast("???? ?????????? ?????????? ?????????? !");
        Get.back();
        Get.back();
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    reportController?.dispose();
    super.onClose();
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