import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
class FirebaseDynamicLinkService{

  static Future<String> createDynamicLink(bool  short, int id,int page,bool isProfile) async{
    String _linkMessage;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://diwanads.page.link',
      link: isProfile?Uri.parse('https://diwanads.page.link/AdvertiserProfileOrderPage?id=${id}'):Uri.parse('https://diwanads.page.link/AdvertisingStoryDetailsPage?id=${id}&page=${page}'),
      androidParameters: AndroidParameters(
        packageName: 'com.diwan.advertisers',
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
          fallbackUrl:Uri.parse('https://diwanads.page.link'),
          bundleId: 'com.diwan.advertisers')
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    _linkMessage = url.toString();
    return _linkMessage;
  }


  static Future<void> initDynamicLink()async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    /*Future.delayed(const Duration(seconds: 2),() {
      dynamicLinks.getInitialLink().then((value) {
        print("initialLink=${value!.link.toString()}");
      });
    });*/
    dynamicLinks.onLink.listen((event) {
      //Future.delayed(const Duration(seconds: 2),(){
        print("hDeepLinke=${event.link.toString()}");
        Uri uri = event.link;
        var isAds = uri.pathSegments.contains("ads");
        if(isAds){
          String? storyId = uri.queryParameters['id'];
          print("StroryId=${storyId}");
          if(storyId!=null){
            print("StroryId=${storyId}");
           // Get.offAndToNamed("/Home");
          }
        }
     // });


    }).onError((e){
      print("Error=${e}");
    });


  }

 /* static Future<void> initDynamicLink(BuildContext context)async {
    dynamicLinks.onLink.listen((event) {
      onSuccess: (PendingDynamicLinkData dynamicLink) async{
        final Uri deepLink = dynamicLink.link;

        var isStory = deepLink.pathSegments.contains('storyData');
        // TODO :Modify Accordingly
        if(isStory){
          String id = deepLink.queryParameters['id'];
          // TODO :Modify Accordingly

          if(deepLink!=null){

            // TODO : Navigate to your pages accordingly here

            // try{
            //   await firebaseFirestore.collection('Stories').doc(id).get()
            //       .then((snapshot) {
            //         StoryData storyData = StoryData.fromSnapshot(snapshot);
            //
            //         return Navigator.push(context, MaterialPageRoute(builder: (context) =>
            //           StoryPage(story: storyData,)
            //         ));
            //   });
            // }catch(e){
            //   print(e);
            // }
          }else{
            return null;
          }
        }
      }, onError: (OnLinkErrorException e) async{
      print('link error');
      }
    });


    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    try{
      final Uri deepLink = data.link;
      var isStory = deepLink.pathSegments.contains('storyData');
      if(isStory){ // TODO :Modify Accordingly
        String id = deepLink.queryParameters['id']; // TODO :Modify Accordingly

        // TODO : Navigate to your pages accordingly here

        // try{
        //   await firebaseFirestore.collection('Stories').doc(id).get()
        //       .then((snapshot) {
        //     StoryData storyData = StoryData.fromSnapshot(snapshot);
        //
        //     return Navigator.push(context, MaterialPageRoute(builder: (context) =>
        //         StoryPage(story: storyData,)
        //     ));
        //   });
        // }catch(e){
        //   print(e);
        // }
      }
    }catch(e){
      print('No deepLink found');
    }
  }*/
}