import 'package:advertisers/features/client_setting_page/client_setting_page.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_page.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/address_bottom_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class FilterOrderAdvertisers extends StatelessWidget {
  FilterOrderAdvertisers({Key? key,this.onSheetClicked}) : super(key: key);
  Function(int x)? onSheetClicked;
  RequestAdvertiseController requestAdvertiseController=Get.put(RequestAdvertiseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165.0),
        child: Container(
          height: 145,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: InkWell(
                              onTap: (){
                                Get.toNamed('/AdvertiserQrPage');
                              },
                              child: Image.asset(
                                'images/qrcode.png',
                                width: 40.0,
                                height: 45.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            decoration: BoxDecoration(
                              //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                              borderRadius: BorderRadius.circular(8.0),
                              /*image: DecorationImage(
                                              image: AssetImage("images/image1.jpg"),
                                              fit: BoxFit.cover,
                                            )*/
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                top: 4.0,
                                right: 16.0
                            ),
                            child: SvgPicture.asset(
                              'images/green_icon.svg',
                              width: 12.0,
                              height: 12.0,
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                              borderRadius: BorderRadius.circular(8.0),
                              /*image: DecorationImage(
                                              image: AssetImage("images/image1.jpg"),
                                              fit: BoxFit.cover,
                                            )*/
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 4.0, top: 0.0),
                          child: Text(
                            'نشط',
                            style: TextStyle(color: Colors.white, fontSize: 16.0,decoration: TextDecoration.underline,decorationThickness: 4,
                              decorationStyle:
                              TextDecorationStyle.dashed,),
                          ),
                        ),

                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10.0, top: 35.0),
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
              /*Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 10.0,
                          top: 14.0
                      ),
                      alignment: Alignment.center,
                      child:Obx(()=> Text(
                        '% ${controller.clientProfileModel.value.profile_completion??''}',
                        textAlign: TextAlign.center,
                        textDirection: mt.TextDirection.ltr,
                        style: TextStyle(
                            color: AppColors.indicatorColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600
                          //  decoration: TextDecoration.underline,
                          //  decorationThickness: 2
                        ),
                      )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(

                            alignment: Alignment.center,
                            child: Text(
                              'معدل اكتمال اعدادات الحساب',
                              textAlign: TextAlign.center,
                              textDirection: mt.TextDirection.ltr,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400
                                //  decoration: TextDecoration.underline,
                                //  decorationThickness: 2
                              ),
                            ),
                          ),
                          Obx(()=>Container(
                            margin: EdgeInsets.only(right: 14.0,left: 14.0,bottom: 10.0),
                            child: StepProgressIndicator(
                              totalSteps: 10,
                              currentStep: controller.profile_completion.value,
                              size: 4,
                              selectedColor: AppColors.indicatorColor,
                              unselectedColor: Colors.white,
                              progressDirection: mt.TextDirection.rtl,
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              )*/
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.beginColor, AppColors.endColor],
            ),
          ),
        ),
      ),
      body: ListView(
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
                child: DropdownSearch<String>(
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
                    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    // label: "Menu mode",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: 'productType'.tr),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                height: 45.0,
                child: DropdownSearch<String>(
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
                    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    // label: "Menu mode",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: 'adType'.tr),
              ),
              Container(
                height: 85.0,
                margin: EdgeInsets.only(
                    top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
                decoration: DottedDecoration(
                  dash: <int>[2, 4],
                  shape: Shape.box,
                  color: AppColors.dottedColor,
                  strokeWidth: 2,
                  borderRadius: BorderRadius.circular(
                      10), //remove this to get plane rectange
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8.0, right: 16.0),
                        child: Text(
                          'adDescription'.tr,
                          style:
                          TextStyle(color: AppColors.adVertiserPageDataColor),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  InkWell(
                    onTap: (){
                      //requestAdvertiseController.showMyBottomSheet(context,2);
                      onSheetClicked!(2);
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
                      onSheetClicked!(3);
                      //requestAdvertiseController.showMyBottomSheet(context,3);
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
                      // requestAdvertiseController.showMyBottomSheet(context,4);
                      onSheetClicked!(4);
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
                      requestAdvertiseController.showMyBottomSheet(context,20);
                      // onSheetClicked!(20);
                    },
                    child: Container(
                      width: 165,
                      height: 50,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 16.0),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
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
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //requestAdvertiseController.showMyBottomSheet(context,6);
                      // onSheetClicked!(6);
                      requestAdvertiseController.showMyBottomSheet(context,21);
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
                      // requestAdvertiseController.showMyBottomSheet(context,5);
                      onSheetClicked!(5);
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
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindAdvertisePage(
                        onSheetClicked: (x){
                          //  print('tony:sheetClicked');
                          this.onSheetClicked!(x);
                        },
                      ),
                    ),
                  );
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
              ),
            ],
          ),
        ],
      ),
    );
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
              return AdvertisingChannelsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else if(bottomNumber==13){
              return AddressBottomSheet(
                  scrollController: scrollController);
            }else {
              return UrlsPage(
                  scrollController: scrollController);
            }
          },
        );
      },
    );
  }
}
