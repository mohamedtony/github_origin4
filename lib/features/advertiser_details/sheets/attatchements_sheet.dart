import 'dart:io';

import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/attatchement_page_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AttatchementPage extends StatelessWidget {
  // ScrollController? scrollController;
  // AttatchementPage({Key? key,this.scrollController}) : super(key: key);
  // final AttatchementPageController controller = Get.put(AttatchementPageController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) => Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(10.0),
              topRight:  Radius.circular(10.0)),
        ),
        child: ListView(
          // controller: this.scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.all(8.0),
                  color: AppColors.bottomSheetTabColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                        width: 140.0,
                        //padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text('attachments'.tr,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.tabColor),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Image.asset(
                          'images/attatch_file_icon.png',
                          fit: BoxFit.fill,
                          height: 25.0,
                          width: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.dividerBottom,
                  thickness: 4.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0,
                      width: 140.0,
                      //padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(top: 8,right:18.0,left:18.0),
                      child: Text('attachmentName'.tr,style: TextStyle(color: AppColors.adVertiserPageDataColor,fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      width: 45,
                      height: 35,
                      margin: EdgeInsets.only(right: 10.0, left: 30.0, top: 0.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: AppColors.addPhotoBottom,
                        child: InkWell(
                          onTap: ()async{
                            // controller.getImageToAttachedList;




                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: Text(
                                        'صورة'),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) => CupertinoActionSheet(
                                          actions: [
                                            CupertinoActionSheetAction(
                                              child: Text(
                                                  'الكاميرا'),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await controller.getImageToAttachedList(fromGallery: false);
                                              },
                                            ),
                                            CupertinoActionSheetAction(
                                              child: Text(
                                                  'معرض الصور'),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await controller.getImageListToAttachedList(fromGallery: true);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                      // await controller.getImageToAttachedList(fromGallery: false);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text(
                                        'فيديو'),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) => CupertinoActionSheet(
                                          actions: [
                                            CupertinoActionSheetAction(
                                              child: Text(
                                                  'الكاميرا'),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await controller.getVideoToAttachedList(fromGallery: false);
                                              },
                                            ),
                                            CupertinoActionSheetAction(
                                              child: Text(
                                                  'معرض الصور'),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await controller.getVideoToAttachedList(fromGallery: true);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                      // await controller.getImageToAttachedList(fromGallery: true);
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                          child: Container(
                            //margin: EdgeInsets.only(left: 15.0),
                            padding: EdgeInsets.only(top: 8.0,bottom: 8.0,right: 12,left: 12.0),
                            child: Image.asset(
                              'images/plus_circle.png',
                              fit: BoxFit.fill,
                              height: 12.0,
                              // width: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 18.0,left: 18.0,bottom: 8.0,top: 12.0),
                  shrinkWrap: true,
                  itemCount: controller.attachedImagesList.length??0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    //childAspectRatio: 100 / 150,
                    height: 100.0,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) =>

                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:10,left: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Material(
                              elevation: 6.0,
                              shadowColor: Colors.grey[200],
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              //borderOnForeground: true,
                              color: AppColors.saveButtonBottomSheet,
                              child: controller.attachedImagesList[index].isVideo == 0 ? Container(
                                  child: Image.file(
                                    File(controller.attachedImagesList[index].file!.path),
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                                    borderRadius: BorderRadius.circular(8.0),
                                    /*image: DecorationImage(
                                        image: AssetImage("images/image1.jpg"),
                                        fit: BoxFit.cover,
                                      )*/
                                  )):VideoApp(
                                file: File(controller.attachedImagesList[index].file!.path),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: (){
                                controller.deleteFromAttachedImagesList(controller.attachedImagesList[index]);
                              },
                              child: Container(
                                // alignment: Alignment.topLeft,
                                  decoration:const BoxDecoration(
                                      shape: BoxShape.circle
                                      ,color: Colors.white
                                  ),
                                  child: Icon(Icons.cancel_outlined,color: AppColors.bottomSheetTabColorRounded,)),
                            ),
                          )
                        ],
                      ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 135,
                      height: 35,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.saveButtonBottomSheet,
                        child: Container(
                          /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                          alignment: Alignment.center,
                          child: Text(
                            'save'.tr,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.tabColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                    ),
                    Container(
                      width: 135,
                      height: 35,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.tabColor,
                        child: Container(
                          /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                          alignment: Alignment.center,
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
               const SizedBox(
                  height: 25,
                ),

              ],),
          ],
        ),
      ),
    );
  }
}


class VideoApp extends StatefulWidget {
  final File? file;
  VideoApp({this.file});
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
        File(widget.file!.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // title: 'Video Demo',
      // home: Scaffold(
        child:  _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller.value.isPlaying
        //           ? _controller.pause()
        //           : _controller.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      // ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}