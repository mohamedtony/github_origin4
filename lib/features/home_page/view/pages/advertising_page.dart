import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/advretising_story_details_page.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_service.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/advertising_story_details/small_ads_page.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
   AdsPageController adsPageController = Get.put(AdsPageController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("MainPOP");
        //Get.back();
        /* if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.enablePip(1.77);
          return false;
        }*/
        Get.delete<VideoController>();
        Get.delete<AdsPageController>();
        /*final VideoController videoController = Get.put(VideoController());
        OverlayHandlerProvider overlayHandlerProvider = Get.find();
        AdsPageController adsPageController = Get.put(AdsPageController());*/
        if(overlayHandlerProvider.overlayActive) {
          overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          overlayHandlerProvider.currentPage = 0;
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: adsPageController.loadData,
            child: PagedListView<int, AdsListModel>(
              pagingController: adsPageController.pagingController,

              builderDelegate: PagedChildBuilderDelegate<AdsListModel>(
                animateTransitions: true,
                noItemsFoundIndicatorBuilder: (context){
                  return Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top:20.0),
                      child: Text('لا يوجد اعلانات  !',style:TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)));
                },
                /*firstPageProgressIndicatorBuilder: (context)=>ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0,),
                        child: ListTile(
                          leading: MyShimmerWidget.circular(height: 64, width: 64),
                          title: Align(
                            alignment: Alignment.centerLeft,
                            child: MyShimmerWidget.rectangular(height: 16,
                              width: MediaQuery.of(context).size.width*2,),
                          ),
                          // subtitle: MyShimmerWidget.rectangular(height: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0,),
                        child: ListTile(
                          leading: MyShimmerWidget.circular(height: 64, width: 64),
                          title: Align(
                            alignment: Alignment.centerLeft,
                            child: MyShimmerWidget.rectangular(height: 16,
                              width: MediaQuery.of(context).size.width*2,),
                          ),
                          // subtitle: MyShimmerWidget.rectangular(height: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0,),
                        child: ListTile(
                          leading: MyShimmerWidget.circular(height: 64, width: 64),
                          title: Align(
                            alignment: Alignment.centerLeft,
                            child: MyShimmerWidget.rectangular(height: 16,
                              width: MediaQuery.of(context).size.width*2,),
                          ),
                          // subtitle: MyShimmerWidget.rectangular(height: 14),
                        ),
                      )
                    ],
                  ),*/

                itemBuilder: (context, item, position) {
                  return  InkWell(
                      onTap: (){
                        adsPageController.changeIndex(position, item.id!);
                      },
                      child: InkWell(
                          onTap: (){
                            this.onAdveriseItemClicked!(position);
                          },
                          child: AdvertiseItem(item)));
                  /*if(findAdvertiseController.isLoading.value){
                      return   Container(
                        margin: EdgeInsets.only(top: 10.0,),
                        child: ListTile(
                          leading: MyShimmerWidget.circular(height: 64, width: 64),
                          title: Align(
                            alignment: Alignment.centerLeft,
                            child: MyShimmerWidget.rectangular(height: 16,
                              width: MediaQuery.of(context).size.width*2,),
                          ),
                          // subtitle: MyShimmerWidget.rectangular(height: 14),
                        ),
                      );
                    }else{
                      return  InkWell(
                          onTap: (){
                            findAdvertiseController.changeIndex(position, item.id!);
                          },
                          child: FindAdvertiseItem(advertisersModel:item,findAdvertiseController: controller,index: position,));
                    }*/
                },
              ),
            ),
          ),
          /*ListView(
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
          ),*/
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
