import 'package:advertisers/features/advertiser_settings_page/controller/AdvertiserSettingPageController.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
// import 'package:advertisers/home_page/app_colors.dart';
// import 'package:advertisers/home_page/controller/home_navigation_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserSettingsPage extends StatelessWidget {
   AdvertiserSettingsPage({Key? key}) : super(key: key);
   var controller = Get.put(AdvertiserSettingPageController(), permanent: false);
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
              Expanded(
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
              )
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
        // shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.0, top: 4.0),
                        child: SvgPicture.asset(
                          'images/setting_icon.svg',
                          height: 32,
                          width: 32,
                          //color:  Color(0xff486ac7),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.toNamed("/clientSettingPage?from=advertiserPage");
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 18.0,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'edit'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.editProfileTextColor,
                                fontSize: 18.0,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 3.0, left: 8.0, bottom: 10.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'فرد',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.editProfileTextColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Obx(() =>
                      controller.accountType.value.isNotEmpty &&
                          controller.accountType.value == "client"
                          ? Container(
                        //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                        padding: const EdgeInsets.only(
                            left: 10.0, bottom: 10.0, top: 2.0),
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
                            right: 10.0, bottom: 10.0, top: 2.0),
                        //margin: EdgeInsets.only(bottom: 10.0),
                        child: Image.asset(
                          'images/switch_icon_left.png',
                          scale: 2,
                          width: 45,
                          height: 40,
                          fit: BoxFit.fill,
                        ),
                      )),
                      /* Container(
                          // height: 70,
                          margin: EdgeInsets.only(bottom: 6.0),
                          child: Image.asset(
                            'images/switch_icon_left.png',
                            scale: 2,
                          )

                          */ /*Switch(
                          onChanged: (s){

                          },
                          value: true,
                          //activeColor: Colors.white,
                         /// activeTrackColor: AppColors.beginColor,
                         // inactiveThumbColor: Colors.white,
                         // inactiveTrackColor: Colors.grey,
                          activeThumbImage: AssetImage('images/switch_icon.png'),
                          inactiveThumbImage: AssetImage('images/inactive_img.png'),
                        ),*/ /*
                          ),*/
                      Container(
                        margin: const EdgeInsets.only(
                            right: 3.0, left: 20.0, bottom: 10.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'كيان',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.dividerBottom,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Container(
                  margin: EdgeInsets.only(top: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            right: 3.0, left: 20.0, bottom: 10.0),
                        alignment: Alignment.center,
                        child: Text(
                          'فرد',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.editProfileTextColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        // height: 70,
                          margin: EdgeInsets.only(bottom: 6.0),
                          child: Image.asset(
                            'images/switch_icon_left.png',
                            scale: 2,
                          )

                        *//*Switch(
                          onChanged: (s){

                          },
                          value: true,
                          //activeColor: Colors.white,
                         /// activeTrackColor: AppColors.beginColor,
                         // inactiveThumbColor: Colors.white,
                         // inactiveTrackColor: Colors.grey,
                          activeThumbImage: AssetImage('images/switch_icon.png'),
                          inactiveThumbImage: AssetImage('images/inactive_img.png'),
                        ),*//*
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: 3.0, left: 20.0, bottom: 10.0),
                        alignment: Alignment.center,
                        child: Text(
                          'كيان',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.dividerBottom,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                )*/
              ],
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 0.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: Text(
                      "اسم الكيان",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: TextField(
                      textAlign: TextAlign.start,
                      enabled: false,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.kayanNameController,
                      style: TextStyle(
                          color: (AppColors.editProfileTextColorOpa)
                              .withOpacity(0.51),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'اسم الكيان',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: Text(
                      "اسم الحساب",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: TextField(
                      textAlign: TextAlign.start,
                      enabled: false,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.accountNameEdit,
                     // textDirection: mt.TextDirection.ltr,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'اسم الحساب',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: Text(
                      "رقم السجل",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      enabled: false,
                      controller: controller.sglNumberController,
                      //textDirection: mt.TextDirection.ltr,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'رقم السجل',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Divider(
              color: AppColors.dividerBottom,
              thickness: 4.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ),
          InkWell(
            onTap: (){
              controller.showActivitiesBottomSheet(context,1);
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                        //height: 42,

                       // width: 110,
                      padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "اختر النشاطات التى ترغب للاعلان عنها",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              //top: 4.0,
                              right: 8.0
                                  ,bottom: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/notice_icon.svg',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.fill,
                            color: AppColors.bottomSheetTabColorRounded,
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
                              //top: 4.0,
                              right: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/list_item.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                            //color: AppColors.bottomSheetTabColorRounded,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              controller.showLocationBottomSheet(context,1);
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      //height: 42,

                      // width: 110,
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "نطاق التأثير الجغرافى",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                            //top: 4.0,
                              right: 8.0
                              ,bottom: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/notice_icon.svg',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.fill,
                            color: AppColors.bottomSheetTabColorRounded,
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
                            //top: 4.0,
                              right: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/location_img.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                            //color: AppColors.bottomSheetTabColorRounded,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              //controller.showChannelsSheet(context,1);
              Get.toNamed('/AdvertisingInfluenceChannelsPage');
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      //height: 42,

                      // width: 110,
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "قنوات الإعلان والتأثير",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                            //top: 4.0,
                              right: 8.0
                              ,bottom: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/notice_icon.svg',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.fill,
                            color: AppColors.bottomSheetTabColorRounded,
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
                            //top: 4.0,
                              right: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/channels_icon.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                            //color: AppColors.bottomSheetTabColorRounded,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed('/TaxSettingsPage');
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      //height: 42,

                      // width: 110,
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "اعدادات الضريبة",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                            //top: 4.0,
                              right: 8.0
                              ,bottom: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/notice_icon.svg',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.fill,
                            color: AppColors.bottomSheetTabColorRounded,
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
                            //top: 4.0,
                              right: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/tax_icn.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                            //color: AppColors.bottomSheetTabColorRounded,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed('/AdvertiserAccountStatusPage');
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      //height: 42,

                      // width: 110,
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "حالة الحساب",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                            //top: 4.0,
                              right: 8.0
                              ,bottom: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/notice_icon.svg',
                            width: 26.0,
                            height: 26.0,
                            fit: BoxFit.fill,
                            color: AppColors.bottomSheetTabColorRounded,
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
                            //top: 4.0,
                              right: 8.0
                          ),
                          child: SvgPicture.asset(
                            'images/lock_icon.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.fill,
                            //color: AppColors.bottomSheetTabColorRounded,
                          ),
                          decoration: BoxDecoration(
                            //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                            borderRadius: BorderRadius.circular(8.0),
                            /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed('/AdvancedOptionsPage');
            },
            child: Container(
              margin: EdgeInsets.only(right: 18.0,left:18.0,top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      //height: 42,

                      // width: 110,
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          "اعدادات متقدمة",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        //top: 4.0,
                          right: 8.0
                      ),
                      child: SvgPicture.asset(
                        'images/advanced_settings.svg',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fill,
                        //color: AppColors.bottomSheetTabColorRounded,
                      ),
                      decoration: BoxDecoration(
                        //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                        borderRadius: BorderRadius.circular(8.0),
                        /*image: DecorationImage(
                                                image: AssetImage("images/image1.jpg"),
                                                fit: BoxFit.cover,
                                              )*/
                      )),
                ],
              ),
            ),
          ),


          /*Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 145,
                  height: 35,
                  margin: EdgeInsets.only(right: 35.0, top: 35.0),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      *//*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*//*
                      alignment: Alignment.center,
                      child: Text(
                        'save'.tr,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),

                    ),
                  ),
                ),
                Container(
                  width: 145,
                  height: 35,
                  margin: EdgeInsets.only( left: 35.0, top: 35.0),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.tabColor,
                    child: Container(
                      *//*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*//*
                      alignment: Alignment.center,
                      child: Text(
                        'cancel'.tr,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),

                    ),
                  ),
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }
}


