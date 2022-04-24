import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/AdvertiserProfileModel.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../main.dart';

class OverlayHandlerProvider  extends GetxController{

  OverlayEntry? overlayEntry;
  double _aspectRatio = 1.77;
  bool inPipMode = false;
  bool isHidden =false;
  int currentPage = 0;
  bool isBottomAdsShown = false;
  int sheetId = -1;
  bool isProfileOpend = false;
  int? advertiserId;
  int? adId;
  AdsListModel? adsListModelModel;
  var isLikedObs = false.obs;
  var in_blackList = 0.obs;
  var isInfront = false.obs;
  var isNotifiable = false.obs;




  enablePip(double aspect) {
    inPipMode = true;
    _aspectRatio = aspect;
    print("$inPipMode enablePip");
    update();
  }

  disablePip() {
    inPipMode = false;
    print("$inPipMode disablePip");
    update();
  }

  get overlayActive => overlayEntry != null;
  get aspectRatio => _aspectRatio;

  insertOverlay(BuildContext context, OverlayEntry overlay) {
    if(overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
    inPipMode = false;
    Overlay.of(context,/*rootOverlay: true,*/)?.insert(overlay);
    overlayEntry = overlay;
  }
   insertOverlay2(BuildContext context, OverlayEntry overlay) {
     /*if(overlayEntry != null) {
       overlayEntry?.remove();
     }
     overlayEntry = null;
     inPipMode = false;*/

     Overlay.of(context)?.insert(/*overlayEntry!,above:*/ overlay,above: overlayEntry);

     //overlayEntry = overlay;
   }

  removeOverlay(BuildContext context) {
    if(overlayEntry != null) {
      overlayEntry?.remove();
    }
    overlayEntry = null;
  }

  void updateHidden(bool bool,double height) {
    isHidden = bool;
   // Constants.VIDEO_TITLE_HEIGHT_PIP = height;
    update();
  }

  Future<void> getProvile() async {
    EasyLoading.show();
    isLikedObs.value=false;
    in_blackList.value=0;
     isInfront.value = false;
     isNotifiable.value = false;

    String myToken  = await storage.read("token");
    print("in addddd");
    client!.getAdDetails(adId,"Bearer "+myToken).then((value) {
      // Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        //Get.back();

        if(value.data!=null) {
          if (EasyLoading.isShow) {
            EasyLoading.dismiss();
          }
          adsListModelModel = value.data;
          if(adsListModelModel?.user?.is_notified_user!=null && adsListModelModel!.user!.is_notified_user!){
            isNotifiable.value = adsListModelModel!.user!.is_notified_user!;
          }
          if(adsListModelModel?.user?.is_ads_in_front!=null && adsListModelModel!.user!.is_ads_in_front!){
            isInfront.value = adsListModelModel!.user!.is_ads_in_front!;
          }
          if(adsListModelModel?.user?.in_blacklist!=null && adsListModelModel!.user!.in_blacklist! ){
            in_blackList.value = 1;
          }

          if(adsListModelModel?.user?.is_liked!=null && adsListModelModel!.user!.is_liked! ){
            isLikedObs.value = true;
          }
          //iisMutedObs.value = advertiserProfileModel.;
          update();
        }
      }
    });
  }

  Future<void> rateAds(int id,double rate) async {
   String myToken = await storage.read("token");
    if(myToken==null ) {
      showMyToast("مشكلة غير معروفة !");
      return;
    }
   print("token");
    client!.rateAds(id,rate,"Bearer "+myToken).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        showMyToast("تم تقييم المحتوى بنجاح !");
        print("تم التقييم");
      }
    });
  }

  Future<void> favoriteAds(int id) async {
    String myToken = await storage.read("token");
    if(myToken==null ) {
      showMyToast("مشكلة غير معروفة !");
      return;
    }
    if(adsListModelModel?.is_favourite!=null &&adsListModelModel!.is_favourite!){
      Fluttertoast.showToast(
          msg: "تم إضافة هذاالاعلان إلى المفضلة بنجاح !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          //fontFamily: 'Arabic-Regular',
          fontSize: 16.0);
      return;
    }
    client!.favouriteAd(id,"Bearer "+myToken!).then((value) {
      print("token");
      Logger().i(value.status.toString());
      if(value.status==200){
        if(value.data?.liked!=null && value.data!.liked==1){
          Fluttertoast.showToast(
              msg: "تم إضافة هذاالاعلان إلى المفضلة بنجاح !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              //fontFamily: 'Arabic-Regular',
              fontSize: 16.0);
        }else{
          Fluttertoast.showToast(
              msg: "تم حذف هذاالاعلان من المفضلة بنجاح !",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              //fontFamily: 'Arabic-Regular',
              fontSize: 16.0);
        }


        // Get.back();
        print("token used");
        Logger().i(value.data.toString());
      }
    });
  }

  void showMyToast(String msg,/*bool error,BuildContext context*/) {
       FocusManager.instance.primaryFocus?.unfocus();
       Fluttertoast.showToast(
         msg: msg,
         toastLength: Toast.LENGTH_LONG,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor:Colors.grey,
         textColor: Colors.white,
         //fontFamily: 'Arabic-Regular',
         fontSize: 16.0);
  }
}