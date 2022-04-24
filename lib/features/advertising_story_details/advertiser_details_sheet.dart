import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/report_sheet.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/loading_dialog.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserDetailsSheet extends StatefulWidget {
  ScrollController? scrollController;

  AdvertiserDetailsSheet({Key? key, this.scrollController, AdsListModel? adsListModel}) : super(key: key);

  @override
  State<AdvertiserDetailsSheet> createState() => _AdvertiserDetailsSheetState();
}

class _AdvertiserDetailsSheetState extends State<AdvertiserDetailsSheet> {

   OverlayHandlerProvider overlayHandlerProvider=Get.find();

  @override
  void initState() {
    super.initState();
    overlayHandlerProvider.getProvile();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OverlayHandlerProvider>(
        init: overlayHandlerProvider,
        builder: (controller)
        {
          return  overlayHandlerProvider.adsListModelModel!=null?Scaffold(
            body: Container(
              color:Colors.white,
              //height: 50,
              child: ListView(
                controller: widget.scrollController,
                //physics:const AlwaysScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          //padding: EdgeInsets.all(8.0),
                          color: AppColors.bottomSheetTabColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    'images/dropdown.png',
                                    fit: BoxFit.fill,
                                    height: 35.0,
                                    width: 35.0,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [

                                      overlayHandlerProvider.adsListModelModel?.user?.image!=null && overlayHandlerProvider.adsListModelModel!.user!.image!.isNotEmpty?Container(
                                        margin: EdgeInsets.only(left: 14.0,top: 10.0),
                                        child: InkWell(
                                          onTap: (){
                                           /* overlayHandlerProvider.updateHidden(true, 0);
                                            videoController?.pause();
                                            animController?.stop();
                                            audioPlayer?.pause();
                                            print("sdvertiserId= ${adsListModel.id}");*/
                                           // Get.toNamed('/AdvertiserProfileOrderPage',arguments:GetAdvertisersModel(id: overlayHandlerProvider.adsListModelModel!.user?.id));
                                          },
                                          child: CircleAvatar(
                                            radius: 25.0,
                                            backgroundColor: Colors.grey[300],
                                            backgroundImage: CachedNetworkImageProvider(
                                              overlayHandlerProvider.adsListModelModel!.user!.image!,
                                            ),
                                          ),
                                        ),
                                      ): Container(
                                        margin: EdgeInsets.only(left: 14.0,top: 10.0),
                                        child: CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor: Colors.grey[300],
                                          backgroundImage: AssetImage('images/user.png'),
                                        ),
                                      ),
                                      if(overlayHandlerProvider.adsListModelModel?.user?.country?.image!=null && overlayHandlerProvider.adsListModelModel!.user!.country!.image!.isNotEmpty)Positioned(
                                        left:0.0,
                                        child:
                                        CircleAvatar(
                                          radius: 16.0,
                                          backgroundColor: Colors.grey[300],
                                          backgroundImage: CachedNetworkImageProvider(
                                            overlayHandlerProvider.adsListModelModel!.user!.country!.image!,
                                          ),
                                        ),)
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 6.0,bottom: 8),
                                      child: Text(
                                        '${overlayHandlerProvider.adsListModelModel?.user?.username??''}',
                                        style: TextStyle(
                                            color: AppColors.advertiseNameColor,
                                            fontSize: 24.0,
                                            fontFamily: 'DecoType-Regular',
                                            fontWeight: FontWeight.w400),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 158.0,
                                    // margin: EdgeInsets.only(left: 10.0,right: 3.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Obx(()=>InkWell(
                                          onTap: () async {

                                            String myToken = await storage.read("token");
                                            if(myToken==null ) {
                                              showMyToast("مشكلة غير معروفة !");
                                              return;
                                            }
                                            client!.likeAdvertiser(overlayHandlerProvider.adsListModelModel!.user!.id,"Bearer "+myToken).then((value) {
                                              print("token");
                                              // Logger().i(value.status.toString());
                                              if(value.status==200){

                                                if(value.data?.is_liked!=null && value.data!.is_liked==1){
                                                  overlayHandlerProvider.isLikedObs.value = true;
                                                  overlayHandlerProvider.adsListModelModel!.is_liked = true;
                                                  showMyToast("تم الإعجاب بالمعلن بنجاح !");
                                                }else{
                                                  overlayHandlerProvider.isLikedObs.value = false;
                                                  overlayHandlerProvider.adsListModelModel!.is_liked = false;
                                                  showMyToast("تم إلغاء الإعجاب بالمعلن بنجاح !");
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 2.0, right: 2.0),
                                            child: overlayHandlerProvider.isLikedObs.isTrue
                                                ?  SvgPicture.asset(
                                              'images/heart_filled.svg',
                                              fit: BoxFit.fill,
                                              height: 45.0,
                                              width: 45.0,
                                            ):SvgPicture.asset(
                                              'images/heart_solid.svg',
                                              fit: BoxFit.fill,
                                              height: 45.0,
                                              width: 45.0,
                                            ),
                                          ),
                                        ),),
                                        Obx(()=>Container(
                                          margin: overlayHandlerProvider.in_blackList.value==1
                                              ? EdgeInsets.only(left: 10.0, right: 10.0,bottom: 4.0)
                                              : EdgeInsets.only(left: 10.0, right: 10.0,bottom: 4.0),
                                          child: InkWell(
                                            onTap: () async {
                                              //blockedUsersController.removeBlockedUser(blockedUserModel.id!);
                                              String myToken = await storage.read("token");
                                              if(myToken==null ) {
                                                showMyToast("مشكلة غير معروفة !");
                                                return;
                                              }
                                              client!.blacklistAdvertiser(overlayHandlerProvider.adsListModelModel!.user!.id,"Bearer "+myToken).then((value) {
                                                //print("token= ${advertisersModel.id}");
                                                //Logger().i(value.status.toString());
                                                if(value.status==200){

                                                  if(value.data?.in_blacklist!=null && value.data!.in_blacklist==1){
                                                    overlayHandlerProvider.in_blackList.value = 1;
                                                    //overlayHandlerProvider.adsListModelModel!.is = 1;
                                                    showMyToast("تم متابعة المعلن بنجاح !");
                                                  }else{
                                                    overlayHandlerProvider.in_blackList.value = 0;
                                                    //overlayHandlerProvider.in_blackList.value  = 0;
                                                    showMyToast("تم إلغاء متابعة المعلن بنجاح !");
                                                  }
                                                }
                                              });
                                            },
                                            child:  overlayHandlerProvider.in_blackList.value ==0
                                                ? Image.asset(
                                              'images/icon_eye_open.png',
                                              fit: BoxFit.fill,
                                              height: 18.0,
                                              width: 26.0,
                                            ):Image.asset(
                                              'images/icon_eye_off.png',
                                              fit: BoxFit.fill,
                                              height: 23.0,
                                              width: 26.0,
                                            ),
                                          ),
                                        )),
                                        InkWell(
                                          onTap: () {
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 2.0, right: 2.0),
                                            child:/* advertisersModel.iisMutedObs.isTrue
                                                ? SvgPicture.asset(
                                              'images/chat_icon.svg',
                                              fit: BoxFit.fill,
                                              height: 45.0,
                                              width: 45.0,
                                            ):*/SvgPicture.asset(
                                              'images/chat_icon_dot.svg',
                                              fit: BoxFit.fill,
                                              height: 45.0,
                                              width: 45.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //========================================   'تقييم المحتوى'  ===============================

                        Container(
                          margin: EdgeInsets.only(right: 0.0,top: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: 10.0,top: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [AppColors.beginColor, AppColors.endColor],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'تقييم المحتوى',
                                    style: TextStyle(color: Color(0xff4184CE)),
                                    textAlign: TextAlign.center,
                                  ),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: RatingBar.builder(
                                  //initialRating: controller.adsListModelModel?.user?.rate!=null && controller.adsListModelModel!.user!.rate!.isNotEmpty?double.parse(controller.adsListModelModel!.user!.rate!):0.0,
                                  initialRating: controller.adsListModelModel?.user?.rate!=null ?controller.adsListModelModel!.user!.rate!.toDouble():0.0,

                                  minRating: 1,
                                  itemSize: 26,
                                  direction: Axis.horizontal,
                                  textDirection: TextDirection.ltr,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                    if(overlayHandlerProvider.adsListModelModel?.id!=null) {
                                      print("idddd= "+overlayHandlerProvider.adsListModelModel!.id.toString());
                                      overlayHandlerProvider.rateAds(
                                          overlayHandlerProvider.adsListModelModel!.id!,rating);
                                    }
                                  },

                                ),
                              )
                            ],
                          ),
                        ),

                        //========================================   'ابلاغ عن محتوى'  ===============================

                        InkWell(
                          onTap: (){
                            showMyBottomSheet(context,9);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width: 10,
                                  height: 10,
                                  margin: EdgeInsets.only(right: 10.0,top: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [AppColors.beginColor, AppColors.endColor],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'ابلاغ عن محتوى',
                                      style: TextStyle(color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 20,top:2.0),
                                    child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color:  Color(0xff486ac7),)),

                              ],
                            ),
                          ),
                        ),

                        //======================================== 'إظهار الاعلانات دائما فى المقدمة' ===============================
                        Container(
                          margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                          child: InkWell(
                            onTap: () async {
                              String myToken = await storage.read("token");
                              LoadingDailog().showLoading(context);
                              if(myToken==null ) {
                                showMyToast("مشكلة غير معروفة !");
                                Get.back();
                                return;
                              }
                              print("token${overlayHandlerProvider.adsListModelModel!.id}");
                              client!.in_front(overlayHandlerProvider.adsListModelModel!.id,"Bearer "+myToken).then((value) {
                                print("token${overlayHandlerProvider.adsListModelModel!.id}");
                                // Logger().i(value.status.toString());
                                Get.back();
                                if(value.status==200){
                                  if(value.message!=null) {
                                    showMyToast(value.message!);
                                  }
                                  if(value.data?.in_front!=null && value.data!.in_front==0 ){
                                    controller.isInfront.value = false;
                                    showMyToast("سوف يتم تعطيل إظهار الاعلانات الخاصة بهذا المعلن دائما فى المقدمة !");
                                  }else{
                                    controller.isInfront.value = true;
                                    showMyToast("سوف يتم إظهار الاعلانات الخاصة بهذا المعلن دائما فى المقدمة !");
                                  }
                                }
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width: 10,
                                  height: 10,
                                  margin: EdgeInsets.only(right: 10.0,top: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [AppColors.beginColor, AppColors.endColor],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'إظهار الاعلانات دائما فى المقدمة',
                                      style: TextStyle(color: Color(0xff4184CE)),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                                Obx(()=> Container(
                                  child: controller.isInfront.isTrue
                                      ? Container(
                                    //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: Image.asset(
                                      'images/switch_icon_right.png',
                                      scale: 2,
                                      width: 45,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Container(
                                    padding: const EdgeInsets.only(
                                      right: 10.0,
                                      //left: 10.0
                                    ),
                                    //margin: EdgeInsets.only(bottom: 10.0),
                                    child: Image.asset(
                                      'images/no_chat_left.png',
                                      scale: 2,
                                      width: 45,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),

                              ],
                            ),
                          ),
                        ),

                        //======================================== 'نبهنى بلإعلانات الجديدة' ===============================
                        Container(
                          margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                          child: InkWell(
                            onTap: () async {
                              String myToken = await storage.read("token");
                              LoadingDailog().showLoading(context);
                              if(myToken==null ) {
                                showMyToast("مشكلة غير معروفة !");
                                Get.back();
                                return;
                              }
                              print("token${overlayHandlerProvider.adsListModelModel!.id}");
                              client!.notify(overlayHandlerProvider.adsListModelModel!.id,"Bearer "+myToken).then((value) {
                                print("token${overlayHandlerProvider.adsListModelModel!.id}");
                                // Logger().i(value.status.toString());
                                Get.back();
                                if(value.status==200){
                                  if(value.data?.notified!=null && value.data!.notified==0 ){
                                    showMyToast("سوف يتم تعطيل الاشعارات الخاصة بأى اعلان جديد خاص بهذا المعلن");
                                    controller.isNotifiable.value = false;
                                  }else{
                                    showMyToast("سوف يتم ارسال اشعار بأى اعلان جديد خاص بهذا المعلن");
                                    controller.isNotifiable.value = true;
                                  }
                                }
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width: 10,
                                  height: 10,
                                  margin: EdgeInsets.only(right: 10.0,top: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [AppColors.beginColor, AppColors.endColor],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'نبهنى بلإعلانات الجديدة',
                                      style: TextStyle(color: Color(0xff4184CE)),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                                Obx(()=>Container(
                                  child: controller.isNotifiable.isTrue
                                      ? Container(
                                    //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: Image.asset(
                                      'images/switch_icon_right.png',
                                      scale: 2,
                                      width: 45,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Container(
                                    padding: const EdgeInsets.only(
                                      right: 10.0,
                                      //left: 10.0
                                    ),
                                    //margin: EdgeInsets.only(bottom: 10.0),
                                    child: Image.asset(
                                      'images/no_chat_left.png',
                                      scale: 2,
                                      width: 45,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),

                              ],
                            ),
                          ),
                        ),

                        //======================================== 'حفظ فى المفضلة' ===============================
                        Container(
                          margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: 10.0,top: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [AppColors.beginColor, AppColors.endColor],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    if(overlayHandlerProvider.adId!=null) {
                                      print("idddd= "+overlayHandlerProvider.adId.toString());
                                      overlayHandlerProvider.favoriteAds(overlayHandlerProvider.adId!);
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'حفظ فى المفضلة',
                                      style: TextStyle(color: Color(0xff4184CE)),
                                      textAlign: TextAlign.center,
                                    ),),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 20,top:2.0),
                                  child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color:  Color(0xff486ac7),)),

                            ],
                          ),
                        ),

                        //======================================== 'شارك الملف التعريفى مع' ===============================
                        Container(
                          margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: 10.0,top: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [AppColors.beginColor, AppColors.endColor],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'شارك الملف التعريفى مع',
                                    style: TextStyle(color: Color(0xff4184CE)),
                                    textAlign: TextAlign.center,
                                  ),),
                              ),
                              Directionality(textDirection: TextDirection.ltr, child: Container(
                                width: 35.0,
                                height: 35.0,
                                //padding: EdgeInsets.all(10),
                                /* decoration: new BoxDecoration(
                                            color: Colors.grey[300],
                                            shape: BoxShape.circle,
                                          ),*/
                                child: Image.asset(
                                  'images/telegram.png',
                                  height: 25,
                                  width: 30,
                                  fit: BoxFit.fill,
                                  matchTextDirection: true,
                                  //color: Colors.white,
                                ),
                              ),)

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ):const Center(child: CircularProgressIndicator(color: Colors.blue,));
        });

  }

   @override
   void dispose() {
     // TODO: implement dispose
     print("disposeeeeee");
     overlayHandlerProvider.sheetId = -1;
     overlayHandlerProvider.isBottomAdsShown = false;
     overlayHandlerProvider.isProfileOpend = false;

     super.dispose();
     Future.delayed(Duration.zero, () async {
       overlayHandlerProvider.updateHidden(false, 300);
     });

   }
   void showMyBottomSheet(BuildContext context,int bottomNumber){
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
             topLeft: const Radius.circular(10.0),
             topRight: const Radius.circular(10.0)),
       ),
       clipBehavior: Clip.antiAliasWithSaveLayer,
       builder: (BuildContext context) {
         return DraggableScrollableSheet(
           //maxChildSize: 0.8,
           //minChildSize: 100.0,

           initialChildSize: 0.67,
           expand: false,
           builder: (context, scrollController) {
             return ReportSheet(
                 scrollController: scrollController,id:overlayHandlerProvider.adId);
           },
         );
       },
     );
   }
   void showMyToast(String msg) {
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
}
