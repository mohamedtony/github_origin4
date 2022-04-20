import 'package:advertisers/features/gallery/controller/gallery_controller.dart';
import 'package:advertisers/features/gallery/view/gallery_card.dart';
import 'package:advertisers/features/gallery/view/image_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/features/my_comments_advertiser/controller/comments_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class GalleryPage extends  GetWidget<GalleryController>  {

  final GalleryController  controller = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<GalleryController>(
      init: GalleryController(),
      builder: (controller) => SafeArea(
          child: Scaffold(

              body: Column(
                children: [
                  AppBarWidget(isFilter: true,isSideMenu: false,isSearchBar: true),


                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          height: 30.0,
                          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xff4184CE)
                          ),
                          child: Text('المفضلة',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                        ),
                        SvgPicture.asset('images/savetodrive.svg',height: 52.43.h,
                          width: 47.43.w,fit: BoxFit.fitHeight,),
                      ],
                    ),
                  ),

                  SizedBox(height:18.h),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10),
                        padding: const EdgeInsets.only(bottom:10,left: 15,right: 15),
                        itemCount: controller.galleryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return controller.galleryList[index].type!=null&&controller.galleryList[index].type=="video"?
                          GalleryCard(url: "https://www.youtube.com/watch?v=dYZXeShv7nQ"/*controller.galleryList[index].path*/
                            ,itemId: controller.galleryList[index].id,)
                          : controller.galleryList[index].type!=null&&controller.galleryList[index].type=="image"?
                          ImageCard(url:controller.galleryList[index].path,itemId: controller.galleryList[index].id,)
                          :Container();
                        }
                        //"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
                    ),
                    ),


                ],
              ))),
    );
  }

}