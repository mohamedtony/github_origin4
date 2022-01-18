import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:advertisers/features/advertiser_list_page/advertiser_list_item.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_page.dart';
import 'package:advertisers/features/client_list_page/client_list_item.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/client_setting_page/client_setting_page_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientSettingPage extends StatelessWidget {
  ClientSettingPage({Key? key}) : super(key: key);
  ClientSettingPageController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165.0),
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
                            EdgeInsets.only(top: 55, right: 25.0, bottom: 32),
                        //padding: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(
                              4.0,
                            ),
                            child: Image.asset(
                              'images/image1.jpg',
                              width: 50.0,
                              height: 60.0,
                              fit: BoxFit.fitHeight,
                            ),
                            decoration: BoxDecoration(
                              //border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                              borderRadius: BorderRadius.circular(8.0),
                              /*image: DecorationImage(
                                        image: AssetImage("images/image1.jpg"),
                                        fit: BoxFit.cover,
                                      )*/
                            )),
                      ),
                      Positioned(
                        top: 35.0,
                        right: 3.0,
                        child: InkWell(
                            onTap: () {
                              //controller.deleteImage(index);
                            },
                            child: Container(
                              // alignment: Alignment.topLeft,
                              /*decoration: BoxDecoration(
                                  shape: BoxShape.circle
                                  ,color: Colors.white

                              ),*/
                              padding: EdgeInsets.all(0.0),
                              child: Image.asset(
                                'images/camera_icon.png',
                                height: 45,
                                width: 45,
                                //color:  Color(0xff486ac7),
                              ),
                            )),
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
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Image.asset(
                                  'images/flag.png',
                                  fit: BoxFit.fill,
                                  height: 32.0,
                                  width: 32.0,
                                ),
                              )))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0, top: 20.0),
                        child: Obx(()=>Text(
                          controller.clientProfileModel.value.username??'',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Obx(()=>Text(
                          '# '+(controller.clientProfileModel.value.account_name ?? ''),
                          textDirection: mt.TextDirection.ltr,
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        )),
                      ),
                    ],
                  ),
                ],
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
                      InkWell(
                        onTap: (){
                          controller.changeEdit();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 10.0,
                          ),
                          alignment: Alignment.center,
                          child: Obx(()=>Text(
                            controller.isEnabled.value?'إلغاء':'edit'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.editProfileTextColor,
                                fontSize: 18.0,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2),
                          ),)
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
                            'images/switch_icon_left.png',
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
                    child: Obx(()=>TextField(
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
                    )),
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
                InkWell(
                  onTap: () {
                    controller.verifyPhone();
                  },
                  child: Container(
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
                ),
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
                          suffixIcon: Directionality(
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
                                    /*border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.focusedBorder),)*/
                                  ),
                                  initialSelection: 'sa',
                                  onChanged: (countryCodeVal) {
                                    controller.countryCode.value=countryCodeVal.dialCode! ;
                                    print('>>>>>>>>>>>>>>${countryCodeVal.name}  ${countryCodeVal.code}    ${countryCodeVal.dialCode}     ${countryCodeVal.flagUri}');

                                  },

                              ),
                            ),
                          ),
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
                          hintText: 'رقم الجوال',
                          fillColor: Colors.white70,

                      ),
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
                      controller: controller.accountRegisteredNumController,
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
                  child: Obx(() =>DropdownSearch<Country>(
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
                      dropdownBuilder: (BuildContext context,s){
                        return Text('${ (s?.name??'')}',style: TextStyle(color: AppColors.tabColor.withOpacity(0.73),/*decoration: TextDecoration.underline,decorationThickness: 2,*/fontSize: 16.0,fontWeight: FontWeight.w500),textAlign: TextAlign.start,);
                      },
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
                      items: controller.countries.value,
                      // label: "Menu mode",
                      itemAsString: (Country? u) => u?.itemAsStringByName()??'',
                      hint: "الدولة",
                      //popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                      selectedItem: controller.country.value),
                )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 16.0, left: 20.0, right: 10.0, bottom: 8.0),
                  height: 45.0,
                  child: Obx(() =>controller.areas.value!=null &&controller.areas.value.isNotEmpty?DropdownSearch<Area>(
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
                    dropdownBuilder: (BuildContext context,s){
                      return Text('${ (s?.name??'')}',style: TextStyle(color: AppColors.tabColor.withOpacity(0.73),/*decoration: TextDecoration.underline,decorationThickness: 2,*/fontSize: 16.0,fontWeight: FontWeight.w500),textAlign: TextAlign.start,);
                    },
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
                    items: controller.areas.value,
                    itemAsString: (Area? u) => u!=null?(u?.itemAsStringByName())??'':'',
                    // label: "Menu mode",
                    hint: "country in menu mode",
                    //popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    selectedItem: controller.area.value,
                  ):CircularProgressIndicator(),)
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
                            InkWell(
                              child: Container(
                                // height: 70,
                                  margin: EdgeInsets.only(bottom: 0.0),
                                  child: Obx(()=>controller.clientProfileModel.value.chat!=null && controller.clientProfileModel.value.chat! ?Image.asset(
                                    'images/switch_icon_right.png',
                                    scale: 2,
                                  ):Image.asset(
                                    'images/switch_icon_left.png',
                                    scale: 2,
                                  ))

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
                            Container(
                              // height: 70,
                                margin: EdgeInsets.only(bottom: 0.0,top: 2),
                                child: Image.asset(
                                  'images/switch_icon_left.png',
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
