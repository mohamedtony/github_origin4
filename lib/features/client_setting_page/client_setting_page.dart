import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:advertisers/features/advertiser_list_page/advertiser_list_item.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_page.dart';
import 'package:advertisers/features/client_list_page/client_list_item.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class ClientSettingPage extends StatelessWidget {
  ClientSettingPage({Key? key}) : super(key: key);
  ClientSettingPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(165.0),
        child: Container(
          height: 145,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    // fit: StackFit.expand,
                    children: [
                      Container(
                        height: 160,
                        margin:
                            const EdgeInsets.only(top: 55, right: 25.0, bottom: 32),
                        //padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Obx(() => Container(
                            padding: const EdgeInsets.all(
                              4.0,
                            ),
                            child: controller.imagePath.value.isNotEmpty
                                ? Image.file(
                                    File(controller.imagePath.value),
                                    width: 50.0,
                                    height: 60.0,
                                    fit: BoxFit.fill,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: controller
                                            .clientProfileModel.value.image ??
                                        '',
                                    placeholder: (context, url) =>
                                        const SpinKitThreeBounce(
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    width: 50.0,
                                    height: 60.0,
                                    fit: BoxFit.fitHeight,
                                  ) /*Image.asset(
                              'images/image1.jpg',
                              width: 50.0,
                              height: 60.0,
                              fit: BoxFit.fitHeight,
                            )*/
                            ,
                            decoration: BoxDecoration(
                              //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                              borderRadius: BorderRadius.circular(8.0),
                              /*image: DecorationImage(
                                        image: AssetImage("images/image1.jpg"),
                                        fit: BoxFit.cover,
                                      )*/
                            ))),
                      ),
                      Positioned(
                        top: 35.0,
                        right: 3.0,
                        child: Obx(()=>InkWell(
                            onTap: controller.isEnabled.value
                                ?() {
                              //controller.deleteImage(index);
                              controller.showChoiceImageDialog(context);
                            }:null,
                            child: Container(
                              // alignment: Alignment.topLeft,
                              /*decoration: BoxDecoration(
                                  shape: BoxShape.circle
                                  ,color: Colors.white

                              ),*/
                              padding: const EdgeInsets.all(0.0),
                              child: Image.asset(
                                'images/camera_icon.png',
                                height: 45,
                                width: 45,
                                //color:  Color(0xff486ac7),
                              ),
                            ))),
                      ),
                      Positioned(
                          bottom: 10.0,
                          left: 0.0,
                          right: 25.0,
                          child: InkWell(
                              onTap: () {
                                //controller.deleteImage(index);
                              },
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: controller.clientProfileModel.value.country?.image==null || controller.clientProfileModel.value.country!.image!.isEmpty? Image.asset(
                                  'images/flag.png',
                                  fit: BoxFit.fill,
                                  height: 32.0,
                                  width: 32.0,
                                ):CachedNetworkImage(
                              imageUrl: controller
                                  .clientProfileModel.value.image ??
                                '',
                                placeholder: (context, url) =>
                                const SpinKitThreeBounce(
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.fill,
                                height: 32.0,
                                width: 32.0,
                              ) ,
                              )))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10.0, top: 20.0),
                        child: Obx(() => Text(
                          controller.clientProfileModel.value.type=="client"?(controller.clientProfileModel.value.username ?? ''):(controller.clientProfileModel.value.company_name ?? ''),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Obx(() => Text(
                              '# ' +
                                  (controller.clientProfileModel.value
                                          .account_name ??
                                      ''),
                              textDirection: mt.TextDirection.ltr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 10.0, top: 35.0),
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
          decoration: const BoxDecoration(
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
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20.0, top: 4.0),
                        child: SvgPicture.asset(
                          'images/setting_person.svg',
                          height: 32,
                          width: 32,
                          //color:  Color(0xff486ac7),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.changeEdit();
                        },
                        child: Container(
                            margin: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            alignment: Alignment.center,
                            child: Obx(
                              () => Text(
                                controller.isEnabled.value
                                    ? 'إلغاء'
                                    : 'edit'.tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.editProfileTextColor,
                                    fontSize: 18.0,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2),
                              ),
                            )),
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
                      Obx(()=>InkWell(
                        onTap: controller.isEnabled.value
                            ? () {
                          if (controller.accountType.value.isNotEmpty &&
                              controller.accountType.value == "client") {
                            controller.accountType.value = "company";
                          } else {
                            controller.accountType.value = "client";
                          }
                        }
                            : null,
                        child: Container(
                          child: Obx(() =>
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
                )
              ],
            ),
          ),

          Obx(()=>controller.accountType.value == "company"?Container(
            height: 42,
            margin: const EdgeInsets.only(top: 0.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "اسم الكيان",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.kayanNameController,
                      enabled: controller.isEnabled.value,
                      style: TextStyle(
                          color: (AppColors.editProfileTextColorOpa)
                              .withOpacity(0.51),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'اسم الكيان',
                          fillColor: Colors.white70),
                    )),
                  ),
                ),
              ],
            ),
          ):Container(
            height: 42,
            margin: const EdgeInsets.only(top: 0.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "الاسم",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.userNameController,
                      enabled: controller.isEnabled.value,
                      style: TextStyle(
                          color: (AppColors.editProfileTextColorOpa)
                              .withOpacity(0.51),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'اسم المستخدم',
                          fillColor: Colors.white70),
                    )),
                  ),
                ),
              ],
            ),
          )),
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "اسم الحساب",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            bottomLeft: const Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.accountNameEdit,
                          enabled: controller.isEnabled.value,
                          textDirection: mt.TextDirection.ltr,
                          style: TextStyle(
                            color: (AppColors.editProfileTextColorOpa)
                                .withOpacity(0.51),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0, right: 14.0, bottom: 12.0),
                              // isCollapsed: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(70.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[350]),
                              hintText: 'اسم الحساب',
                              fillColor: Colors.white70),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Obx(()=>controller.accountType.value == "company"?Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "صاحب الحساب",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.accountOwner,
                      textDirection: mt.TextDirection.ltr,
                      enabled: controller.isEnabled.value,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'اسم صاحب الحساب',
                          fillColor: Colors.white70),
                    )),
                  ),
                ),
              ],
            ),
          ):const SizedBox()),
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    //controller.verifyPhone();
                  },
                  child: Container(
                      height: 42,
                      width: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0)),
                          color: AppColors.editProfileContainerColor),
                      child: const Text(
                        "تأكيد",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Colors.white),
                      )),
                ),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: const Border(
                          top: const BorderSide(
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
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.phoneController,
                          //textDirection: mt.TextDirection.ltr,
                          enabled: controller.isEnabled.value,
                          style: TextStyle(
                            color: (AppColors.editProfileTextColorOpa)
                                .withOpacity(0.51),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0.sp,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              // width: 100,
                              child: controller.isEnabled.value
                                  ? Container(
                                width: 90,
                                    child: CountryCodePicker(
                                        padding: const EdgeInsets.only(bottom: 2.0),
                                        // showFlag: false,
                                        flagWidth: 20,
                                searchDecoration: const InputDecoration(
                                      focusColor: AppColors.tabColor,focusedBorder:UnderlineInputBorder(),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.tabColor),)),
                                        initialSelection: controller.countryCode.value??'sa',

                                        onChanged: (countryCodeVal) {
                                          controller.countryCode.value =
                                              countryCodeVal.code!;
                                          print(
                                              '>>>>>>>>>>>>>>${countryCodeVal.code}    ${countryCodeVal.dialCode}     ${countryCodeVal.flagUri}');
                                        },
                                      ),
                                  )
                                  : const SizedBox(),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 0.0, right: 4.0, bottom: 8.0),
                            // isCollapsed: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[350]),
                            hintText: 'رقم الجوال',
                            fillColor: Colors.white70,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.editProfileContainerColor),
                    child: const Text(
                      "تحقق",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            bottomLeft: const Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.emailController,
                          enabled: controller.isEnabled.value,
                          //textDirection: mt.TextDirection.ltr,
                          style: TextStyle(
                            color: (AppColors.editProfileTextColorOpa)
                                .withOpacity(0.51),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0, right: 14.0, bottom: 12.0),
                              // isCollapsed: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(70.0),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[350]),
                              hintText: 'الايميل الاكترونى',
                              fillColor: Colors.white70),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Obx(()=>controller.accountType.value == "company"?Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: const Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "رقم السجل",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.sglNumberController,
                      textDirection: mt.TextDirection.ltr,
                      enabled: controller.isEnabled.value,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'رقم السجل',
                          fillColor: Colors.white70),
                    )),
                  ),
                ),
              ],
            ),
          ):
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            child: Row(
              children: [
                Container(
                    height: 42,
                    width: 110,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      "رقم الهوية",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: AppColors.tabColor),
                    )),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration: const BoxDecoration(
                        border: const Border(
                          top: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          bottom: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          left: const BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                          right: BorderSide(
                              color: AppColors.editProfileContainerColor,
                              width: 0.4),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.white),
                    child: Obx(() => TextField(
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.personalIdController,
                      textDirection: mt.TextDirection.ltr,
                      enabled: controller.isEnabled.value,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 10.0, right: 14.0, bottom: 12.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[350]),
                          hintText: 'رقم الهوية',
                          fillColor: Colors.white70),
                    )),
                  ),
                ),
              ],
            ),
          )),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 20.0, bottom: 8.0),
                   // height: 45.0,
                    child: Obx(
                      () => controller
                          .isLoadingLocation.value ? Container(
                        child: const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 25,
                        ),
                      )
                          :controller.countries.isNotEmpty
                          ? DropdownSearch<Country>(
                          mode: Mode.MENU,
                          enabled: controller.isEnabled.value,
                          dropDownButton: Container(
                            margin: const EdgeInsets.only(left: 0.0),
                            child: SvgPicture.asset(
                              'images/dropdown_icon.svg',
                              fit: BoxFit.fill,
                              height: 8.0,
                              width: 8.0,
                            ),
                          ),
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
                          dropdownSearchDecoration: const InputDecoration(
                            // filled: true,
                            //fillColor: Color(0xFFF2F2F2),
                            contentPadding: EdgeInsets.only(
                                right: 20.0, top: 0.0, bottom: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(16)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                          ),
                          items: controller.countries,
                          // label: "Menu mode",
                          itemAsString: (Country? u) =>
                              u?.itemAsStringByName() ?? '',
                          // hint: "الدولة",
                          //popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (country){
                            controller.country.value = country!;
                          },
                          selectedItem: controller.country.value): Container(
    alignment: Alignment.centerRight,
    child: const Text("لا يوجد مناطق")),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 16.0, left: 20.0, right: 10.0, bottom: 8.0),
                   // height: 45.0,
                    child: Obx(
                      () =>  controller
                          .isLoadingLocation.value ? Container(
                        child: const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 25,
                        ),
                      )
                          :controller.areas.isNotEmpty
                          ? DropdownSearch<Area>(
                              mode: Mode.MENU,
                              enabled: controller.isEnabled.value,
                              dropDownButton: Container(
                                margin: const EdgeInsets.only(left: 0.0),
                                child: SvgPicture.asset(
                                  'images/dropdown_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 8.0,
                                  width: 8.0,
                                ),
                              ),
                              dropdownBuilder: (BuildContext context, s) {
                                return Text(
                                  '${(s?.name ?? '')}',
                                  style: TextStyle(
                                      color:
                                          AppColors.tabColor.withOpacity(0.73),
                                      /*decoration: TextDecoration.underline,decorationThickness: 2,*/
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                );
                              },
                              dropdownSearchBaseStyle: TextStyle(
                                  fontFamily: 'Arabic-Regular',
                                  fontSize: 14.sp),
                              // dropdownSearchBaseStyle:  TextStyle(color: AppColors.editProfileContainerColor),
                              dropdownSearchDecoration: const InputDecoration(
                                // filled: true,
                                //fillColor: Color(0xFFF2F2F2),
                                labelStyle: TextStyle(
                                    color: AppColors.editProfileContainerColor),
                                //counterText: 'modeo',
                                contentPadding: const EdgeInsets.only(
                                    right: 20.0, top: 0.0, bottom: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      width: 0.4,
                                      color: AppColors.borderDropDownColor),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      width: 0.4,
                                      color: AppColors.borderDropDownColor),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      width: 0.4,
                                      color: AppColors.borderDropDownColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(16)),
                                    borderSide: const BorderSide(
                                      width: 1,
                                    )),
                              ),
                              items: controller.areas.value,
                              itemAsString: (Area? u) => u != null
                                  ? (u.itemAsStringByName()) ?? ''
                                  : '',
                              // label: "Menu mode",
                              //popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (area){
                                controller.area.value = area!;
                              },

                              selectedItem: controller.area.value,
                            )
                          : Container(
                          alignment: Alignment.centerRight,
                          child: const Text("لا يوجد مناطق")),
                    )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Divider(
              color: AppColors.dividerBottom,
              thickness: 4.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ),
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.editProfileContainerColor, width: 0.4),
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 4.0),
                  child: const Text(
                    "مراسلتى",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColors.tabColor),
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
                          'نعم',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.tabColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Obx(()=>InkWell(
                        onTap: controller.isEnabled.value
                            ? () {
                          if (controller.isChat.value) {
                            controller.isChat.value = false;
                          } else {
                            controller.isChat.value = true;
                          }
                        }
                            : null,
                        child: Container(
                          child: controller.isChat.value
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
                        ),
                      ),),
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
                          right: 8.0,
                          left: 23.0,
                          bottom: 10.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'لا',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.tabColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                )
                /*Container(
                  //margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 3.0, left: 8.0, bottom: 10.0),
                              alignment: Alignment.center,
                              child: Text(
                                'نعم',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.tabColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400 ),
                              ),
                            ),
                            Obx(()=>InkWell(
                              onTap: controller.isEnabled.value?() {
                                if (controller.isChat.value != null &&
                                    controller.isChat.value) {
                                  controller.isChat.value = false;
                                } else {
                                  controller.isChat.value = true;
                                }
                              }:(){

                              },
                              child: Container(
                                // height: 70,
                                  margin: EdgeInsets.only(bottom: 0.0),
                                  child: Obx(() =>
                                  controller.isChat.value != null &&
                                      controller.isChat.value
                                      ?  Container(
                                    //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                                    padding: EdgeInsets.only(left: 10.0,bottom: 10.0,top: 2.0),
                                    child: Image.asset(
                                      'images/switch_icon_right.png',
                                      scale:2,
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Container(
                                    padding: EdgeInsets.only(left: 10.0,bottom: 10.0,top: 2.0),
                                    //margin: EdgeInsets.only(bottom: 10.0),
                                    child: Image.asset(
                                      'images/switch_icon_left.png',
                                      scale:2,
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.fill,
                                    ),
                                  ))

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
                              ),
                            )),
                            Container(
                              margin: EdgeInsets.only(
                                right: 3.0,
                                left: 20.0,
                                bottom: 10.0,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'لا',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.tabColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),*/
              ],
            ),
          ),
          Container(
            height: 42,
            margin: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.editProfileContainerColor, width: 0.4),
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 4.0),
                  child: const Text(
                    "التنبيهات",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColors.tabColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                // height: 70,
                                margin:
                                    const EdgeInsets.only(bottom: 0.0, left: 10.0),
                                child: SvgPicture.asset(
                                  'images/no_notification_icon.svg',
                                  height: 22,
                                  width: 33,
                                )

                                /*Switch(
                          onChanged: (s){

                          },
                          value: true,
                          //activeColor: Colors.white,
                         /// activeTrackColor: AppColors.beginColor,
                         // inactiveThumbColor: Colors.white,
                         // inactiveTrackColor: Colors.grey,
                          activeThumbImage: AssetImage('images/switch_icon.png'),
                          inactiveThumbImage: AssetImage('images/inactive_img.png'),
                        ),*/
                                ),
                            /* Container(
                                // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0, top: 2),
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

                            Obx(()=>InkWell(
                              onTap: controller.isEnabled.value
                                  ? () {
                                if (controller.isNotification.value) {
                                  controller.isNotification.value =
                                  false;
                                } else {
                                  controller.isNotification.value =
                                  true;
                                }
                              }
                                  : null,
                              child: Container(
                                child:  controller.isNotification.isFalse
                                    ? Container(
                                  //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Image.asset(
                                    'images/no_notification_right.png',
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
                                    'images/switch_icon_left.png',
                                    scale: 2,
                                    width: 45,
                                    height: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),),

                            Container(
                                // height: 70,
                                margin: const EdgeInsets.only(
                                  bottom: 0.0,

                                ),
                                child: Image.asset(
                                  'images/bell_icon.png',
                                  height: 22,
                                  width: 22,
                                )

                                /*Switch(
                          onChanged: (s){

                          },
                          value: true,
                          //activeColor: Colors.white,
                         /// activeTrackColor: AppColors.beginColor,
                         // inactiveThumbColor: Colors.white,
                         // inactiveTrackColor: Colors.grey,
                          activeThumbImage: AssetImage('images/switch_icon.png'),
                          inactiveThumbImage: AssetImage('images/inactive_img.png'),
                        ),*/
                                ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(right: 30.0, top: 10.0),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppColors.saveButtonBottomSheet,
                  borderOnForeground: true,
                  child: Container(
                    /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.bottomSheetTabColor),
                    child: const Text(
                      'مسح المحادثات',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.tabColor,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: AppColors.saveButtonBottomSheet,
                  borderOnForeground: true,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => BlockedUsersPage());
                    },
                    child: Container(
                      /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.bottomSheetTabColor),
                      child: const Text(
                        'المحظورون',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.tabColor,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 145,
                  height: 35,
                  margin: const EdgeInsets.only(right: 35.0, top: 35.0),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: const BorderRadius.all(const Radius.circular(8)),
                    color: AppColors.saveButtonBottomSheet,
                    child: InkWell(
                      onTap: (){
                        controller.saveButtonClicked(context);
                      },
                      child: Container(
                        /*margin: EdgeInsets.only(
                                  left: 12.0, bottom: 4.0, right: 20),*/
                        alignment: Alignment.center,
                        child: Text(
                          'save'.tr,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: AppColors.tabColor,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 145,
                  height: 35,
                  margin: const EdgeInsets.only(left: 35.0, top: 35.0),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: AppColors.tabColor,
                    child: Container(
                      /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                      alignment: Alignment.center,
                      child: Text(
                        'cancel'.tr,
                        style: const TextStyle(
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
          )
        ],
      ),
    );
  }
}
