import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/address_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/advertising_channels_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/attatchements_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/discount_coupon_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/notice_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/widgets/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class RequestOrderTab extends StatelessWidget {
  RequestOrderTab({Key? key}) : super(key: key);
  AdvertiserProfileOrderController advertiserProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250.0,
                  height: 46.0,
                  margin: EdgeInsets.only(top: 18.0),
                  child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: SvgPicture.asset(
                          'images/advetrise_data_icon.svg',
                          fit: BoxFit.cover,
                          height: 24.0,
                          width: 30.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16.0, bottom: 4.0, right: 40),
                        child: Text(
                          'advertisingData'.tr,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                    shape: BoxShape.rectangle,
//color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
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
                Container(
                  margin: EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  height: 45.0,
                  child:Obx(()=> advertiserProfileController.isLoadingTypes.value?Container(
                    child: const SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 25,
                    ),
                  )
                      :advertiserProfileController.categories.isNotEmpty?DropdownSearch<CategoryModel>(
                      mode: Mode.MENU,
                      dropDownButton: Container(
                        margin: EdgeInsets.only(left: 0.0),
                        child: SvgPicture.asset(
                          'images/dropdown_icon.svg',
                          fit: BoxFit.fill,
                          height: 8.0,
                          width: 8.0,
                        ),
                      ),
                      dropdownSearchDecoration: InputDecoration(
// filled: true,
//fillColor: Color(0xFFF2F2F2),
                        contentPadding:
                        EdgeInsets.only(right: 20.0, top: 0.0, bottom: 0.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.borderDropDownColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.borderDropDownColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                      ),
                      items: advertiserProfileController.categories.value,
                      dropdownBuilder: (BuildContext context, s) {
                        return Text(
                          '${(s?.name ?? '')}',
                          style: TextStyle(
                              color: AppColors.tabColor.withOpacity(0.73),
/*decoration: TextDecoration.underline,decorationThickness: 2,*/
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        );
                      },
// label: "Menu mode",
                      itemAsString: (CategoryModel? u) =>
                      u?.itemAsStringByName() ?? '',
                      onChanged: (categoryModel){
                        if(categoryModel!.id!=-1) {
                          advertiserProfileController.categoryId =
                          categoryModel.id!;
                        }
                      },
                      selectedItem: advertiserProfileController.categories.value[0]
                  ): Container(
                      alignment: Alignment.centerRight,
                      child: const Text("لا يوجد منتجات"))),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                  height: 45.0,
                  child: Obx(()=>advertiserProfileController.isLoadingTypes.value?Container(
                    child: const SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 25,
                    ),
                  )
                      :advertiserProfileController.ads_types.isNotEmpty?DropdownSearch<AdTypeModel>(
                      mode: Mode.MENU,
//showSelectedItem: true,
                      dropDownButton: Container(
                        margin: EdgeInsets.only(left: 0.0),
                        child: SvgPicture.asset(
                          'images/dropdown_icon.svg',
                          fit: BoxFit.fill,
                          height: 8.0,
                          width: 8.0,
                        ),
                      ),
                      dropdownSearchDecoration: InputDecoration(
// filled: true,
//fillColor: Color(0xFFF2F2F2),
                        contentPadding:
                        EdgeInsets.only(right: 20.0, top: 0.0, bottom: 0.0),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.borderDropDownColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.borderDropDownColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                      ),
                      items: advertiserProfileController.ads_types.value,
                      dropdownBuilder: (BuildContext context, s) {
                        return Text(
                          '${(s?.name ?? '')}',
                          style: TextStyle(
                              color: AppColors.tabColor.withOpacity(0.73),
/*decoration: TextDecoration.underline,decorationThickness: 2,*/
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        );
                      },
// label: "Menu mode",
                      itemAsString: (AdTypeModel? u) =>
                      u?.itemAsStringByName() ?? '',
                      onChanged: (adTypeModel){
                        if(adTypeModel!.id!=-1) {
                          advertiserProfileController.adTypeId = adTypeModel.id!;
                        }
                      },
                      selectedItem: advertiserProfileController.ads_types.value[0]
                  ): Container(
                      alignment: Alignment.centerRight,
                      child: const Text("لا يوجد اعلانات"))),
                ),
                Container(
                  height: 90.0,
                  margin: EdgeInsets.only(
                      top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
                  decoration: DottedDecoration(
                    dash: <int>[3, 5],
                    shape: Shape.box,
                    color: AppColors.dottedColor,
                    strokeWidth: 2,
                    borderRadius: BorderRadius.circular(
                        10), //remove this to get plane rectange
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 4.0, right: 16.0),
                          child: Text(
                            'adDescription'.tr,
                            style:
                            TextStyle(color: AppColors.adVertiserPageDataColor),
                          )),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
//advertiserProfileController: advertiserProfileController.kayanNameController,
//enabled: advertiserProfileController.isEnabled.value,
                          maxLines: 2,
                          style: TextStyle(
                              color:  AppColors.tabColor.withOpacity(0.73),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 4.0, right: 4.0, bottom: 4.0),
// isCollapsed: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: AppColors.adVertiserPageDataColor),
//hintText: 'adDescription'.tr,
//
                              fillColor:Colors.white10
                          ), controller: advertiserProfileController.descriptionController,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                       // onSheetClicked!(1);
                        showBottomSheetForRequest( context, 1);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 8.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  'images/calender_icon.png',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 22.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20),
                                child: Text(
                                  'adDate'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
//advertiserProfileController.showMyBottomSheet(context,2);
                        //onSheetClicked!(2);
                        showBottomSheetForRequest( context, 2);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 8.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 18.0),
                                child: SvgPicture.asset(
                                  'images/tv_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 22.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20, top: 4.0),
                                child: Text(
                                  'adChannels'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
//Get.to(ClientSettingPage());
                        //onSheetClicked!(3);
                        showBottomSheetForRequest( context, 3);
                        FocusManager.instance.primaryFocus?.unfocus();
//advertiserProfileController.showMyBottomSheet(context,3);
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 24.0),
                                child: Image.asset(
                                  'images/attatch_file_icon.png',
                                  fit: BoxFit.fill,
                                  height: 30.0,
                                  width: 15.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 24),
                                child: Text(
                                  'attachments'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
// advertiserProfileController.showMyBottomSheet(context,4);
                       // onSheetClicked!(4);
                        showBottomSheetForRequest( context, 4);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 18.0),
                                child: SvgPicture.asset(
                                  'images/link_line_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 22.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20, top: 4.0),
                                child: Text(
                                  'links'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
//advertiserProfileController.showMyBottomSheet(context,20);
                        //onSheetClicked!(5);
                        showBottomSheetForRequest( context, 5);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child:  Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 24.0),
                                child: SvgPicture.asset(
                                  'images/location_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 24.0,
                                  width: 15.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20),
                                child: Text(
                                  'adTitle'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
//advertiserProfileController.showMyBottomSheet(context,6);
                        //onSheetClicked!(6);
                        showBottomSheetForRequest( context, 6);
                        FocusManager.instance.primaryFocus?.unfocus();
//advertiserProfileController.showMyBottomSheet(context,21);
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 18.0),
                                child: SvgPicture.asset(
                                  'images/pin_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 22.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20, top: 4.0),
                                child: Text(
                                  'addCoupon'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        showBottomSheetForRequest( context, 7);
                        //onSheetClicked!(7);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        width: 165,
                        height: 50,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 24.0),
                                child: SvgPicture.asset(
                                  'images/notice_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 15.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20),
                                child: Text(
                                  'noticeable'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 165,
                      height: 50,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                      child: InkWell(
                        onTap: ()=>advertiserProfileController.onPlanClicked(context),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 18.0),
                                child: SvgPicture.asset(
                                  'images/newspaper_outline.svg',
                                  fit: BoxFit.fill,
                                  height: 22.0,
                                  width: 22.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20, top: 4.0),
                                child: Text(
                                  'adPlan'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    advertiserProfileController.onSendRequestClicked(context);
                  },
                  child: Container(
                    //width: 135,
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right:50.0, left: 50.0, top: 10.0,bottom: 10.0),
                    child: Material(
                      elevation: 6.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.tabColor,
                      child: Container(
                        /*margin: EdgeInsets.only(
                            left: 12.0, bottom: 4.0, right: 20),*/
                        alignment: Alignment.center,
                        child: Text(
                          'أرسل طلبك',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),

                      ),
                    ),
                  ),
                ),
                /*InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FindAdvertisePage(
                          onSheetClicked: (x){
//  print('tony:sheetClicked');
                            //this.onSheetClicked!(x);
                          },
                        ),
                      ),
                    ).then((value) => FocusManager.instance.primaryFocus?.unfocus());
                  },
                  child: Container(
                    width: 250.0,
                    height: 44.0,
                    margin: EdgeInsets.only(top: 30.0, bottom: 60.0),
                    child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          bottomLeft: Radius.circular(22),
                        ),
                        child: Container(
                          child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  'images/advertising_icon.png',
                                  fit: BoxFit.fill,
                                  height: 24.0,
                                  width: 30.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.0, bottom: 4.0, right: 40),
                                child: Text(
                                  'findAdvertiser'.tr,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: AppColors.searchAdsColor,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.beginSearchAds,
                                AppColors.endSearchAds
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                            ),
                          ),
                        )),
                  ),
                ),*/
              ],
            ),
          ],
        )
    );
  }
  void showBottomSheetForRequest(BuildContext context,int bottomNumber){
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
          //maxChildSize: 0.9,
          initialChildSize: bottomNumber==6?0.84:0.67,
          expand: false,
          builder: (context, scrollController) {
            if(bottomNumber==1){
              return AdvertisingDatePage(
                  scrollController: scrollController
              );
            }
            else if(bottomNumber==2) {
              return AdvertisingChannelsPage(
                  scrollController: scrollController
              );
              /* return LocationRangeBottomSheet(
                    scrollController: scrollController);
*/
            }else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else if(bottomNumber==4){
              return UrlsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==5){
              return AddressBottomSheet(
                  scrollController: scrollController);
            }else if(bottomNumber==6){
              return DiscountCouponSheet(
                  scrollController: scrollController);
            }else /*if(bottomNumber==7)*/{
              return NoticeSheet(
                  scrollController: scrollController);
            }
          },
        );
      },
    );
  }
}
