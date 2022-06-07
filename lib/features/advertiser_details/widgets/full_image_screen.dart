import 'dart:io';
import 'package:advertisers/features/advertiser_details/widgets/vimoplaye_trinity.dart';
import 'package:advertisers/features/advertising_story_details/vimo_video/controls_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:better_player/better_player.dart';


class FullImageScreen extends StatelessWidget {
   String? imagePath;
   String? videoId;
   String? videoUrl;

  FullImageScreen({ this.imagePath,this.videoId,this.videoUrl});

  @override
  Widget build(BuildContext context) {

    /*if(videoId!=null && videoId!.isNotEmpty){
      BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network, videoUrl!,
          );
    }*/
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Primary full screen image
          videoId!=null && videoId!.isNotEmpty?
          VimeoPlayer(id: videoId,autoPlay: true,/*betterPlayerController:BetterPlayerController(
              BetterPlayerConfiguration(
                autoPlay: false,
                looping: false,
                fullScreenByDefault: false,
                aspectRatio: 9/16,
                fit: BoxFit.cover,
                controlsConfiguration: BetterPlayerControlsConfiguration(showControls: false,enableQualities: true),
              ),
             )*/)
         /* SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: Get.size.width ?? 0,
                height: Get.size.height ?? 0,
                child: VimeoPlayer(id: '680589403',autoPlay: true,),
              ),
            ),
          )*/

          /*AspectRatio(
              aspectRatio: 1.7,
              child: VimeoPlayer(id: '680589403'))*/
          /*Column(children: [

              Expanded(child: AspectRatio(
                  aspectRatio: 16/4,
                  child: VimeoPlayer(id: '680589403'*//*story.video_id*//*, autoPlay: true, loaderColor: Colors.pink,allowFullScreen: false,))),
            ],
          )*/:Container(
            //height: 300,
            child: imagePath!=null && imagePath!.startsWith("http")?CachedNetworkImage(
              imageUrl: imagePath!,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ):Image.file(
              File(imagePath!),
              fit: BoxFit.contain,
            ),
          ),

          // Custom appbar
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Appbar up action
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: (){
                         Get.back();
                        },
                        child: Container(
                          //color: Colors.grey,
                          margin: EdgeInsets.all(12.0),
                          child: SvgPicture.asset('images/arrow_back.svg',
                            // matchTextDirection: true,
                            height: 50, fit: BoxFit.fitHeight,color: Colors.grey,),
                        ),
                      ),

                    ],
                  ),
                  /*Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Material(
                      color: Colors.black45,
                      shape: const CircleBorder(),
                      child: Padding(
                        padding:
                        const EdgeInsets.fromLTRB(12.0, 12.0, 4.0, 12.0),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white70,
                          ),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ),*/

                  // Appbar country favourite icon indicator
                ],
              ),
            ),
          ),

          // Bottom destinations widget
        ],
      ),
    );
  }
}