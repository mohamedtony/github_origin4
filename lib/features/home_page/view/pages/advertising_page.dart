import 'package:advertisers/features/advertising_story_details/Dragabble/advretising_story_details_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_service.dart';
import 'package:advertisers/features/advertising_story_details/small_ads_page.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertisingPage extends StatelessWidget {
   AdvertisingPage({Key? key,this.onSheetClicked, this.onAdveriseItemClicked,this.type}) : super(key: key);
   Function(int x)? onSheetClicked;
   Function(int x)? onAdveriseItemClicked;
   String? type;
   HomeNavController homeNavController = Get.put(HomeNavController());
   OverlayHandlerProvider overlayHandlerProvider = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("MainPOP");
        Get.back();
        /* if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.enablePip(1.77);
          return false;
        }*/
        /*if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          return false;
        }*/
        return true;
      },
      child: Stack(
        children: [
          ListView(
            children: [
              //Obx(()=>homeNavController.isSmall.isTrue?SmallAdsPage():SizedBox()),
              InkWell(
                onTap: (){
                  //_addVideoWithTitleOverlay(context);
                  this.onAdveriseItemClicked!(0);
                },
                  child: AdvertiseItem()),
              AdvertiseItem(),
              AdvertiseItem(),
              AdvertiseItem(),
              AdvertiseItem(),
            ],
          ),
          type!=null && type=="advertiserOrderProfiel"?SizedBox():Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestAdvertisePage(
                        onSheetClicked: (x){
                        //  print('tony:sheetClicked');
                          this.onSheetClicked!(x);
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 62,
                  height: 62,
                  margin: EdgeInsets.all(5),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("requestAdvertise".tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 14.0,color: Colors.white),))
                  ,decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.beginColor, AppColors.endColor],
                  ),
                ),),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
