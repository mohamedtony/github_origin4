// import 'package:advertisers/advertiser_list_page/advertise_list_controller.dart';
// import 'package:advertisers/advertiser_list_page/advertiser_list_item.dart';
// import 'package:advertisers/blocked_users_page/blocked_users_page.dart';
// import 'package:advertisers/client_list_page/client_list_item.dart';
// import 'package:advertisers/client_setting_page/client_switch_controller.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_page.dart';
import 'package:advertisers/features/client_setting_page/client_switch_controller.dart';
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

class AdvertiserSettingsPage extends StatelessWidget {
   AdvertiserSettingsPage({Key? key}) : super(key: key);
   var controller = Get.put(ClientSwitchController(), permanent: false);
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
                            child: Image.asset(
                              'images/qrcode.png',
                              width: 40.0,
                              height: 50.0,
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
                            style: TextStyle(color: Colors.white, fontSize: 16.0,decoration: TextDecoration.underline,decorationThickness: .7),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10.0, top: 35.0),
                    child: SvgPicture.asset(
                      "images/back_button.svg",
                      height: 45,
                      width: 45,
                      // matchTextDirection: true,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 10.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '% 50',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.indicatorColor,
                          fontSize: 18.0,
                        //  decoration: TextDecoration.underline,
                        //  decorationThickness: 2
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 14.0,left: 14.0),
                      child: StepProgressIndicator(
                        totalSteps: 10,
                        currentStep: 6,
                        size: 5.5,
                        selectedColor: AppColors.indicatorColor,
                        unselectedColor: Colors.white,
                        progressDirection: mt.TextDirection.rtl,
                      ),
                    ),
                  )
                ],
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
                          'images/setting_person.svg',
                          height: 32,
                          width: 32,
                          //color:  Color(0xff486ac7),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 10.0,
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
                    ],
                  ),
                ),
                Container(
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
                            'images/switch_icon.png',
                            scale: 2,
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
                )
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
                          hintText: 'الراشد للاوانى الفخارية',
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
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.accountNameEdit,
                      textDirection: mt.TextDirection.ltr,
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
                          hintText: 'محمد',
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
                      "صاحب الحساب",
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
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.accountOwner,
                      textDirection: mt.TextDirection.ltr,
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
                          hintText: 'محمد',
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
                        color: AppColors.editProfileContainerColor),
                    child: Text(
                      "تأكيد",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white),
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
                      controller: controller.phoneController,
                      //textDirection: mt.TextDirection.ltr,
                      style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      decoration: InputDecoration(
                        /* suffixIcon: Directionality(
                            textDirection: mt.TextDirection.ltr,
                            child: Container(
                              // width: 100,
                              child: CountryCodePicker(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  // showFlag: false,
                                  flagWidth: 25,
                                  searchDecoration: const InputDecoration(
                                    // hintTextDirection: mt.TextDirection.rtl,
                                    focusColor: AppColors.tabColor,
                                    focusedBorder: UnderlineInputBorder(),
                                    *//*border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.focusedBorder),)*//*
                                  ),
                                  initialSelection: 'sa',
                                  onChanged: (s) {}),
                            ),
                          ),*/
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
                          hintText: 'محمد',
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
                        color: AppColors.editProfileContainerColor),
                    child: Text(
                      "تحقق",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          color: Colors.white),
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
                      controller: controller.emailController,
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
                          hintText: 'محمد',
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
                      textAlign: TextAlign.end,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.accountNameEdit,
                      textDirection: mt.TextDirection.ltr,
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
                          hintText: 'محمد',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 20.0, bottom: 8.0),
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
                              width: 0.4, color: AppColors.borderDropDownColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              width: 0.4, color: AppColors.borderDropDownColor),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              width: 1,
                            )),
                      ),
                      items: [
                        "السعودية",
                        "Italia (Disabled)",
                        "Tunisia",
                        'Canada'
                      ],
                      // label: "Menu mode",
                      hint: "country in menu mode",
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                      selectedItem: 'السعودية'.tr),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 16.0, left: 20.0, right: 10.0, bottom: 8.0),
                  height: 45.0,
                  child: DropdownSearch<String>(
                    mode: Mode.MENU,

                    favoriteItemBuilder: (context, item, b) {
                      return Text(
                        item,
                        style: TextStyle(color: Colors.red),
                      );
                    },
                    dropDownButton: Container(
                      margin: EdgeInsets.only(left: 0.0),
                      child: SvgPicture.asset(
                        'images/dropdown_icon.svg',
                        fit: BoxFit.fill,
                        height: 8.0,
                        width: 8.0,
                      ),
                    ),
                    dropdownSearchBaseStyle: TextStyle(
                        fontFamily: 'Arabic-Regular', fontSize: 14.sp),
                    // dropdownSearchBaseStyle:  TextStyle(color: AppColors.editProfileContainerColor),
                    dropdownSearchDecoration: InputDecoration(
                      // filled: true,
                      //fillColor: Color(0xFFF2F2F2),
                      labelStyle:
                      TextStyle(color: AppColors.editProfileContainerColor),
                      //counterText: 'modeo',
                      contentPadding:
                      EdgeInsets.only(right: 20.0, top: 0.0, bottom: 0.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            width: 0.4, color: AppColors.borderDropDownColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            width: 0.4, color: AppColors.borderDropDownColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                    ),
                    items: ["الرياض", "Italia (Disabled)", "Tunisia", 'Canada'],
                    // label: "Menu mode",
                    hint: "country in menu mode",
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: 'الرياض'.tr,
                  ),
                ),
              ),
            ],
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
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.editProfileContainerColor,
                    width: 0.4
                ),
                borderRadius: BorderRadius.circular(
                    12.0
                ),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10,bottom: 4.0),
                  child: Text(
                    "مراسلتى",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColors.tabColor),
                  ),
                ),
                Container(
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
                                  right: 3.0, left: 14.0, bottom: 10.0),
                              alignment: Alignment.center,
                              child: Text(
                                'نعم',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.tabColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0),
                                child: Image.asset(
                                  'images/switch_icon.png',
                                  scale: 2,
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
                            Container(
                              margin: EdgeInsets.only(
                                right: 10.0, left: 20.0, bottom: 10.0,),
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
                ),
              ],
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.editProfileContainerColor,
                    width: 0.4
                ),
                borderRadius: BorderRadius.circular(
                    12.0
                ),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10,bottom: 4.0),
                  child: Text(
                    "التنبيهات",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColors.tabColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only( left: 20.0, right: 10.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0,left: 10.0),
                                child: Image.asset(
                                  'images/bell_icon.png',
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
                            Container(
                              // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0,top: 2),
                                child: Image.asset(
                                  'images/switch_icon.png',
                                  scale: 2,
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
                            Container(
                              // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0,),
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
                margin: EdgeInsets.only(right: 30.0, top: 10.0),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.saveButtonBottomSheet,
                  borderOnForeground: true,
                  child: Container(
                    /*margin: EdgeInsets.only(
                              left: 12.0, bottom: 4.0, right: 20),*/
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.bottomSheetTabColor
                    ),
                    child: Text(
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
                margin: EdgeInsets.only(left: 30.0, top: 10.0),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.saveButtonBottomSheet,
                  borderOnForeground: true,
                  child: InkWell(
                    onTap: (){
                      Get.to(() => BlockedUsersPage());
                    },
                    child: Container(
                      /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.bottomSheetTabColor
                      ),
                      child: Text(
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
                      /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
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
                      /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
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
          )
        ],
      ),
    );
  }
}


