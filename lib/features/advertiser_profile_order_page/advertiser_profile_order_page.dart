import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/advertiser_copons_tab.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/my_advertising_page_tab.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/request_order_tab.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/chat/view/pages/chat_recent_page.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:advertisers/features/home_page/view/pages/advertising_page.dart';
import 'package:advertisers/features/home_page/view/pages/copons_page.dart';
import 'package:advertisers/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:logger/logger.dart';

import '../../app_core/network/models/User.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserProfileOrderPage extends StatelessWidget {
  AdvertiserProfileOrderPage({Key? key,this.onSheetClicked}) : super(key: key);
  Function(int x)? onSheetClicked;
  AdvertiserProfileOrderController advertiserProfileController = Get.find();
  OverlayHandlerProvider2 overlayHandlerProvider = Get.put(OverlayHandlerProvider2());
  OverlayHandlerProvider overlayHandlerProvider1 = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()async{
        print("advertiserProfile");
       // print("Exit_profile");
       // print("MainPOP");
        //Get.back();
        /* if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.enablePip(1.77);
          return false;
        }*/
        // Get.delete<VideoController>();
        // Get.delete<AdsPageController>();
        /*final VideoController videoController = Get.put(VideoController());
        OverlayHandlerProvider overlayHandlerProvider = Get.find();
        AdsPageController adsPageController = Get.put(AdsPageController());*/

        //Get.delete<VideoController>();
      //  Get.delete<AdsPageController>();
        //Get.back();

        if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.updateHidden(false, 300);
          overlayHandlerProvider.removeOverlay(context);
          print("isOpen= "+overlayHandlerProvider.isProfileOpend.toString());
/*          if(!overlayHandlerProvider.isProfileOpend){
            overlayHandlerProvider.disablePip();
            overlayHandlerProvider.removeOverlay(context);
            overlayHandlerProvider.currentPage = 0;
            // overlayHandlerProvider.isProfileOpend = false;
          }else{
            overlayHandlerProvider.updateHidden(false, 300);
            Get.delete<VideoController>();
            Get.delete<AdsPageController>();
            Get.back();
          }*/
          /*overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          overlayHandlerProvider.currentPage = 0;*/
          return false;
        }else{
          print("hererer111");
          if(overlayHandlerProvider.isProfileOpend){
            print("hererer");
            overlayHandlerProvider.disablePip();
            overlayHandlerProvider.removeOverlay(context);
            overlayHandlerProvider.currentPage = 0;
            // overlayHandlerProvider.isProfileOpend = false;
          }else{
            print("hererer2");
            overlayHandlerProvider1.updateHidden(false, 300);
            //Get.delete<VideoController>();
           // Get.delete<AdsPageController>();
            Get.back();

          }
          return true;
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(220.0),
          child: GetBuilder<AdvertiserProfileOrderController>(
            init: advertiserProfileController,
            builder: (controller) =>  Stack(
              children: [
                Container(
                  height: 185,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                // fit: StackFit.expand,
                                children: [
                                  Container(
                                    height: 80,
                                    margin:
                                    const EdgeInsets.only(top: 35, right: 25.0, bottom: 6,left: 25),
                                    //padding: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(6.0),
                                      border: Border.all(color: Colors.white, width: 1),
                                    ),
                                    child: Obx(() => Container(
                                        padding: const EdgeInsets.all(
                                          4.0,
                                        ),
                                        child: advertiserProfileController.imagePath.value.isNotEmpty
                                            ? Image.file(
                                          File(advertiserProfileController.imagePath.value),
                                          width: 75.0,
                                          height: 75.0,
                                          fit: BoxFit.fill,
                                        )
                                            : CachedNetworkImage(
                                          imageUrl: advertiserProfileController.advertiserProfileModel?.image!=null?advertiserProfileController.advertiserProfileModel!.image!:"",
                                          placeholder: (context, url) =>
                                          const SpinKitThreeBounce(
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                          errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                          width: 70.0,
                                          height: 80.0,
                                          fit: BoxFit.fitHeight,
                                        ) /*Image.asset(
                                  'images/image1.jpg',
                                  width: 50.0,
                                  height: 60.0,
                                  fit: BoxFit.fitHeight,
                                )*/
                                        ,
                                        decoration: BoxDecoration(
                                          //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                                          borderRadius: BorderRadius.circular(8.0),
                                          /*image: DecorationImage(
                                            image: AssetImage("images/image1.jpg"),
                                            fit: BoxFit.cover,
                                          )*/
                                        ))),
                                  ),
                                  /*Positioned(
                                  top: 35.0,
                                  right: 3.0,
                                  child: Obx(()=>InkWell(
                                      onTap: advertiserProfileController.isEnabled.value
                                          ?() {
                                        //controller.deleteImage(index);
                                        advertiserProfileController.showChoiceImageDialog(context);
                                      }:null,
                                      child: Container(
                                        // alignment: Alignment.topLeft,
                                        *//*decoration: BoxDecoration(
                                      shape: BoxShape.circle
                                      ,color: Colors.white

                                  ),*//*
                                        padding: const EdgeInsets.all(0.0),
                                        child: Image.asset(
                                          'images/camera_icon.png',
                                          height: 45,
                                          width: 45,
                                          //color:  Color(0xff486ac7),
                                        ),
                                      ))),
                                ),*/
                                  Positioned(
                                      top: 35.0,
                                      left: 1,
                                      child: InkWell(
                                          onTap: () {
                                            //controller.deleteImage(index);
                                          },
                                          child: Container(
                                            alignment: Alignment.bottomCenter,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: advertiserProfileController.clientProfileModel.value.country?.image==null || advertiserProfileController.clientProfileModel.value.country!.image!.isEmpty? Image.asset(
                                              'images/flag.png',
                                              fit: BoxFit.fill,
                                              height: 32.0,
                                              width: 32.0,
                                            ):CachedNetworkImage(
                                              imageUrl: advertiserProfileController
                                                  .clientProfileModel.value.image ??
                                                  '',
                                              placeholder: (context, url) =>
                                              const SpinKitThreeBounce(
                                                color: Colors.grey,
                                                size: 25,
                                              ),
                                              errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                              fit: BoxFit.fill,
                                              height: 32.0,
                                              width: 32.0,
                                            ) ,
                                          )))
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10.0, top: 5.0),
                                    child: Text(
                                      advertiserProfileController.advertiserProfileModel?.username!=null?advertiserProfileController.advertiserProfileModel!.username!:'',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        advertiserProfileController.advertiserProfileModel?.username!=null?advertiserProfileController.advertiserProfileModel!.username!:'',
                                        textDirection: TextDirection.ltr,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14.0),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              print("Hereeeeeeeeeeeeeeeeee");
                              //Navigator.of(context).pop();
                             // Navigator.of(context).pop();
                             // Get.back();
                            //  Navigator.maybePop(context);
                              //SystemNavigator.pop();
                              //Get.offAndToNamed("/home");
                             // exit(0);
                             // SystemNavigator.pop();


                              if(Get.previousRoute.isEmpty){
                                print("previousRoute=> ${Get.previousRoute}");
                                //SystemNavigator.pop();
                                Get.offNamedUntil('/Home', (route) => false);
                              }else{
                                Get.back();
                                overlayHandlerProvider1.updateHidden(false, 300);
                              }
                             // overlayHandlerProvider1.updateHidden(false, 300);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(left: 10.0, top: 4.0),
                              child: SvgPicture.asset(
                                "images/back_button.svg",
                                height: 45,
                                width: 45,
                                // matchTextDirection: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //width: 250.0,
                        height: 40.0,
                        margin: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(()=>InkWell(
                              onTap: () async {
                                String myToken = await storage.read("token");
                                if(myToken==null ) {
                                  showMyToast("?????????? ?????? ???????????? !");
                                  return;
                                }
                                client!.likeAdvertiser(advertiserProfileController.advertiserProfileModel!.id,"Bearer "+myToken).then((value) {
                                  print("token");
                                  Logger().i(value.status.toString());
                                  if(value.status==200){

                                    if(value.data?.is_liked!=null && value.data!.is_liked==1){
                                      advertiserProfileController.isProfileFavorite.value  = true;
                                      advertiserProfileController.advertiserProfileModel!.is_liked = true;
                                      showMyToast("???? ???????????? ???????????? ?????????? !");
                                    }else{
                                      advertiserProfileController.isProfileFavorite.value  = false;
                                      advertiserProfileController.advertiserProfileModel!.is_liked = false;
                                      showMyToast("???? ?????????? ???????????? ???????????? ?????????? !");
                                    }
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                child:  advertiserProfileController.isProfileFavorite.isTrue? Image.asset(
                                  'images/heart_outline2.png',
                                  fit: BoxFit.fill,
                                  height: 25.0,
                                  width: 25.0,
                                ):Image.asset(
                                  'images/heart_dislike.png',
                                  fit: BoxFit.fill,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            )),
                            InkWell(
                              onTap: () async {
                              //  Get.to(ChatRecentPage());

                                //String myId = await storage.read("id");
                                dynamic data = await storage.read("data");

                               User user = User.fromJson(data);

                                print("UserId=${user.id}");
                                print("UserId=${user.username}");
                                print("UserIrrd=${advertiserProfileController.advertiserProfileModel!.id}");
                                Get.toNamed('/ChatPage?room=${advertiserProfileController.advertiserProfileModel!.id}-${user.id}'
                                    '&from_user=${json.encode(FromUserModel(id: user.id,username: user.username,image: user.image))}&to_user=${json.encode(ToUserModel(id:    advertiserProfileController.advertiserProfileModel?.id,image:    advertiserProfileController.advertiserProfileModel?.image,username:    advertiserProfileController.advertiserProfileModel?.username))}&id=${0}');

                              },
                              child: Container(
                                //margin: EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  'images/chat_icon_advertiser.png',
                                  fit: BoxFit.cover,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                advertiserProfileController.isShowChannelsClicked.value = true;
                                /*if(advertiserProfileController.isShowChannelsClicked.isTrue){
                                advertiserProfileController.isShowChannelsClicked.value = false;
                              }else{
                                advertiserProfileController.isShowChannelsClicked.value = true;
                              }*/
                              },
                              child: Container(
                                child: Image.asset(
                                  'images/rss.png',
                                  fit: BoxFit.cover,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.toNamed('/AdvertiserQrPage');
                              },
                              child: Container(
                                child: Image.asset(
                                  'images/qr_code.png',
                                  fit: BoxFit.cover,
                                  height: 25.0,
                                  width: 25.0,
                                ),
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                'images/Icon_material_stars.svg',
                                fit: BoxFit.cover,
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                advertiserProfileController.isShowDetailsClicked.value = true;
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  'images/dots.svg',
                                  fit: BoxFit.cover,
                                  height: 6.0,
                                  width: 6.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [ Color(0xFF589CD6),Color(0xFF4780C4)],
                          ),
                          shape: BoxShape.rectangle,
                          //color: Colors.red,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          ),
                          boxShadow: [
                            // so here your custom shadow goes:
                            BoxShadow(
                                color: Colors.black.withAlpha(25),
                                // the color of a shadow, you can adjust it
                                spreadRadius: 2,
                                //also play with this two values to achieve your ideal result
                                blurRadius: 4.0,
                                offset: Offset(2,
                                    1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                  ),
                ),
                Obx(()=> advertiserProfileController.isShowDetailsClicked.isTrue?Positioned(
                  bottom: 1,
                  left: 1,
                  right: 1,
                  child: InkWell(
                    onTap: (){
                      if(advertiserProfileController.isShowDetailsClicked.isTrue){
                        advertiserProfileController.isShowDetailsClicked.value = false;
                      }else{
                        advertiserProfileController.isShowDetailsClicked.value = true;
                      }
                    },
                    child: Container(
                      color: AppColors.endColor,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 81.5.w,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [ Color(0xFF48DBE1),Color(0xFF4166CD),],
                              ),
                              shape: BoxShape.rectangle,
                              //color: Colors.red,
                              /* borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),*/
                              boxShadow: [
                                // so here your custom shadow goes:
                                BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    // the color of a shadow, you can adjust it
                                    spreadRadius: 2,
                                    //also play with this two values to achieve your ideal result
                                    blurRadius: 4.0,
                                    offset: Offset(2,
                                        1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                ),
                              ],
                            ),
                            child: Stack(
                                children:[
                                  Container(
                                    margin: EdgeInsets.only(top: 4.0),
                                    alignment:Alignment.topLeft,
                                    child: SvgPicture.asset(
                                      'images/Icon_material_stars.svg',
                                      // color: Colors.white,
                                      height: 14,
                                      width: 14,
                                    ),
                                  ),
                                  Container(
                                    alignment:Alignment.topCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text("??????????????????",style: const TextStyle(color: Colors.white,fontSize: 16),),
                                        Text('${advertiserProfileController.advertiserProfileModel?.followers??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),

                                      ],
                                    ),
                                  ),]
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 81.5.w,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [ Color(0xFF48DBE1),Color(0xFF4166CD),],
                              ),
                              shape: BoxShape.rectangle,
                              //color: Colors.red,
                              /* borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),*/
                              boxShadow: [
                                // so here your custom shadow goes:
                                BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    // the color of a shadow, you can adjust it
                                    spreadRadius: 2,
                                    //also play with this two values to achieve your ideal result
                                    blurRadius: 4.0,
                                    offset: Offset(2,
                                        1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text("??????????????",style: const TextStyle(color: Colors.white,fontSize: 16),),
                                Text(advertiserProfileController.advertiserProfileModel?.rate ??'',style: const TextStyle(color: Colors.white,fontSize: 18),),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 81.5.w,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [ Color(0xFF48DBE1),Color(0xFF4166CD),],
                              ),
                              shape: BoxShape.rectangle,
                              //color: Colors.red,
                              /* borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),*/
                              boxShadow: [
                                // so here your custom shadow goes:
                                BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    // the color of a shadow, you can adjust it
                                    spreadRadius: 2,
                                    //also play with this two values to achieve your ideal result
                                    blurRadius: 4.0,
                                    offset: Offset(2,
                                        1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text("???????? ????????",style: const TextStyle(color: Colors.white,fontSize: 16),),
                                Text(advertiserProfileController.advertiserProfileModel?.reply_speed??'',style: const TextStyle(color: Colors.white,fontSize: 18),),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 8.0),
                            width: 81.5.w,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [ Color(0xFF48DBE1),Color(0xFF4166CD),],
                              ),
                              shape: BoxShape.rectangle,
                              //color: Colors.red,
                              /* borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),*/
                              boxShadow: [
                                // so here your custom shadow goes:
                                BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    // the color of a shadow, you can adjust it
                                    spreadRadius: 2,
                                    //also play with this two values to achieve your ideal result
                                    blurRadius: 4.0,
                                    offset: Offset(2,
                                        1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(bottom: 6.0),
                                    child: Text("??????????????????",style: const TextStyle(color: Colors.white,fontSize: 16),)),
                                    Text('${advertiserProfileController.advertiserProfileModel?.ads_count??''}',style: const TextStyle(color: Colors.white,fontSize: 18),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ):SizedBox()),
                Obx(()=>advertiserProfileController.isShowChannelsClicked.isTrue?Positioned(
                  bottom: 1,
                  left: 1,
                  right: 1,
                  child: InkWell(
                    onTap: (){
                      if(advertiserProfileController.isShowChannelsClicked.isTrue){
                        advertiserProfileController.isShowChannelsClicked.value = false;
                      }else{
                        advertiserProfileController.isShowChannelsClicked.value = true;
                      }
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                          colors: [ Color(0xFF48DBE1),Color(0xFF4166CD),],
                        ),
                        shape: BoxShape.rectangle,
                        //color: Colors.red,
                        /* borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),*/
                        boxShadow: [
                          // so here your custom shadow goes:
                          BoxShadow(
                              color: Colors.black.withAlpha(25),
                              // the color of a shadow, you can adjust it
                              spreadRadius: 2,
                              //also play with this two values to achieve your ideal result
                              blurRadius: 4.0,
                              offset: Offset(2,
                                  1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: advertiserProfileController.advertiserProfileModel?.channels!=null && advertiserProfileController.advertiserProfileModel!.channels!.isNotEmpty?ListView.builder(
                          itemCount:  advertiserProfileController.advertiserProfileModel!.channels!.length ?? 0,
                          shrinkWrap: true,
                          scrollDirection : Axis.horizontal,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),
                              child: CachedNetworkImage(
                                imageUrl: advertiserProfileController.advertiserProfileModel!.channels![index].image??"",
                                placeholder: (context, url) =>
                                const SpinKitThreeBounce(
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                                fit: BoxFit.fill,
                                height: 38.0,
                                width: 55.0,
                              ),
                            );
                          }):Text("???? ???????? ??????????"),
                    ),
                  ),
                ):SizedBox())
              ],
            ),
          ),
        ),
        body: DefaultTabController(
            length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                elevation: 4.0,
                color: AppColors.bgTabColor,
                margin: EdgeInsets.only(bottom: 6.0),
                shadowColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: TabBar(
                    unselectedLabelColor: AppColors.tabColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.only(
                        left: 14.0, right: 14.0, top: 6.0, bottom: 4.0),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: AppColors.tabColor),
                    labelPadding:
                    const EdgeInsets.only(left: 4.0, right: 4.0),
                    indicatorPadding: const EdgeInsets.all(0),
                    tabs: [
                      Container(
                        child: Tab(
                          height: 30.0,
                          iconMargin: EdgeInsets.zero,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                'ads'.tr,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 30.0,
                        iconMargin: EdgeInsets.zero,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'coupons'.tr,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 30.0,
                        iconMargin: EdgeInsets.zero,
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '???????? ????????????',
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  MyAdvertisingPage(
                    /*onSheetClicked: (x){
                      this.onSheetClicke!(x);
                    },*/
                    type: "advertiserOrderProfiel",
                  ),
                  // RequestAdvertisePage(),

                  /*CoponsPage(),*/
                  AdvertiserCoponsTab(),
                  RequestOrderTab(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMyToast(String msg, {bool? error, BuildContext? context}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        //fontFamily: 'Arabic-Regular',
        fontSize: 16.0);
  }
/*  Future<bool> onWillPop() async {
    print("Exit_profile");
    print("MainPOP");
    //Get.back();
    *//* if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.enablePip(1.77);
          return false;
        }*//*
    // Get.delete<VideoController>();
    // Get.delete<AdsPageController>();
    *//*final VideoController videoController = Get.put(VideoController());
        OverlayHandlerProvider overlayHandlerProvider = Get.find();
        AdsPageController adsPageController = Get.put(AdsPageController());*//*
    if(overlayHandlerProvider.overlayActive) {

      print("isOpen= "+overlayHandlerProvider.isProfileOpend.toString());
      if(!overlayHandlerProvider.isProfileOpend){
        overlayHandlerProvider.disablePip();
        overlayHandlerProvider.removeOverlay(context);
        overlayHandlerProvider.currentPage = 0;
        // overlayHandlerProvider.isProfileOpend = false;
      }else{
        overlayHandlerProvider.updateHidden(false, 300);
        Get.delete<VideoController>();
        Get.delete<AdsPageController>();
        Get.back();
      }
      *//*overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          overlayHandlerProvider.currentPage = 0;*//*
      return false;
    }
    return true;
  }*/

}
