import 'package:advertisers/features/advertising_story_details/Dragabble/advretising_story_details_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_service.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/players/video_player_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/players/video_player_title_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

   String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  OverlayHandlerProvider overlayHandlerProvider = Get.put(OverlayHandlerProvider());
  _addVideoOverlay() {
    OverlayService().addVideosOverlay(context, VideoPlayerPage());
  }
  _addVideoWithTitleOverlay() {
    OverlayService().addVideoTitleOverlay(context, AdvertisingStoryDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("MainPOP");
       /* if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.enablePip(1.77);
          return false;
        }*/
        if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Add Video With Drag Overlay"),
                onPressed: () {
                  _addVideoOverlay();
                },
              ),
              RaisedButton(
                child: Text("Add Video With Title Overlay"),
                onPressed: () {
                  _addVideoWithTitleOverlay();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}