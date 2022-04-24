import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/features/advertising_story_details/Dragabble/overlay_handler.dart';
import 'package:advertisers/features/advertising_story_details/VideoController.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:advertisers/features/home_page/controller/favorite_page_controller.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key,this.onSheetClicked, this.onAdveriseItemClicked,this.type}) : super(key: key);
  Function(int x)? onSheetClicked;
  Function(int x)? onAdveriseItemClicked;
  String? type;
  HomeNavController homeNavController = Get.find();
  OverlayHandlerProvider overlayHandlerProvider = Get.find();
  FavoritePageController adsPageController = Get.put(FavoritePageController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // print("MainPOP");
        print("AdvertisingPage");
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
        if(overlayHandlerProvider.overlayActive) {

          print("isOpen= "+overlayHandlerProvider.isProfileOpend.toString());
          if(!overlayHandlerProvider.isProfileOpend){
            overlayHandlerProvider.disablePip();
            overlayHandlerProvider.removeOverlay(context);
            overlayHandlerProvider.currentPage = 0;
            Get.delete<VideoController>();
            // Get.delete<AdsPageController>();
            // overlayHandlerProvider.isProfileOpend = false;
          }else{
            overlayHandlerProvider.updateHidden(false, 300);
            Get.delete<VideoController>();
            //Get.delete<AdsPageController>();
            Get.back();
          }
          /*overlayHandlerProvider.disablePip();
          overlayHandlerProvider.removeOverlay(context);
          overlayHandlerProvider.currentPage = 0;*/
          return false;
        }
        return true;
      },
      child: Scaffold(
         appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
      child: AppBar(
        leading: InkWell(
          onTap: (){
            Get.toNamed("/ListPage");
            /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListPage()*//*ClientSettingPage(),*//*
                          ),
                        );*/
          },
          child: Container(

            margin: EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset(
              'images/DrawerIcon.svg',
              color: Colors.white,
            ),
          ),
        ),
        leadingWidth: 56.0,
        title: Container(
          height: 40.0,
          // alignment: Alignment.center,
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                prefixIcon: Container(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'images/search_icon.svg',
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    //onSheetClicke!(10);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'images/filter_icon.svg',
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                //hintText: "Type in your text",
                fillColor: Colors.white70),
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed('/NotificationsPage');
            },
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: SvgPicture.asset(
                'images/notification_icon.svg',
                //color: Colors.white,
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.beginColor, AppColors.endColor],
            ),
          ),
        ),
        elevation: 2,
        //  bottom: ,
      ),
    ),
        body: Column(
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
              child:  Container(
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
                      child: Text(
                        'المفضلة',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Image.asset(
                        'images/heart_solid.png',
                        fit: BoxFit.fill,
                        height: 25.0,
                        width: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
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
            ),
          ],
        ),
      ),
    );
  }
}
