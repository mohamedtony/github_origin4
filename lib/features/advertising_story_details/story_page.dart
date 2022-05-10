import 'dart:ui';
import 'package:advertisers/app_core/FirebaseDynamicLinkes.dart';
import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/Attachment.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/UserAdsList.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_service.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/advertising_story_details/advertiser_details_sheet.dart';
import 'package:advertisers/features/advertising_story_details/audio_player.dart';
import 'package:advertisers/features/advertising_story_details/vimo_video/controls_config.dart';
import 'package:advertisers/features/advertising_story_details/vimo_video/quality_links.dart';
import 'package:advertisers/features/advertising_story_details/vimo_video/vimeoplayer_trinity.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:better_player/better_player.dart';

class StoryScreen extends StatefulWidget {
   List<Attachment>? stories;
  AdsListModel? adsListModel;
  Function onClicked;
  Function(BuildContext context,int ind) onSheetCliked;
  int? index;
  UserAdsList? user;
  StoryScreen({required this.stories, this.adsListModel,this.user,this.pageController1,required this.onClicked,required this.onSheetCliked,this.index});

  PageController? pageController1;

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animController;
  VideoPlayerController? _videoController;
  AudioPlayer? audioPlayer;
  int _currentIndex = 0;
  final VideoController videoGetxController = Get.find();

  OverlayHandlerProvider overlayHandlerProvider = Get.find();

  late QualityLinks _quality;
  var _qualityValue;
  BetterPlayerController? _betterPlayerController;
  ControlsConfig? config;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    print("StoryPage222");
    if(widget.stories!=null && widget.stories!.length>_currentIndex) {
      final Attachment firstStory = widget.stories![_currentIndex];
      _loadStory(story: firstStory, animateToPage: false);
    }
    /*if(widget.stories!=null && widget.stories!.length>overlayHandlerProvider.currentPage && widget.stories![overlayHandlerProvider.currentPage]!=null) {
      final Attachment firstStory = widget.stories![overlayHandlerProvider
          .currentPage];
      _loadStory(story: firstStory, animateToPage: false);
    }*/

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _betterPlayerController?.dispose();
        _betterPlayerController = null;
        _animController?.stop();
        _animController?.reset();
        setState(() {
          if (widget.stories!=null && (_currentIndex + 1 < widget.stories!.length)) {
            _currentIndex += 1;
            _loadStory(story: widget.stories![_currentIndex]);
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
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _animController?.dispose();
    _videoController?.dispose();
    _betterPlayerController?.dispose();
    super.dispose();
  }
  _addVideoWithTitleOverlay(BuildContext context) {

    OverlayService().addVideoTitleOverlay2(context,  DraggableScrollableSheet(
      //maxChildSize: 0.8,
      //minChildSize: 100.0,
      maxChildSize: 0.8,
      initialChildSize: 0.4,
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return AdvertiserDetailsSheet(
            scrollController: scrollController
        );
      },
    ));
  }
/*  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.greenAccent,
            child: new Center(
              child: new Text("Hi ModalSheet"),
            ),
          );
        });
  }*/
/*  void _showBottomSheet() {
    *//*setState(() {
      _showPersBottomSheetCallBack = null;
    });*//*

    _scaffoldKey.currentState
        ?.showBottomSheet((context) {
      return new Container(
        height: 300.0,
        color: Colors.greenAccent,
        child: new Center(
          child: new Text("Hi BottomSheet"),
        ),
      );
    })
        .closed
        .whenComplete(() {
     *//* if (mounted) {
        setState(() {
          _showPersBottomSheetCallBack = _showBottomSheet;
        });
      }*//*
    });
  }*/

  OverlayEntry getEntry(context, AdsListModel? adsListModel) {

    overlayHandlerProvider.sheetId = adsListModel!.id!;
    OverlayEntry? entry;

    entry = OverlayEntry(
      opaque: false,
      maintainState: true,
      builder: (_) => DraggableScrollableSheet(
        //maxChildSize: 0.8,
        minChildSize: 0.0,
        //maxChildSize: 0.9,
        //maxChildSize: 0.4,
        initialChildSize: 0.6,

       snap: false,
       expand: false,
       // maxChildSize: 0.444,
        builder: (context, scrollController) {
          scrollController.addListener(() {
            print("dragablr");
          });
          return AdvertiserDetailsSheet(
              scrollController: scrollController,
              adsListModel:adsListModel
          );
        },
      ).paddingZero,
    );
    return entry;
  }

  @override
  Widget build(BuildContext context) {
     Attachment? story = widget.stories!=null && widget.stories!.length>_currentIndex? widget.stories![_currentIndex]:null;
    return WillPopScope( onWillPop: () async{
      print("WillPopScope");
      return false;
    },child: Scaffold(
     // key: _scaffoldKey,
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: overlayHandlerProvider.inPipMode?false:true,
      body: story!=null?GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        behavior: HitTestBehavior.translucent,
        /*onTap: (){
          print("onTap");
          if(videoGetxController.isVisible.isTrue) {
            videoGetxController.isVisible.value = false;
          }else{
            videoGetxController.isVisible.value = true;
          }
       },*/
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: /*overlayHandlerProvider.inPipMode?40:*/45),
              child: widget.stories!=null && widget.stories!.isNotEmpty?PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.stories?.length??0,
                itemBuilder: (context, i) {
                  final Attachment story =widget.stories![i];
                  if (story.type == "image") {
                    print("image${story.path}");
                    return CachedNetworkImage(
                      imageUrl: story.path!,
                      fit: BoxFit.cover,
                    );
                  } else if (story.type == "video") {

                    return _betterPlayerController!=null
                        ? FittedBox(
                      fit: BoxFit.cover,
                      child: /*SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: AspectRatio(
                            aspectRatio: 16/9,
                            child: VideoPlayer(_videoController!),
                          ),
                        )*/
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: VimeoPlayer(id: '680589403', autoPlay: true, loaderColor: Colors.pink,betterPlayerController: _betterPlayerController),
                        ),
                      )
                       /* SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer(
                              controller: _betterPlayerController as BetterPlayerController,
                            ),
                          ),
                        ),*/
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                              color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    );

                   /* if (_betterPlayerController?.videoPlayerController?.value.initialized != null &&
                        _betterPlayerController!.videoPlayerController!.value.initialized) {
                      return ! _betterPlayerController!.videoPlayerController!.value.isBuffering
                          ? FittedBox(
                        fit: BoxFit.cover,
                        child: *//*SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: AspectRatio(
                            aspectRatio: 16/9,
                            child: VideoPlayer(_videoController!),
                          ),
                        )*//*
                        SizedBox(
                          width: _betterPlayerController!.videoPlayerController!.value.size!.width,
                          height: _betterPlayerController!.videoPlayerController!.value.size!.height,
                          child: AspectRatio(
                            aspectRatio: 16/9,
                            child: VimeoPlayer(id: '680589403', autoPlay: true, loaderColor: Colors.pink,betterPlayerController: _betterPlayerController),
                          ),
                        ),
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      );
                    }*/
                  } else if (story.type == 'audio') {
                    if (audioPlayer != null && _animController != null) {
                      return AudioPlayerUrl(
                          audioPlayer!, _animController!, story.path!);
                    }
                  }
                  return const SizedBox.shrink();
                },
              ):Container(
                child: Text('لا يوجد مرفقات'),
              ),
            ),
            /*InkWell(
              onTap: (){
                overlayHandlerProvider.enablePip(1.77);
              },
              child: Image.asset(
                'images/pausedown10.png',
                height: 100,
                width: 100,
                fit: BoxFit.fill,
                color: videoGetxController.clickedIndex == 0
                    ? Colors.white
                    : Colors.blue,
              ),
            ),*/
            Positioned(
              top: overlayHandlerProvider.inPipMode?10.0:40,
              left: 2.0,
              right: 2.0,
              child: Column(
                children: <Widget>[
                  Row(
                    textDirection: TextDirection.ltr,
                    children: widget.stories!=null ? widget.stories!.asMap()
                        .map((i, e) {
                      return MapEntry(
                        i,
                        AnimatedBar(
                          animController: _animController!,
                          position: i,
                          currentIndex: _currentIndex,
                        ),
                      );
                    })
                        .values
                        .toList():[SizedBox()],
                  ),
                  Obx(
                        () => videoGetxController.isVisible.isTrue
                        ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 4.0,
                      ),
                      child: UserInfo(adsListModel: widget.adsListModel!,animController: _animController,audioPlayer: audioPlayer,betterPlayerController: _betterPlayerController),
                    )
                        : SizedBox(),
                  )
                ],
              ),
            ),
            (story.type == 'audio' || story.type == 'video')
                ? Obx(() => videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 40, top: overlayHandlerProvider.inPipMode?10:100),
                child: InkWell(
                  onTap: () {
                    if (story.type == 'audio') {
                      audioPlayer
                          ?.getCurrentPosition()
                          .then((position) {
                        print("kkkkkkkkkkk=${position}");

                        audioPlayer?.getDuration().then((value) {
                          if ((position - (10 * 1000)) > 0) {
                            audioPlayer?.seek(Duration(
                                milliseconds:
                                position - (10 * 1000)));
                            print("duration=${value}");
                            final double t =
                            (((position / 1000) - 10) /
                                (value / 1000))
                                .clamp(0.0, 1.0);
                            print("tttttttt+ ${t}");
                            _animController?.reverse(from: t);
                          } else {
                            //_pageController?.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                            setState(() {
                              if (_currentIndex - 1 >= 0 && widget.stories!=null && widget.stories!.length>_currentIndex) {
                                _currentIndex -= 1;
                                _loadStory(
                                    story: widget.stories![_currentIndex]);
                              } else {
                                widget.pageController1?.previousPage(
                                    duration:
                                    Duration(milliseconds: 1000),
                                    curve: Curves.ease);
                              }
                            });
                          }
                        });
                        /*  final double t = (position.inSeconds / audioDuration).clamp(0.0, 1.0);
            print("tttttttt+ ${t}");
            widget.animationController.forward(from: t);*/
                      });
                    }else if (story.type == 'video') {
                      _betterPlayerController?.videoPlayerController?.position.then((position) {
                        Duration? dur =
                            _betterPlayerController!.videoPlayerController!.value.duration;
                        if (position != null &&
                            (position.inMilliseconds - (10 * 1000)) >0) {
                          print("kkkkkkkkkkkdur=${dur?.inMinutes}");
                          final double t =
                          (((position.inSeconds) - 10) /
                              (dur!.inSeconds))
                              .clamp(0.0, 1.0);
                          _betterPlayerController?.videoPlayerController?.seekTo(Duration(
                              milliseconds: position.inMilliseconds -
                                  (10 * 1000)));
                          _animController?.reverse(from: t);
                        }
                        else {
                          setState(() {
                            if (_currentIndex - 1 >= 0&& widget.stories!=null && widget.stories!.length>_currentIndex) {
                              _currentIndex -= 1;
                              _loadStory(
                                  story: widget.stories![_currentIndex]);
                            } else {
                              widget.pageController1?.previousPage(
                                  duration:
                                  Duration(milliseconds: 1000),
                                  curve: Curves.ease);
                            }
                          });
                          //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                        }
                      });
                    }
                  },
                  child: Image.asset(
                    'images/pausedown10.png',
                    height: overlayHandlerProvider.inPipMode?65:100,
                    width: overlayHandlerProvider.inPipMode?65:100,
                    fit: BoxFit.fill,
                    /* color: videoGetxController.clickedIndex == 0
                        ? Colors.white
                        : Colors.blue,*/
                  ),
                ),
              ),
            )
                : SizedBox())
                : SizedBox(),
            (story.type == 'audio' || story.type == 'video')
                ? Obx(() => videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: overlayHandlerProvider.inPipMode?100:320),
                child: InkWell(
                  onTap: () {
                    if (story.type == 'video') {
                      if (story.type == 'video') {
                        if (_betterPlayerController!.videoPlayerController!.value!=null && _betterPlayerController!.videoPlayerController!.value.isPlaying) {
                          _betterPlayerController!.videoPlayerController!.pause();
                          _animController?.stop();
                        } else {
                          _betterPlayerController!.videoPlayerController!.play();
                          _animController?.forward();
                        }
                      }
                    } else if (story.type == 'audio') {
                      if (audioPlayer != null &&
                          audioPlayer!.state == PlayerState.PLAYING) {
                        audioPlayer?.pause();
                        _animController?.stop();
                      } else if (audioPlayer != null &&
                          audioPlayer!.state == PlayerState.PAUSED) {
                        audioPlayer?.play(story.path!);
                        _animController?.forward();
                      }
                    }
                  },
                  child: Image.asset(
                    'images/playpauseicon.png',
                    height: overlayHandlerProvider.inPipMode?65:100,
                    width: overlayHandlerProvider.inPipMode?65:100,
                    fit: BoxFit.fill,
                    /*color: videoGetxController.clickedIndex == 0
                        ? Colors.white
                        : Colors.blue,*/
                  ),
                ),
              ),
            )
                : SizedBox())
                : SizedBox(),
            (story.type == 'audio' || story.type == 'video')
                ? Obx(() => videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(right: 40, top: overlayHandlerProvider.inPipMode?10:100),

                  child: InkWell(
                      onTap: () {
                        if (story.type =='audio') {
                          audioPlayer
                              ?.getCurrentPosition()
                              .then((position) {
                            print("kkkkkkkkkkk=${position}");

                            audioPlayer?.getDuration().then((value) {
                              if ((position + (10 * 1000)) < value) {
                                audioPlayer?.seek(Duration(
                                    milliseconds:
                                    position + (10 * 1000)));
                                print("duration=${value}");
                                final double t =
                                (((position / 1000) + 10) /
                                    (value / 1000))
                                    .clamp(0.0, 1.0);
                                print("tttttttt+ ${t}");
                                _animController?.forward(from: t);
                              } else {
                                setState(() {
                                  if (widget.stories!=null && _currentIndex + 1 <
                                      widget.stories!.length) {
                                    _currentIndex += 1;
                                    _loadStory(
                                        story: widget.stories![_currentIndex]);
                                  } else {
                                    // Out of bounds - loop story
                                    // You can also Navigator.of(context).pop() here
                                    // _currentIndex = 0;
                                    //_loadStory(story: widget.stories[_currentIndex]);
                                    widget.pageController1?.nextPage(
                                        duration:
                                        Duration(milliseconds: 1000),
                                        curve: Curves.ease);
                                  }
                                });
                                //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                              }
                            });
                            /*  final double t = (position.inSeconds / audioDuration).clamp(0.0, 1.0);
            print("tttttttt+ ${t}");
            widget.animationController.forward(from: t);*/
                          });
                        } else if (story.type == 'video') {
                          _betterPlayerController?.videoPlayerController?.position.then((position) {
                            Duration? dur =
                                _betterPlayerController!.videoPlayerController!.value.duration;
                            if (dur!=null && position != null &&
                                (position.inMilliseconds + (10 * 1000)) < dur.inMilliseconds) {
                              print("kkkkkkkkkkkdur=${dur.inMinutes}");
                              final double t =
                              (((position.inSeconds) + 10) /
                                  (dur.inSeconds))
                                  .clamp(0.0, 1.0);
                              _betterPlayerController?.videoPlayerController?.seekTo(Duration(
                                  milliseconds: position.inMilliseconds +
                                      (10 * 1000)));
                              _animController?.forward(from: t);
                            }
                            else {
                              setState(() {
                                if (widget.stories!=null && _currentIndex + 1 <
                                    widget.stories!.length) {
                                  _currentIndex += 1;
                                  _loadStory(
                                      story: widget.stories![_currentIndex]);
                                } else {
                                  // Out of bounds - loop story
                                  // You can also Navigator.of(context).pop() here
                                  // _currentIndex = 0;
                                  //_loadStory(story: widget.stories[_currentIndex]);
                                  widget.pageController1?.nextPage(
                                      duration:
                                      Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                }
                              });
                              //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                            }
                          });
                        }
                      },
                      child:Image.asset(
                        'images/pauseto10.png',
                        height: overlayHandlerProvider.inPipMode?65:100,
                        width: overlayHandlerProvider.inPipMode?65:100,
                        fit: BoxFit.fill,
                        /* color: videoGetxController.clickedIndex == 0
                      ? Colors.white
                      : Colors.blue,*/
                      ))
              ),
            )
                : SizedBox())
                : SizedBox(),

            Obx(
                  () => Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'images/small_screen.png',
                        height: 25,
                        width: 30,
                        fit: BoxFit.fill,
                        color:  videoGetxController.clickedIndex==0?Colors.white:Colors.blue,
                      ),
                      Image.asset(
                        'images/small_screen.png',
                        height: 25,
                        width: 30,
                        fit: BoxFit.fill,
                        color:  videoGetxController.clickedIndex==0?Colors.white:Colors.blue,
                      ),
                    ],
                  ),*/
                    Container(
                      //height: 130,
                      //padding: EdgeInsets.only(top: 6),
                      // color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          /*Container(
                          width: 62,
                          height: 62,
                          margin: EdgeInsets.all(4),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'images/filter_edit.svg',
                                fit: BoxFit.fill,
                                //color: Colors.white,
                                height: 24.0,
                                width: 30.0,
                              ),
                            ),)
                          ,decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.beginColor, AppColors.endColor],
                          ),
                        ),),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    if(overlayHandlerProvider.inPipMode){
                                      overlayHandlerProvider.disablePip();
                                    }else{
                                      overlayHandlerProvider.enablePip(1.77);
                                    }

                                  },
                                  child: Container(
                                    margin: EdgeInsets.only( right: 10.0,bottom:5.0),
                                    child: Image.asset(
                                      overlayHandlerProvider.inPipMode?'images/small_view.png':'images/big_view.png',
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){

                                     //overlayHandlerProvider.disablePip();


                                     /*if(overlayHandlerProvider.isBottomAdsShown && overlayHandlerProvider.sheetId==widget.adsListModel!.id!){
                                       return;
                                     }
                                     overlayHandlerProvider.isBottomAdsShown = true;
                                     Overlay.of(context)?.insert(getEntry(context, widget.adsListModel));*/
                                    overlayHandlerProvider.isProfileOpend = true;
                                    overlayHandlerProvider.updateHidden(true, 0);
                                    _betterPlayerController?.videoPlayerController?.pause();
                                    _animController?.stop();
                                     audioPlayer?.pause();
                                     overlayHandlerProvider.advertiserId = widget.adsListModel!.user!.id;
                                    overlayHandlerProvider.adId = widget.adsListModel!.id;
                                     widget.onSheetCliked(context,9);
                                     //Overlay.of(context)?.insert(getEntry(context, widget.adsListModel));
                                    //showBottomSheetForRequest2(Get.overlayContext!);
                                    //_addVideoWithTitleOverlay(context);
                                    //  widget.onSheetCliked(context,9);
                                    /*_addVideoWithTitleOverlay(context);
                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder: (context) => AdvertiserDetailsSheet(),
                                    );*/
                                    //_showModalSheet();
                                    //_addVideoWithTitleOverlay(context);
                                    /* Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) => AdvertiserDetailsSheet()));*/
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only( left: 10.0,bottom:5.0),
                                    child: Image.asset(
                                      'images/popup_story.png',
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6,bottom: 10),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if( videoGetxController.clickedIndex.value ==0) {
                                          videoGetxController.clickedIndex.value =
                                          -1;
                                        }else{
                                          videoGetxController.clickedIndex.value = 0;
                                        }
                                        //if()
                                        //videoGetxController.isCommentVisible.value = true;
                                        //widget.onClicked();
/*
                                        videoGetxController.clickedIndex.value = 0;
                                        Navigator.pop(context,[_pageController,_animController,_videoController,widget.stories]);
*/
                                      },
                                      child: Container(
                                        width: 35.0,
                                        height: 35.0,
                                        /*decoration: new BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),*/
                                        decoration:
                                        videoGetxController.clickedIndex == 0
                                            ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.beginColor,
                                              AppColors.endColor
                                            ],
                                          ),
                                        )
                                            : new BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/comments3.png',
                                            height: 20,
                                            width: 25,
                                            fit: BoxFit.fill,
                                            color: videoGetxController
                                                .clickedIndex ==
                                                0
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      "تعليق",
                                      style: TextStyle(color: Color(0xff4286D2)),
                                    )*/
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        videoGetxController.clickedIndex.value = 1;
                                        String url = await FirebaseDynamicLinkService.createDynamicLink(true, widget.adsListModel!.id!,videoGetxController.currentPagination,false);
                                        Share.share('${url}');
                                        print("dynaicLink=$url");
                                      },
                                      child: Container(
                                        width: 35.0,
                                        height: 35.0,
                                        padding: EdgeInsets.all(11),
                                        decoration:
                                        videoGetxController.clickedIndex == 1
                                            ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.beginColor,
                                              AppColors.endColor
                                            ],
                                          ),
                                        )
                                            : new BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'images/icon_share2.png',
                                            height: 20,
                                            width: 20,
                                            fit: BoxFit.fill,
                                            color: videoGetxController
                                                .clickedIndex ==
                                                1
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      "مشاركة",
                                      style: TextStyle(color: Color(0xff4286D2)),
                                    )*/
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                       // videoGetxController.clickedIndex.value = 2;
                                        print("Clickeeeeed");
                                        if(widget.adsListModel?.id!=null) {
                                          videoGetxController.favoriteAds(
                                              widget.adsListModel!.id!);
                                          setState(() {
                                            if(widget.adsListModel!.is_favourite==false) {
                                              widget.adsListModel!
                                                  .is_favourite = true;
                                            }else{
                                              widget.adsListModel!
                                                  .is_favourite = false;
                                            }
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 35.0,
                                        height: 35.0,
                                        padding: EdgeInsets.all(10),
                                        decoration:
                                        /*videoGetxController.clickedIndex == 2
                                            ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.beginColor,
                                              AppColors.endColor
                                            ],
                                          ),
                                        )
                                            :*/ new BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          widget.adsListModel?.is_favourite!=null && widget.adsListModel!.is_favourite!?'images/heartsolid3x.png':'images/heart_solid.png',
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.fill,
                                          /*color:
                                          videoGetxController.clickedIndex ==
                                              2
                                              ? Colors.white
                                              : null,*/
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      "مفضلة",
                                      style: TextStyle(color: Color(0xff4286D2)),
                                    )*/
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        widthFactor: 50,
                                        heightFactor: 50,
                                        child: InkWell(
                                          onTap: (){
                                            if(widget.adsListModel?.id!=null) {
                                              if(widget.adsListModel?.is_disliked!=null && widget.adsListModel!.is_disliked!){
                                                videoGetxController.likeAds(
                                                    widget.adsListModel!.id!);

                                                setState(() {
                                                  widget.adsListModel!.is_liked = true;
                                                  widget.adsListModel!.is_disliked = false;
                                                  if(widget.adsListModel?.likes!=null && widget.adsListModel!.likes!>=0) {
                                                    widget.adsListModel!.likes = (widget.adsListModel!.likes!)+1;
                                                  }
                                                  if(widget.adsListModel?.dislikes!=null && widget.adsListModel!.dislikes!>0){
                                                    widget.adsListModel!.dislikes = (widget.adsListModel!.dislikes!) -1;
                                                  }
                                                });
                                              }else if(!widget.adsListModel!.is_liked! && !widget.adsListModel!.is_disliked!){
                                                videoGetxController.likeAds(
                                                    widget.adsListModel!.id!);

                                                setState(() {
                                                  widget.adsListModel!.is_liked = true;
                                                  widget.adsListModel!.is_disliked = false;
                                                  if(widget.adsListModel?.likes!=null && widget.adsListModel!.likes!>=0) {
                                                    widget.adsListModel!.likes = (widget.adsListModel!.likes!)+1;
                                                  }
                                                  /*if(widget.adsListModel?.dislikes!=null && widget.adsListModel!.dislikes!>0){
                                                  widget.adsListModel!.dislikes = (widget.adsListModel!.dislikes!) -1;
                                                }*/
                                                });

                                              }
                                              }

                                            /*else if((widget.adsListModel?.is_liked!=null && !widget.adsListModel!.is_liked!)&& (widget.adsListModel?.is_disliked!=null && !widget.adsListModel!.is_disliked!)){
                                                videoGetxController.likeAds(
                                                    widget.adsListModel!.id!);
                                                widget.adsListModel!.is_liked = true;
                                                setState(() {
                                                  if(widget.adsListModel?.likes!=null && widget.adsListModel!.likes!>=0) {
                                                    widget.adsListModel!.likes = (widget.adsListModel!.likes!)+1;
                                                  }
                                                });
                                              }
                                            }*/
                                          },
                                          child: Image.asset(
                                            widget.adsListModel!.is_liked!=null && widget.adsListModel!.is_liked!?'images/like_story.png':'images/like_unfilled.png',
                                            height: 20,
                                            width: 25,
                                            fit: BoxFit.fill,
                                            //color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                        "${widget.adsListModel?.likes??0}",
                                      style: TextStyle(color: Color(0xff4286D2)),
                                    )*/
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 35.0,
                                      height: 35.0,
                                      padding: EdgeInsets.all(10),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        widthFactor: 45.0,
                                        heightFactor: 45.0,
                                        child: InkWell(
                                          onTap: (){
                                            if(widget.adsListModel?.id!=null) {
                                              if(widget.adsListModel?.is_liked!=null && widget.adsListModel!.is_liked!){
                                                videoGetxController.dislikeAd(
                                                    widget.adsListModel!.id!);

                                                setState(() {
                                                  widget.adsListModel!.is_disliked = true;
                                                  widget.adsListModel!.is_liked = false;
                                                  if(widget.adsListModel?.dislikes!=null && widget.adsListModel!.dislikes!>=0) {
                                                    widget.adsListModel!.dislikes = (widget.adsListModel!.dislikes!) +1;
                                                  }
                                                  if(widget.adsListModel?.likes!=null && widget.adsListModel!.likes!>0){
                                                    widget.adsListModel!.likes = (widget.adsListModel!.likes!) -1;
                                                  }
                                                });
                                              }else if(!widget.adsListModel!.is_liked! && !widget.adsListModel!.is_disliked!){
                                                print("in_dislike");
                                                videoGetxController.dislikeAd(
                                                    widget.adsListModel!.id!);

                                                setState(() {
                                                  widget.adsListModel!.is_disliked = true;
                                                  widget.adsListModel!.is_liked = false;
                                                  if(widget.adsListModel?.dislikes!=null && widget.adsListModel!.dislikes!>=0) {
                                                    widget.adsListModel!.dislikes = (widget.adsListModel!.dislikes!) +1;
                                                  }
                                                 /* if(widget.adsListModel?.likes!=null && widget.adsListModel!.likes!>0){
                                                    widget.adsListModel!.likes = (widget.adsListModel!.likes!) -1;
                                                  }*/
                                                });

                                              }
                                              /*else if((widget.adsListModel?.is_liked!=null && !widget.adsListModel!.is_liked!)&& (widget.adsListModel?.is_disliked!=null && !widget.adsListModel!.is_disliked!)){
                                                videoGetxController.dislikeAd(
                                                    widget.adsListModel!.id!);
                                                widget.adsListModel!.is_disliked = true;
                                                setState(() {
                                                  if(widget.adsListModel?.dislikes!=null && widget.adsListModel!.dislikes!>=0) {
                                                    widget.adsListModel!.dislikes = (widget.adsListModel!.dislikes!) +1;
                                                  }
                                                });
                                              }*/
                                            }
                                          },
                                          child: Image.asset(
                                            widget.adsListModel?.is_disliked!=null && widget.adsListModel!.is_disliked!?'images/icon_dislike3.png':'images/dislike_unfilled.png',
                                            height: 45,
                                            width: 45,
                                            fit: BoxFit.fill,
                                            //color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*Text(
                                      "${widget.adsListModel?.dislikes??0}",
                                      style: TextStyle(color: Color(0xff4286D2)),
                                    )*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                              visible:videoGetxController.clickedIndex.value==0?true:false,
                              //replacement: SizedBox(),
                              child:  Container(
                                color: Colors.white,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // width: 50.0,
                                        height: 35.0,
                                        margin: EdgeInsets.only(bottom: 6.0,left: 6.0,right: 6.0),
                                        decoration: new BoxDecoration(
                                            color: Colors.grey[200],
                                            shape: BoxShape.rectangle,
                                            borderRadius: new BorderRadius.all(
                                              Radius.circular(40.0),
                                            )),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              /* decoration: new BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),*/
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                  onTap: (){
                                                    if(widget.adsListModel?.id!=null) {
                                                      videoGetxController
                                                          .commentAds(widget
                                                          .adsListModel!.id);
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    'images/minutemailer2x.png',
                                                    height: 20,
                                                    width: 25,
                                                    fit: BoxFit.fill,
                                                    //color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(
                                              thickness: 1.4,
                                              width: 1,
                                              color: Colors.grey,
                                              indent: 10,
                                              endIndent: 10,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                textAlign: TextAlign.start,
                                                //focusNode: requestAdvertiseController.coponNumberNode,
                                                textAlignVertical:
                                                TextAlignVertical.center,
                                                //keyboardType:TextInputType.number,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10.0,
                                                  ),
                                                  // isCollapsed: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(40),
                                                        bottomLeft:
                                                        Radius.circular(40)),
                                                    borderSide: BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                    ),
                                                  ),
                                                  // filled: true,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[500]),
                                                  hintText:
                                                  'أضف تعليقك الخاص بالمحتوى',
                                                  //fillColor: Colors.white70
                                                ),
                                                controller: videoGetxController.commentController,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ):Container(child: Text("لا يوجد مرفق"),),
    ),);
  }
  void showBottomSheetForRequest2(BuildContext context,){
   // Get.
    /*Get.bottomSheet(AdvertiserDetailsSheet(
        //scrollController: scrollController
    ),);*/
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      //barrierColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Overlay(
          initialEntries: [
            OverlayEntry(opaque:true,builder: (context){
              return DraggableScrollableSheet(
                //maxChildSize: 0.8,
                //minChildSize: 100.0,
                //maxChildSize: 0.9,
                initialChildSize: 0.4,
                maxChildSize: 0.444,
                expand: false,
                builder: (context, scrollController) {
                  return AdvertiserDetailsSheet(
                      scrollController: scrollController
                  );
                },
              );
            })
          ],
        );
      },
    );
  }

  void _onTapDown(TapDownDetails details, Attachment story) {
    videoGetxController.clickedIndex.value =-1;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHieght = MediaQuery.of(context).size.height;

    final double dx = details.globalPosition.dx;
    print("screenHieght=${details.globalPosition.dy}");
    print("screenHieght=${4 * screenHieght / 5}");
    if (details.globalPosition.dy < screenHieght / 2) {
      print("screenHieght");
    }
    if (details.globalPosition.dy > 4 * screenHieght / 5) {
      print("screenHieght is greater");
    } else {
      if (dx < screenWidth / 5) {
        print("screenWidth");
        setState(() {
          if (widget.stories!=null && _currentIndex - 1 >= 0) {
            _currentIndex -= 1;
            _loadStory(story:widget.stories![_currentIndex]);
          } else {
            widget.pageController1?.previousPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          }
        });
      } else if (dx > 4 * screenWidth / 5) {
        setState(() {
          if (widget.stories!=null && _currentIndex + 1 < widget.stories!.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories![_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            // _currentIndex = 0;
            //_loadStory(story: widget.stories[_currentIndex]);
            widget.pageController1?.nextPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          }
        });
      } else {
        /*if (story.media == MediaType.video) {
          if (_videoController!.value.isPlaying) {
            _videoController?.pause();
            _animController?.stop();
          } else {
            _videoController?.play();
            _animController?.forward();
          }
        }*/

        if (story.type == 'video' || story.type == 'image') {
          if(story.type == 'image'){
            //_videoController?.play();
            _animController?.forward();
          }
          if (videoGetxController.isVisible.isTrue) {
            videoGetxController.isVisible.value = false;
          } else {
            videoGetxController.isVisible.value = true;
          }

          /*_videoController?.position.then((position){
            Duration dur = _videoController!.value.duration;
            print("kkkkkkkkkkkdur=${dur.inMinutes}");
            final double t = (((position!.inSeconds)+10) / (dur.inSeconds)).clamp(0.0, 1.0);
            _videoController?.seekTo(position);
            _animController?.forward(from: t);
          });*/

        } else {

          videoGetxController.isVisible.value = true;
          //audioPlayer?.seek(position);
        }
        print("kkkkkkkkkkk");
      }
    }
  }

  Future<void> _loadStory({Attachment? story, bool animateToPage = true}) async {
    print("nextPage");
    _animController?.stop();
    _animController?.reset();
    _betterPlayerController?.dispose();
    _betterPlayerController = null;
    switch (story!.type) {
      case 'image':
        _animController!.duration =Duration(seconds: widget.adsListModel!.attachment_preview_duration!);
        _animController?.forward();
        break;
      case 'video':
        _betterPlayerController?.dispose();
        _betterPlayerController = null;

        //Create class
        _quality = QualityLinks('680589403');

        //Initializing video controllers when receiving data from Vimeo
        _quality.getQualitiesSync().then((value) {
          _qualityValue = value[value.lastKey()];
          print("url="+_qualityValue.toString());

          // Create resolutions map
          Map<String, String> resolutionsMap = {};
          value.keys.forEach((key) {
            String processedKey = key.split(" ")[0];
            resolutionsMap[processedKey] = value[key];
          });

          BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
              BetterPlayerDataSourceType.network, _qualityValue,
              resolutions: resolutionsMap);

          //print("mDuration="+betterPlayerDataSource.overriddenDuration!.toString());
          setState(() {
            _betterPlayerController = BetterPlayerController(
                BetterPlayerConfiguration(
                  autoPlay: false,
                  looping: false,
                  fullScreenByDefault: false,

                  controlsConfiguration: BetterPlayerControlsConfiguration(showControls: false),
                ),
                betterPlayerDataSource: betterPlayerDataSource);
            /*if (betterPlayerDataSource!=null &&_betterPlayerController?.videoPlayerController?.value!=null&& _betterPlayerController!.videoPlayerController!.value.initialized) {
              _animController!.duration = _betterPlayerController!.videoPlayerController!.value.duration;
            print("mDuration= "+_betterPlayerController!.videoPlayerController!.value.duration.toString());
              //_videoController?.setVolume(50);
              _betterPlayerController!.play();
              _animController!.forward();
            }*/
            //_betterPlayerController!.play();



          });
          _animController!.duration = Duration(seconds: 860);
          print("url="+_animController!.duration.toString());
          //_betterPlayerController?.setVolume(50);
          _betterPlayerController!.play();
          _animController!.forward();

          /*_videoController?.dispose();
          _videoController = null;
          _videoController = VideoPlayerController.network(_qualityValue!)
            ..initialize().then((_) {
              setState(() {});
              if (_videoController!.value.isInitialized) {
                _animController!.duration = _videoController!.value.duration;
                print("url="+_animController!.duration.toString());
                //_betterPlayerController?.setVolume(50);
                _betterPlayerController!.play();
                _animController!.forward();
              }
            });*/

        });


         /* _videoController = VideoPlayerController.network(story.path!)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController!.value.isInitialized) {
              _animController!.duration = _videoController!.value.duration;
              _videoController?.setVolume(50);
              _videoController!.play();
              _animController!.forward();
            }
          });*/
        break;
      case 'audio':
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
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class StickyPageWrapper extends StatelessWidget {
  final Widget child;
  const StickyPageWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Positioned(
          left: 0,
          bottom: 0,
          child: Hero(
            tag: 'bottom_sheet',
            child: Container(
              color: Colors.orange,
              height: size.height / 4,
              width: size.width,
            ),
          ),
        )
      ],
    );
  }

}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                  animation: animController,
                  builder: (context, child) {
                    return _buildContainer(
                      constraints.maxWidth * animController.value,
                      Colors.white,
                    );
                  },
                )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );

  }


  Container _buildContainer(double width, Color color) {
    return Container(
      height: 3.5,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final AdsListModel adsListModel;
  final VideoController videoGetxController = Get.find();
  OverlayHandlerProvider overlayHandlerProvider = Get.find();
  AnimationController? animController;
  //VideoPlayerController? videoController;
  BetterPlayerController? betterPlayerController;
  AudioPlayer? audioPlayer;

  UserInfo({
    Key? key,
    required this.adsListModel,
    this.betterPlayerController,
    this.animController,
    this.audioPlayer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: overlayHandlerProvider.inPipMode?4.0:10.0),
      color: AppColors.saveButtonBottomSheet.withOpacity(.6),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              overlayHandlerProvider.removeOverlay(context);
            },
            child: Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.close,
                size: 30.0,
                color: Colors.white,
              ),
             // onPressed: () => overlayHandlerProvider.disablePip(),
            ),
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: (){
                        overlayHandlerProvider.removeOverlay(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestAdvertisePage(
                              onSheetClicked: (x){
                                //  print('tony:sheetClicked');
                               // this.onSheetClicked!(x);
                              },
                            ),
                          ),
                        );
                      },
                      child: InkWell(
                        onTap: (){
                          overlayHandlerProvider.updateHidden(true, 0);
                          betterPlayerController?.pause();
                          //betterPlayerController?.videoPlayerController?.pause();
                          animController?.stop();
                          audioPlayer?.pause();
                          Get.toNamed('/TajerOrderDetails?requestId=${adsListModel.id}');
                        },
                        child: Stack(
                          children: [
                            Container(
                              // width: 50.0,
                              height: 30.0,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              margin: EdgeInsets.only(right: 15.0, left: 4, top: 6),
                              decoration: new BoxDecoration(
                                  color: Color(0xffCFCFCF),
                                  shape: BoxShape.rectangle,
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(40.0),
                                  )),
                              child: Text("تفاصيل الاعلان"),
                            ),
                            Positioned(
                              right: -2,
                              child: Image.asset(
                                'images/story_share.png',
                                height: 25,
                                width: 30,
                                fit: BoxFit.fill,
                                //color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Text(
                          adsListModel.user?.username??'',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    adsListModel.description??'',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              InkWell(
                onTap: (){
                  //overlayHandlerProvider.enablePip(1.77);
                  overlayHandlerProvider.updateHidden(true, 0);
                  betterPlayerController?.pause();
                  animController?.stop();
                  audioPlayer?.pause();
                  print("sdvertiserId= ${adsListModel.id}");
                  Get.toNamed('/AdvertiserProfileOrderPage?id=${adsListModel.user!.id}');
                },
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: CachedNetworkImageProvider(
                    adsListModel.user?.image??'',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

/*
class Modal extends StatelessWidget {
  const Modal({
    Key? key,
    required this.visible,
    required this.onClose,
    required this.modal,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget modal;
  final bool visible;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Barrier(
      visible: visible,
      onClose: onClose,
      child: PortalTarget(
        visible: visible,
        closeDuration: kThemeAnimationDuration,
        portalFollower: TweenAnimationBuilder<double>(
          duration: kThemeAnimationDuration,
          curve: Curves.easeOut,
          tween: Tween(begin: 0, end: visible ? 1 : 0),
          builder: (context, progress, child) {
            return Transform(
              transform: Matrix4.translationValues(0, (1 - progress) * 50, 0),
              child: Opacity(
                opacity: progress,
                child: child,
              ),
            );
          },
          child: Center(child: modal),
        ),
        child: child,
      ),
    );
  }
}

class Barrier extends StatelessWidget {
  const Barrier({
    Key? key,
    required this.onClose,
    required this.visible,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onClose;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: visible,
      closeDuration: kThemeAnimationDuration,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClose,
        child: TweenAnimationBuilder<Color>(
          duration: kThemeAnimationDuration,
          tween: ColorTween(
            begin: Colors.transparent,
            end: visible ? Colors.black54 : Colors.transparent,
          ),
          builder: (context, color, child) {
            return ColoredBox(color: color);
          },
        ),
      ),
      child: child,
    );
  }
}

/// Non-nullable version of ColorTween.
class ColorTween extends Tween<Color> {
  ColorTween({required Color begin, required Color end})
      : super(begin: begin, end: end);

  @override
  Color lerp(double t) => Color.lerp(begin, end, t)!;
}*/
