import 'package:advertisers/features/advertiser_profile_order_page/VideoController2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/constants.dart';
import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/story_page.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertisingStoryDetailsPage extends StatelessWidget {
  AdvertisingStoryDetailsPage({Key? key,required this.onSheetCliked}) : super(key: key);
   Function(BuildContext context,int x) onSheetCliked;
  VideoController2 videoController2 = Get.put(VideoController2());
  OverlayHandlerProvider2 overlayHandlerProvider = Get.find();
   AdsPageController adsPageController = Get.put(AdsPageController());

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
    return GetBuilder<OverlayHandlerProvider2>(
        init: overlayHandlerProvider,
        builder: (controller)
    {
     return WillPopScope(
       onWillPop: ()async{
         print("story_details_in");
         return false;
       },
       child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: controller.inPipMode ? (Constants.VIDEO_TITLE_HEIGHT_PIP*aspectRatio) : MediaQuery.of(context).size.width,
          color: Colors.black,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Scaffold(
               resizeToAvoidBottomInset: false,
              body: Obx(()=>videoController2.adslistList.value.isNotEmpty?PageView.builder(
                itemCount: videoController2.adslistList.value.length??0,
                controller: videoController2.pageController,
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
                        stories: videoController2.adslistList.value[index].attachments,
                        index:index,
                        adsListModel: videoController2.adslistList.value[index],
                        user:videoController2.adslistList.value[index].user,
                        pageController1: videoController2.pageController,
                        onClicked: () {
                          videoController2.isSmall.value = true;
                          //Get.showOverlay(loadingWidget: Con);
                          //GetUtils
                          //pageController.viewportFraction = 0.5;
                        },
                        onSheetCliked: (context,ind){
                          this.onSheetCliked(context,ind);
                        },
                      ),
                      /*SmallAdsPage(
                    stories: stories,
                    pageController1: pageController,
                  )*/
                    ],
                  );
                },
              ):const Center(child: CircularProgressIndicator()))
          ),
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