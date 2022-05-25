import 'package:advertisers/features/gallery/controller/gallery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:video_player/video_player.dart';

class ImageCard extends StatefulWidget {

  final String?  url;
  final int? itemId;

  const ImageCard({ this.url, this.itemId,Key? key,}) : super(key: key);
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
   late bool visible;

  @override
  void initState() {
    visible = false;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            height: 169.h,
            // width: 342.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(widget.url!),fit: BoxFit.fill)
            ),
          ),
          Positioned(
              left: 5,
              top: 5,


            child:  PopupMenuButton(
              color: Colors.transparent,
                  icon:  SvgPicture.asset('images/Share.svg'),
                  itemBuilder:(context) => [
                    PopupMenuItem(
                      onTap: null,
                      enabled: false,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,child:SvgPicture.asset('images/Icon feather-share-2.svg') ),
                            InkWell(
                              onTap: (){
                                Get.defaultDialog(
                                    title: "هل تريد حذف هذه الصورة !",
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Get.put(GalleryController()).deleteAnItemInGallery(id: widget.itemId);
                                            Get.back();
                                            Get.back();
                                          },
                                          child: Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Padding(
                                              padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                              child: Center(child: Text("نعم",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                            ),
                                          ),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            Get.back();
                                          },
                                          child: Container(
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Padding(
                                              padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                              child: Center(child: Text("لا",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                            ),
                                          ),
                                        ),

                                      ],),
                                    backgroundColor: Colors.white,
                                    titleStyle: const TextStyle(color: Colors.red,fontSize: 16),
                                    barrierDismissible: false
                                );

                              },

                              child: CircleAvatar(
                                radius: 15,
                                  backgroundColor: Colors.white54,child: SvgPicture.asset('images/Icon material-delete-sweep.svg')),
                            ),
                          ],
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      onTap: null,
                      enabled: false,
                      child:SizedBox(
                        width:100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,child: SvgPicture.asset('images/Icon awesome-share.svg')),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,
                                child: SvgPicture.asset('images/Icon feather-save.svg')),

                          ],
                        ),
                      ),
                      value: 2,
                    )
                  ]
              )

          )
        ],
      ),
    );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    return
      [QudsPopupMenuWidget(
          builder: (c) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: IntrinsicWidth(
                stepWidth: .1,
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                      ])
              )
          )
      )];
  }
}
