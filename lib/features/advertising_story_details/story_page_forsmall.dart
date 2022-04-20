import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/advertising_story_details/audio_player.dart';
import 'package:advertisers/features/advertising_story_details/sound_widget.dart';
import 'package:advertisers/features/advertising_story_details/Story.dart';
import 'package:advertisers/features/advertising_story_details/User.dart';
import 'package:advertisers/features/advertising_story_details/story_page_controller_forsmall.dart';
import 'package:advertisers/features/advertising_story_details/video_player.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StoryForSmallScreen extends StatelessWidget {
  final List<Story> stories;
  Function onClicked;
  StoryForSmallScreen({required this.stories, this.pageController1,required this.onClicked});

  PageController? pageController1;


  final VideoController videoGetxController = Get.find();
  late StorySmallGetxController  storySmallGetxController;

/*  @override
  void initState() {
    super.initState();
    storySmallGetxController.currentIndex.value =0;
    storySmallGetxController.currentIndex.refresh();
    _loadStory(story: stories[0]);
  }*/
/*  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    storySmallGetxController.pageController?.dispose();
    storySmallGetxController.animController?.dispose();
    storySmallGetxController.videoController?.dispose();
    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    //final Story story = stories[_currentIndex];
      storySmallGetxController = Get.put(StorySmallGetxController())..update2();
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, stories[storySmallGetxController.currentIndex.value],context),
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
              margin: EdgeInsets.only(bottom: 100),
              child: PageView.builder(
                controller: storySmallGetxController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stories.length,
                itemBuilder: (context, i) {
                  final Story story = stories[i];
                  if (story.media == MediaType.image) {
                    return CachedNetworkImage(
                      imageUrl: story.url!,
                      fit: BoxFit.cover,
                    );
                  } else if (story.media == MediaType.video) {
                    if (storySmallGetxController.videoController != null && storySmallGetxController.animController != null) {
                      return VideoPlayerUrl(
                          storySmallGetxController.videoController!, storySmallGetxController.animController!, story.url!);
                    }
                   /* Obx((){
                      if (storySmallGetxController.videoIsInitailized.isTrue) {
                        return  FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: storySmallGetxController.videoController!.value.size.width,
                            height: storySmallGetxController.videoController!.value.size.height,
                            child: VideoPlayer(storySmallGetxController.videoController!),
                          ),
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
                      }
                    });*/

                  } else if (story.media == MediaType.audio) {
                    if (storySmallGetxController.audioPlayer != null && storySmallGetxController.animController != null) {
                      return AudioPlayerUrl(
                          storySmallGetxController. audioPlayer!, storySmallGetxController.animController!, story.url!);
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Positioned(
              top: 40.0,
              left: 2.0,
              right: 2.0,
              child: Column(
                children: <Widget>[
                 Obx(()=> Row(
                   textDirection: TextDirection.ltr,
                   children: stories
                       .asMap()
                       .map((i, e) {
                     return MapEntry(
                       i,
                       AnimatedBar(
                         animController:  storySmallGetxController.animController!,
                         position: i,
                         currentIndex:  storySmallGetxController.currentIndex.value,
                       ),
                     );
                   })
                       .values
                       .toList(),
                 )),
                  Obx(
                        () => videoGetxController.isVisible.isTrue
                        ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 4.0,
                      ),
                      child: UserInfo(user: stories[storySmallGetxController.currentIndex.value].user!),
                    )
                        : SizedBox(),
                  )
                ],
              ),
            ),

                Obx(() => (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio || stories[storySmallGetxController.currentIndex.value].media == MediaType.video)&&videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 40, top: 100),
                child: InkWell(
                  onTap: () {
                    if (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio) {
                      storySmallGetxController.audioPlayer
                          ?.getCurrentPosition()
                          .then((position) {
                        print("kkkkkkkkkkk=${position}");

                        storySmallGetxController.audioPlayer?.getDuration().then((value) {
                          if ((position - (10 * 1000)) > 0) {
                            storySmallGetxController.audioPlayer?.seek(Duration(
                                milliseconds:
                                position - (10 * 1000)));
                            print("duration=${value}");
                            final double t =
                            (((position / 1000) - 10) /
                                (value / 1000))
                                .clamp(0.0, 1.0);
                            print("tttttttt+ ${t}");
                            storySmallGetxController.animController?.reverse(from: t);
                          } else {
                            //_pageController?.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                            //setState(() {
                              if (storySmallGetxController.currentIndex - 1 >= 0) {
                                storySmallGetxController.currentIndex.value -= 1;
                                _loadStory(
                                    story: stories[storySmallGetxController.currentIndex.value]);
                              } else {
                                pageController1?.previousPage(
                                    duration:
                                    Duration(milliseconds: 1000),
                                    curve: Curves.ease);
                              }
                            //});
                          }
                        });
                        /*  final double t = (position.inSeconds / audioDuration).clamp(0.0, 1.0);
            print("tttttttt+ ${t}");
            animationController.forward(from: t);*/
                      });
                    }else if (stories[storySmallGetxController.currentIndex.value].media == MediaType.video) {
                      storySmallGetxController.videoController?.position.then((position) {
                        Duration dur =
                            storySmallGetxController.videoController!.value.duration;
                        if (position != null &&
                            (position.inMilliseconds - (10 * 1000)) >0) {
                          print("kkkkkkkkkkkdur=${dur.inMinutes}");
                          final double t =
                          (((position.inSeconds) - 10) /
                              (dur.inSeconds))
                              .clamp(0.0, 1.0);
                          storySmallGetxController.videoController?.seekTo(Duration(
                              milliseconds: position.inMilliseconds -
                                  (10 * 1000)));
                          storySmallGetxController.animController?.reverse(from: t);
                        }
                        else {
                          //setState(() {
                            if (storySmallGetxController.currentIndex.value - 1 >= 0) {
                              storySmallGetxController.currentIndex.value -= 1;
                              _loadStory(
                                  story: stories[storySmallGetxController.currentIndex.value]);
                            } else {
                              pageController1?.previousPage(
                                  duration:
                                  Duration(milliseconds: 1000),
                                  curve: Curves.ease);
                            }
                         // });
                          //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                        }
                      });
                    }
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
                ),
              ),
            )
                : SizedBox()),


                 Obx(() => (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio || stories[storySmallGetxController.currentIndex.value].media == MediaType.video)&&videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 320),
                child: InkWell(
                  onTap: () {
                    if (stories[storySmallGetxController.currentIndex.value].media == MediaType.video) {
                      if (stories[storySmallGetxController.currentIndex.value].media == MediaType.video) {
                        if (storySmallGetxController.videoController!.value.isPlaying) {
                          storySmallGetxController. videoController?.pause();
                          storySmallGetxController.animController?.stop();
                        } else {
                          storySmallGetxController.videoController?.play();
                          storySmallGetxController.animController?.forward();
                        }
                      }
                    } else if (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio) {
                      if (storySmallGetxController.audioPlayer != null &&
                          storySmallGetxController.audioPlayer!.state == PlayerState.PLAYING) {
                        storySmallGetxController.audioPlayer?.pause();
                        storySmallGetxController.animController?.stop();
                      } else if (storySmallGetxController.audioPlayer != null &&
                          storySmallGetxController.audioPlayer!.state == PlayerState.PAUSED) {
                        storySmallGetxController.audioPlayer?.play(stories[storySmallGetxController.currentIndex.value].url!);
                        storySmallGetxController.animController?.forward();
                      }
                    }
                  },
                  child: Image.asset(
                    'images/playpauseicon.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    color: videoGetxController.clickedIndex == 0
                        ? Colors.white
                        : Colors.blue,
                  ),
                ),
              ),
            )
                : SizedBox()),

                Obx(() => (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio || stories[storySmallGetxController.currentIndex.value].media == MediaType.video)&&videoGetxController.isVisible.isTrue
                ? Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  if (stories[storySmallGetxController.currentIndex.value].media == MediaType.audio) {
                    storySmallGetxController.audioPlayer
                        ?.getCurrentPosition()
                        .then((position) {
                      print("kkkkkkkkkkk=${position}");

                      storySmallGetxController.audioPlayer?.getDuration().then((value) {
                        if ((position + (10 * 1000)) < value) {
                          storySmallGetxController.audioPlayer?.seek(Duration(
                              milliseconds:
                              position + (10 * 1000)));
                          print("duration=${value}");
                          final double t =
                          (((position / 1000) + 10) /
                              (value / 1000))
                              .clamp(0.0, 1.0);
                          print("tttttttt+ ${t}");
                          storySmallGetxController.animController?.forward(from: t);
                        } else {
                          //setState(() {
                            if (storySmallGetxController.currentIndex.value + 1 <
                                stories.length) {
                              storySmallGetxController.currentIndex.value += 1;
                              _loadStory(
                                  story: stories[storySmallGetxController.currentIndex.value]);
                            } else {
                              // Out of bounds - loop story
                              // You can also Navigator.of(context).pop() here
                              // _currentIndex = 0;
                              //_loadStory(story: stories[_currentIndex]);
                              pageController1?.nextPage(
                                  duration:
                                  Duration(milliseconds: 1000),
                                  curve: Curves.ease);
                            }
                          //});
                          //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                        }
                      });
                      /*  final double t = (position.inSeconds / audioDuration).clamp(0.0, 1.0);
            print("tttttttt+ ${t}");
            animationController.forward(from: t);*/
                    });
                  } else if (stories[storySmallGetxController.currentIndex.value].media == MediaType.video) {
                    storySmallGetxController.videoController?.position.then((position) {
                      Duration dur =
                          storySmallGetxController.videoController!.value.duration;
                      if (position != null &&
                          (position.inMilliseconds + (10 * 1000)) < dur.inMilliseconds) {
                        print("kkkkkkkkkkkdur=${dur.inMinutes}");
                        final double t =
                        (((position.inSeconds) + 10) /
                            (dur.inSeconds))
                            .clamp(0.0, 1.0);
                        storySmallGetxController.videoController?.seekTo(Duration(
                            milliseconds: position.inMilliseconds +
                                (10 * 1000)));
                        storySmallGetxController.animController?.forward(from: t);
                      }
                      else {
                      //  setState(() {
                          if (storySmallGetxController.currentIndex.value + 1 <
                              stories.length) {
                            storySmallGetxController.currentIndex.value += 1;
                            _loadStory(
                                story: stories[storySmallGetxController.currentIndex.value]);
                          } else {
                            // Out of bounds - loop story
                            // You can also Navigator.of(context).pop() here
                            // _currentIndex = 0;
                            //_loadStory(story: stories[_currentIndex]);
                            pageController1?.nextPage(
                                duration:
                                Duration(milliseconds: 1000),
                                curve: Curves.ease);
                          }
                        //});
                        //_pageController?.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.ease);
                      }
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(right: 40, top: 100),
                  child: Image.asset(
                    'images/pauseto10.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    color: videoGetxController.clickedIndex == 0
                        ? Colors.white
                        : Colors.blue,
                  ),
                ),
              ),
            )
                : SizedBox()),
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
                      height: 130,
                      padding: EdgeInsets.only(top: 6),
                      color: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                     // onClicked();
/*
                                      videoGetxController.clickedIndex.value = 0;
                                      Navigator.pop(context,[_pageController,_animController,_videoController,stories]);
*/
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
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
                                          height: 25,
                                          width: 30,
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
                                  Text(
                                    "تعليق",
                                    style: TextStyle(color: Color(0xff4286D2)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      videoGetxController.clickedIndex.value =
                                      1;
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      padding: EdgeInsets.all(13),
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
                                          height: 25,
                                          width: 30,
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
                                  Text(
                                    "مشاركة",
                                    style: TextStyle(color: Color(0xff4286D2)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      videoGetxController.clickedIndex.value =
                                      2;
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      padding: EdgeInsets.all(13),
                                      decoration:
                                      videoGetxController.clickedIndex == 2
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
                                      child: Image.asset(
                                        'images/heartsolid3x.png',
                                        height: 25,
                                        width: 30,
                                        fit: BoxFit.fill,
                                        color:
                                        videoGetxController.clickedIndex ==
                                            2
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "مفضلة",
                                    style: TextStyle(color: Color(0xff4286D2)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    padding: EdgeInsets.only(
                                        bottom: 14,
                                        top: 8,
                                        left: 12,
                                        right: 12),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'images/like_story.png',
                                      height: 25,
                                      width: 30,
                                      fit: BoxFit.fill,
                                      //color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "96",
                                    style: TextStyle(color: Color(0xff4286D2)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    padding: EdgeInsets.all(13),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'images/icon_dislike3.png',
                                      height: 25,
                                      width: 30,
                                      fit: BoxFit.fill,
                                      //color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "96",
                                    style: TextStyle(color: Color(0xff4286D2)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  // width: 50.0,
                                  height: 44.0,
                                  margin: EdgeInsets.all(6.0),
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
                                          child: Image.asset(
                                            'images/minutemailer2x.png',
                                            height: 25,
                                            width: 30,
                                            fit: BoxFit.fill,
                                            //color: Colors.white,
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
                                          //controller: requestAdvertiseController.coponNumberController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story,BuildContext context) {
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
       // setState(() {
          if (storySmallGetxController.currentIndex.value - 1 >= 0) {
            storySmallGetxController.currentIndex.value -= 1;
            _loadStory(story: stories[storySmallGetxController.currentIndex.value]);
          } else {
            pageController1?.previousPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          }
        //});
      } else if (dx > 4 * screenWidth / 5) {
        //setState(() {
          if (storySmallGetxController.currentIndex.value + 1 < stories.length) {
            storySmallGetxController.currentIndex.value += 1;
            _loadStory(story: stories[storySmallGetxController.currentIndex.value]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            // _currentIndex = 0;
            //_loadStory(story: stories[_currentIndex]);
            pageController1?.nextPage(
                duration: Duration(milliseconds: 1000), curve: Curves.ease);
          }
        //});
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

        if (story.media == MediaType.video || story.media == MediaType.image) {
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

  Future<void> _loadStory({Story? story, bool animateToPage = true}) async {
    print("nextPage");
    storySmallGetxController.animController?.stop();
    storySmallGetxController.animController?.reset();
    storySmallGetxController.videoController?.dispose();
    storySmallGetxController.videoController = null;
    storySmallGetxController.videoIsInitailized.value = false;
    switch (story!.media) {
      case MediaType.image:
        storySmallGetxController.animController!.duration = story.duration;
        storySmallGetxController.animController?.forward();
        break;
      case MediaType.video:
        storySmallGetxController.videoController?.dispose();
        storySmallGetxController.videoController = null;
        storySmallGetxController.videoController = VideoPlayerController.network(story.url!);

        /*storySmallGetxController.videoController = VideoPlayerController.network(story.url!)
          ..initialize().then((_) {
            setState(() {});
            //storySmallGetxController.update();

            if (storySmallGetxController.videoController!.value.isInitialized) {
              storySmallGetxController.videoIsInitailized.value = true;
              storySmallGetxController.animController!.duration = storySmallGetxController.videoController!.value.duration;
              storySmallGetxController.videoController?.setVolume(50);
              storySmallGetxController.videoController!.play();
              storySmallGetxController.animController!.forward();
            }
          });*/
        break;
      case MediaType.audio:
      //videoGetxController.playButtonNotifier.value = ButtonState.paused;
      //Duration? dur = await videoGetxController.play(story.url);
      /// print("mDuration= ${dur?.inMinutes}");
      /*audioPlayer?.release();
           audioPlayer?.dispose();*/
        storySmallGetxController.audioPlayer = null;
        storySmallGetxController.audioPlayer = AudioPlayer();
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
      storySmallGetxController.pageController?.animateToPage(
        storySmallGetxController.currentIndex.value,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
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
  final User user;
  final VideoController videoGetxController = Get.find();

  UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: AppColors.saveButtonBottomSheet.withOpacity(.6),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
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
                    Stack(
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Text(
                          "محمدالتونى حماد",
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
                    "فاعليات مهرجان التمور من الفترة 2020 الى  2021",
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
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.grey[300],
                backgroundImage: CachedNetworkImageProvider(
                  user.profileImageUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}