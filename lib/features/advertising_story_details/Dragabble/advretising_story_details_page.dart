import 'package:advertisers/features/advertising_story_details/Dragabble/constants.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/advertising_story_details/data.dart';
import 'package:advertisers/features/advertising_story_details/small_ads_page.dart';
import 'package:advertisers/features/advertising_story_details/story_page.dart';
import 'package:advertisers/features/advertising_story_details/story_page_controller_forsmall.dart';
import 'package:advertisers/features/advertising_story_details/story_page_forsmall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertisingStoryDetailsPage extends StatelessWidget {
  AdvertisingStoryDetailsPage({Key? key,required this.onSheetCliked}) : super(key: key);
   Function(int x) onSheetCliked;
  final VideoController videoController = Get.put(VideoController(),permanent: true);
  OverlayHandlerProvider overlayHandlerProvider = Get.find();

   PageController pageController=PageController(initialPage: 0, viewportFraction: 1,);
 // StorySmallGetxController  storySmallGetxController = Get.put(StorySmallGetxController());
  double aspectRatio = 16/9;
  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<OverlayHandlerProvider>(
        init: overlayHandlerProvider,
        builder: (controller)
    {
     return AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: controller.inPipMode ? (Constants.VIDEO_TITLE_HEIGHT_PIP*aspectRatio) : MediaQuery.of(context).size.width,
        color: Colors.black,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Scaffold(
             resizeToAvoidBottomInset: false,
            body: PageView.builder(
              itemCount: 6,
              controller: pageController,
              onPageChanged: (x) {
                //storySmallGetxController.currentIndex.value=0;
              },
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                //final data = videoController.videoList[index];
                return Stack(
                  children: [

                    /*StoryForSmallScreen(
                  stories: mStories,
                  pageController1: pageController,
                  onClicked: (){
                    videoController.isSmall.value=true;
                    //pageController.viewportFraction = 0.5;
                  },
                ),*/
                    StoryScreen(
                      stories: mStories,
                      pageController1: pageController,
                      onClicked: () {
                        videoController.isSmall.value = true;
                        //pageController.viewportFraction = 0.5;
                      },
                      onSheetCliked: (ind){

                      },
                    ),
                    /*SmallAdsPage(
                  stories: stories,
                  pageController1: pageController,
                )*/
                  ],
                );
              },
            )
        ),
      );
     /* return Container(
          child: PageView.builder(
            itemCount: 6,
            controller: pageController,
            onPageChanged: (x) {
              //storySmallGetxController.currentIndex.value=0;
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              //final data = videoController.videoList[index];
              return Stack(
                children: [

                  *//*StoryForSmallScreen(
                  stories: mStories,
                  pageController1: pageController,
                  onClicked: (){
                    videoController.isSmall.value=true;
                    //pageController.viewportFraction = 0.5;
                  },
                ),*//*
                  StoryScreen(
                    stories: mStories,
                    pageController1: pageController,
                    onClicked: () {
                      videoController.isSmall.value = true;
                      //pageController.viewportFraction = 0.5;
                    },
                  ),
                  *//*SmallAdsPage(
                  stories: stories,
                  pageController1: pageController,
                )*//*
                ],
              );
            },
          )
      );*/
    });
  }
}