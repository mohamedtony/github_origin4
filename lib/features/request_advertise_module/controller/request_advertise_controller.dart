import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/activities_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/location_range_sheet.dart';
import 'package:advertisers/features/home_page/controller/home_navigation_controller.dart';
import 'package:advertisers/features/home_page/model/SelectedSocialMedia.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/address_bottom_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/discount_coupon_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/notice_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/send_request_success.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class RequestAdvertiseController extends GetxController {
  var isLoadingTypes = true.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<AdTypeModel> ads_types = <AdTypeModel>[].obs;
  RxList<Channel> channels = <Channel>[].obs;
  String? myToken ;

  RxList<SelectedSocialMedia> items = <SelectedSocialMedia>[].obs;
  final ImagePicker _picker = ImagePicker();
  late final List<XFile>? images2;
  late final  HomeNavController controller;
  List<String> images=['images/snapshat_icon.png','images/instegram.png',
    'images/twitter.png','images/youtube.png','images/facebook.png','images/whatsup.png',];
  @override
  Future<void> onInit() async {
    // TODO: implement onInit

     myToken  = await storage.read("token");
    client!.getProductsAndAdsTypes("Bearer "+myToken!).then((value) {
      Logger().i(value.data?.toJson());
      if(value.data!=null&&value.status==200){
        //Get.back();

        if(value.data!=null) {
          if(value.data!.product_types!=null) {
            categories.value = value.data!.product_types!;
            categories.value.insert(0, CategoryModel(id: -1,name: 'نوع المنتج'));

          }
          if(value.data!.ads_types!=null) {
            ads_types.value = value.data!.ads_types!;
            ads_types.value.insert(0, AdTypeModel(id: -1,name: 'نوع الاعلان'));
          }
          if(value.data!.channels!=null) {
            channels.value = value.data!.channels!;
          }
        }
        isLoadingTypes.value =false;
      }
    });


     controller = Get.find<HomeNavController>();
    SelectedSocialMedia selectedSocialMedia =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia);
    SelectedSocialMedia selectedSocialMedia1 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia1);
    SelectedSocialMedia selectedSocialMedia2 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia2);
    SelectedSocialMedia selectedSocialMedia3 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia3);
    SelectedSocialMedia selectedSocialMedia4 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia4);
    SelectedSocialMedia selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    selectedSocialMedia5 =SelectedSocialMedia();
    selectedSocialMedia.changeMyModel(0, false);
    items.value.add(selectedSocialMedia5);
    super.onInit();

  }
  void changeTabIndex(int indexCome,bool isTap) {
    if(channels.value[indexCome].isTapped.value==true){
      channels.value[indexCome].isTapped.value=false;
    }else{
      channels.value[indexCome].isTapped.value=true;
    }
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
            if(bottomNumber==2) {
              /*return AdvertisingChannelsPage(
                  scrollController: scrollController);*/
              return LocationRangeBottomSheet(
                  scrollController: scrollController);

            }else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else if(bottomNumber==4){
              return UrlsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==20){
              return AddressBottomSheet(
                  scrollController: scrollController);
            }
            else if(bottomNumber==21){
              return SendRequestSuccess(
                  scrollController: scrollController);
            }else if(bottomNumber==5){
              return NoticeSheet(
                  scrollController: scrollController);
            }else{
              return DiscountCouponSheet(
                  scrollController: scrollController);
            }
          },
        );
      },
    );
  }

  Future<void> pickImages() async {
    images2 = await _picker.pickMultiImage();
    print("imagemm"+images2.toString());
  }

}
