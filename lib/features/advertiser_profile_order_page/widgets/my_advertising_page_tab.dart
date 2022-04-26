import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/features/advertiser_profile_order_page/advretising_story_details_page.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/MyAdsPageContoller.dart';
import 'package:advertisers/features/advertiser_profile_order_page/overlay_handler2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/overlay_service2.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class MyAdvertisingPage extends StatelessWidget {
  MyAdvertisingPage({Key? key,this.onSheetClicked, this.onAdveriseItemClicked,this.type}) : super(key: key);
   Function(int x)? onSheetClicked;
   Function(int x)? onAdveriseItemClicked;
   String? type;
   OverlayHandlerProvider2 overlayHandlerProvider = Get.put(OverlayHandlerProvider2());
   MyAdsPageContoller adsPageController = Get.put(MyAdsPageContoller());

  //OverlayHandlerProvider overlayHandlerProvider = Get.put(OverlayHandlerProvider());
  /* _addVideoOverlay(BuildContext context) {
      OverlayService().addVideosOverlay(context, AdvertisingStoryDetailsPage(

      ));
    }*/
  _addVideoWithTitleOverlay(BuildContext context) {
    OverlayService2().addVideoTitleOverlay(context, AdvertisingStoryDetailsPage(
      onSheetCliked: (context1,x){
        //  print('tony:sheetClicked');
       // showBottomSheetForRequest(context1, x);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: adsPageController.loadDataForAds,
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
                         //... this.onAdveriseItemClicked!(position);
                          _addVideoWithTitleOverlay(context);
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
    );
  }
}
