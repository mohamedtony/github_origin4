import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/selected_countery_area_widget.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/title.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:quds_popup_menu/quds_popup_menu.dart';

class AddAdvertiserChannel extends StatefulWidget {
  const AddAdvertiserChannel({Key? key}) : super(key: key);

  @override
  State<AddAdvertiserChannel> createState() => _AddAdvertiserChannelState();
}

class _AddAdvertiserChannelState extends State<AddAdvertiserChannel> {
  AddAdvertiserChannelController _addAdvertiserChannelController = Get.find();
  final List<String> _ranges = [
    '100 - 1000',
    '1000 - 10000',
    '10000 - 100000',
    '100000 - 1000000'
  ];

  final List<String> _percentages = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
  ];

  Country? _selectedCountry;
  Area? _selectedCity;
@override
  void dispose() {

  Get.delete<AdvertisingInfluenceChannelsController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
      ),
      body: ListView(
        children: [
          AddAdvertiserTitle(
            title: 'اضافة قناة اعلان وتأثير',
          ),
          SizedBox(
            width: 375.w,
            child: Row(
              children: [
                Obx(()=>QudsPopupButton(
                    // backgroundColor: Colors.red,
                    tooltip: 'اختر قناة',
                    items: getMenuItems(_addAdvertiserChannelController.basicChannels),
              //           :[QudsPopupMenuWidget(
              // builder: (c) =>SizedBox())],
                    child:_addAdvertiserChannelController.choosedChannel.value!=''?Obx(()=>Image.network(_addAdvertiserChannelController.choosedChannel.value,height: 100.w,
                      width: 100.w,)): Container(
                      color: Colors.white,
                        child: Image.asset(
                          'images/channel_choose2.png',
                          height: 100.w,
                          width: 100.w,
                        ),
                      ),)),
                // Image.asset(
                //   'images/snapshat_icon.png',
                //   height: 100.w,
                //   width: 100.w,
                // ),
                Text(
                  'اختر قناة',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff041D67),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffC3CFE2))),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 102.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 11,
                    ),
                    color: const Color(0xffE8E8E8),
                    child: Text(
                      "اسم الحساب",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xff041D67)),
                    ),
                  ),
                ),
                Expanded(
                    child: TextFormField(
                  // enabled: controller.isChecked,
                  // initialValue: "# Elrashed",
                  style: TextStyle(
                      color: const Color(0xff041D67), fontSize: 14.sp),
                  // cursorColor: Colors.black,
                  // keyboardType: inputType,
                  // textDirection: TextDirection.rtl,
                  controller:
                      _addAdvertiserChannelController.accountNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "اسم الحساب",
                  ),
                  // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
                )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xffC3CFE2))),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 102.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 11,
                    ),
                    color: const Color(0xffE8E8E8),
                    child: Text(
                      "رابط الحساب",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xff041D67)),
                    ),
                  ),
                ),
                Expanded(
                    child: TextFormField(
                  // enabled: controller.isChecked,
                  //initialValue: "Snapchat .com / gdshh",
                  style: TextStyle(
                      color: const Color(0xff041D67), fontSize: 14.sp),
                  // cursorColor: Colors.black,
                  // keyboardType: inputType,
                  // textDirection: TextDirection.rtl,
                  controller: _addAdvertiserChannelController.linkController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "رابط الحساب",
                  ),
                  // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
                )),
                Container(
                  width: 2,
                  height: 40.h,
                  color: const Color(0xffC3CFE2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SvgPicture.asset('images/link_line_icon.svg'),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 15.0,
              left: 20,
              right: 20,
            ),
            child: Text(
              'عدد المتاعين - بالتقريب',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff041D67)),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            // padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xffC3CFE2),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 102.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 11,
                    ),
                    color: const Color(0xffE8E8E8),
                    child: Text(
                      "من",
                      style:
                          TextStyle(fontSize: 14.sp, color: Color(0xff041D67)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: _addAdvertiserChannelController.selectedRange != '0'
                          ? Center(
                              child: Text(_addAdvertiserChannelController
                                  .selectedRange.value))
                          : const Center(child: Text('من فضلك اختر النطاق')),
                      items: _ranges.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),alignment: Alignment.center,
                        );
                      }).toList(),
                      // value: _selectedLocation,
                      // isDense: true,
                      isExpanded: true,
                      onChanged: (newVal) {
                        setState(() {
                          _addAdvertiserChannelController.selectedRange.value =
                              newVal!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 15.0,
              left: 20,
              right: 20,
            ),
            child: Text(
              'توزيع النسبة المئوية للمتأثرين بحسب النوع',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff041D67)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xffC3CFE2),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          // alignment: Alignment.center,
                          width: 40.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 11,
                          ),
                          // color: const Color(0xffE8E8E8),
                          child: Text(
                            "الرجال",
                            style: TextStyle(
                                fontSize: 10.5.sp, color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 40.h,
                        color: const Color(0xffC3CFE2),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Center(
                              child: Text(_addAdvertiserChannelController
                                  .selectedMenPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),alignment: Alignment.center,
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _addAdvertiserChannelController
                                  .selectedMenPercentage.value = newVal!;
                             if (int.parse(_addAdvertiserChannelController.selectedMenPercentage.value)+int.parse(_addAdvertiserChannelController.selectedWomenPercentage.value)+
                                  int.parse(_addAdvertiserChannelController.selectedBoysPercentage.value)+int.parse(_addAdvertiserChannelController.selectedGirlsPercentage.value)>100){
                               Get.snackbar(
                                 "خطأ",
                                 "مجموع النسب يجب ان لا يتعدى المائة",
                                 icon: const Icon(Icons.person, color: Colors.red),
                                 backgroundColor: Colors.yellow,
                                 snackPosition: SnackPosition.BOTTOM,);
                             }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('%'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xffC3CFE2),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          // alignment: Alignment.center,
                          width: 40.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 11,
                          ),
                          // color: const Color(0xffE8E8E8),
                          child: Text(
                            "النساء",
                            style: TextStyle(
                                fontSize: 10.5.sp, color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 40.h,
                        color: const Color(0xffC3CFE2),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Center(
                              child: Text(_addAdvertiserChannelController
                                  .selectedWomenPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),alignment: Alignment.center,
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _addAdvertiserChannelController
                                  .selectedWomenPercentage.value = newVal!;
                              if (int.parse(_addAdvertiserChannelController.selectedMenPercentage.value)+int.parse(_addAdvertiserChannelController.selectedWomenPercentage.value)+
                                  int.parse(_addAdvertiserChannelController.selectedBoysPercentage.value)+int.parse(_addAdvertiserChannelController.selectedGirlsPercentage.value)>100){
                                Get.snackbar(
                                  "خطأ",
                                  "مجموع النسب يجب ان لا يتعدى المائة",
                                  icon: const Icon(Icons.person, color: Colors.red),
                                  backgroundColor: Colors.yellow,
                                  snackPosition: SnackPosition.BOTTOM,);
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('%'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xffC3CFE2),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          // alignment: Alignment.center,
                          width: 40.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 11,
                          ),
                          // color: const Color(0xffE8E8E8),
                          child: Text(
                            "الشباب",
                            style: TextStyle(
                                fontSize: 10.5.sp, color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 40.h,
                        color: const Color(0xffC3CFE2),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Center(
                              child: Text(_addAdvertiserChannelController
                                  .selectedBoysPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),alignment: Alignment.center,
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _addAdvertiserChannelController
                                  .selectedBoysPercentage.value = newVal!;
                              if (int.parse(_addAdvertiserChannelController.selectedMenPercentage.value)+int.parse(_addAdvertiserChannelController.selectedWomenPercentage.value)+
                                  int.parse(_addAdvertiserChannelController.selectedBoysPercentage.value)+int.parse(_addAdvertiserChannelController.selectedGirlsPercentage.value)>100){
                                Get.snackbar(
                                  "خطأ",
                                  "مجموع النسب يجب ان لا يتعدى المائة",
                                  icon: const Icon(Icons.person, color: Colors.red),
                                  backgroundColor: Colors.yellow,
                                  snackPosition: SnackPosition.BOTTOM,);
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('%'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xffC3CFE2),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          // alignment: Alignment.center,
                          width: 40.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 11,
                          ),
                          // color: const Color(0xffE8E8E8),
                          child: Text(
                            "الفتايات",
                            style: TextStyle(
                                fontSize: 10.5.sp, color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 40.h,
                        color: const Color(0xffC3CFE2),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: Center(
                              child: Text(_addAdvertiserChannelController
                                  .selectedGirlsPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),alignment: Alignment.center,
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _addAdvertiserChannelController
                                  .selectedGirlsPercentage.value = newVal!;
                              if (int.parse(_addAdvertiserChannelController.selectedMenPercentage.value)+int.parse(_addAdvertiserChannelController.selectedWomenPercentage.value)+
                                  int.parse(_addAdvertiserChannelController.selectedBoysPercentage.value)+int.parse(_addAdvertiserChannelController.selectedGirlsPercentage.value)>100){
                                Get.snackbar(
                                  "خطأ",
                                  "مجموع النسب يجب ان لا يتعدى المائة",
                                  icon: const Icon(Icons.person, color: Colors.red),
                                  backgroundColor: Colors.yellow,
                                  snackPosition: SnackPosition.BOTTOM,);
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('%'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 15.0,
              left: 20,
              right: 20,
            ),
            child: Text(
              'النطاق الجغرافي للمتأثرين',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff041D67)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              //  mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: EdgeInsets.only(top: 10, left: 2.0, right: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: AppColors.activitiesSheetRounded,
                          width: 0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 2.0,
                                bottom: 2.0,
                                left: 2.0,
                                right: 2.0),
                            child: Text(
                              "الدولة",
                              style: TextStyle(
                                  color: AppColors.activitiesDropDown
                                      .withOpacity(0.73),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            )),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.grey.withOpacity(0.2),
                          width: 2,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 0.0,
                                left: 2.0,
                                right: 2.0,
                                bottom: 0.0),
                            height: 45.0,
                            child: Obx(() => _addAdvertiserChannelController
                                .isLoadingLocation.value
                                ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                : DropdownSearch<Country>(
                                enabled: _addAdvertiserChannelController
                                    .isCountryEnabled.value,
                                mode: Mode.MENU,
                                dropDownButton: Container(
                                    margin: EdgeInsets.only(left: 0.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black
                                          .withOpacity(0.32),
                                    )),
                                dropdownBuilder:
                                    (BuildContext context, s) {
                                  return Text(
                                    '${s!.name}',
                                    style: TextStyle(
                                        color: AppColors
                                            .activitiesDropDown
                                            .withOpacity(0.73),
                                        decoration:
                                        TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                                dropdownSearchDecoration:
                                InputDecoration(
                                  // filled: true,
                                  //fillColor: Color(0xFFF2F2F2),
                                  contentPadding: EdgeInsets.only(
                                      right: 0.0,
                                      top: 0.0,
                                      bottom: 0.0),
                                  focusedBorder: OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                items: _addAdvertiserChannelController
                                    .countriesForLocationSheet,
                                // label: "Menu mode",
                                itemAsString: (Country? u) =>
                                u?.itemAsStringByName() ?? '',
                                /*popupItemDisabled: (String s) => s.startsWith('I'),
                                    onChanged:  (String? s) => controller.addItem(s!),*/
                                onChanged: (c) {
                                  _addAdvertiserChannelController
                                      .changeCountry(c);
                                },
                                selectedItem:
                                _addAdvertiserChannelController
                                    .countriesForLocationSheet[0])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 42,
                    margin: EdgeInsets.only(top: 10, left: 6.0, right: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: AppColors.activitiesSheetRounded,
                          width: 0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 2.0,
                                bottom: 2.0,
                                left: 4.0,
                                right: 4.0),
                            child: Text(
                              "المنطقة",
                              style: TextStyle(
                                  color: AppColors.activitiesDropDown
                                      .withOpacity(0.73),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0),
                            )),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          color: Colors.grey.withOpacity(0.2),
                          width: 2,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 0.0,
                                //  left: 4.0,
                                //right: 4.0,
                                bottom: 0.0),
                            height: 45.0,
                            child: Obx(() => _addAdvertiserChannelController
                                .isLoadingLocation.value
                                ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                : _addAdvertiserChannelController
                                .areasForLocationSheet.isNotEmpty
                                ? DropdownSearch<Area>(
                                mode: Mode.MENU,
                                enabled:
                                _addAdvertiserChannelController
                                    .isAreaEnabled.value,
                                dropDownButton: Container(
                                    margin:
                                    EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.keyboard_arrow_down,

                                      color: Colors.black
                                          .withOpacity(0.32),
                                      size: 20,
                                    )),
                                /*dropdownButtonBuilder: (BuildContext context){
                                         return Text('mm');
                                      },*/
                                dropdownBuilder:
                                    (BuildContext context, s) {
                                  return Text(
                                    '${s!.name}',
                                    style: TextStyle(
                                        color: AppColors
                                            .activitiesDropDown
                                            .withOpacity(0.73),
                                        decoration: TextDecoration
                                            .underline,
                                        decorationThickness: 2,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                                dropdownSearchDecoration:
                                InputDecoration(
                                  // filled: true,
                                  //fillColor: Color(0xFFF2F2F2),
                                  contentPadding: EdgeInsets.only(
                                      right: 0.0,
                                      top: 0.0,
                                      bottom: 0.0),
                                  focusedBorder: OutlineInputBorder(
                                    //borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                ),
                                items:
                                _addAdvertiserChannelController
                                    .areasForLocationSheet,
                                // label: "Menu mode",
                                itemAsString: (Area? u) =>
                                u?.itemAsStringByName() ?? '',
                                onChanged: (area) {
                                  _addAdvertiserChannelController
                                      .changeArea(area);
                                },
                                selectedItem:
                                _addAdvertiserChannelController
                                    .areasForLocationSheet
                                    .value[0])
                                : Container(
                                alignment: Alignment.centerRight,
                                child: Text("لا يوجد مناطق"))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
//           Row(
//             children: [
//               Expanded(
//                 child: GetBuilder<AddAdvertiserChannelController>(
//                     init: AddAdvertiserChannelController(),
//                     builder: (controller) => Container(
//                           margin: const EdgeInsets.all(15.0),
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                               color: const Color(0xffC3CFE2),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topRight: Radius.circular(15),
//                                   bottomRight: Radius.circular(15),
//                                 ),
//                                 child: Container(
//                                   // alignment: Alignment.center,
//                                   width: 40.w,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 2,
//                                     vertical: 11,
//                                   ),
//                                   // color: const Color(0xffE8E8E8),
//                                   child: Text(
//                                     "الدولة",
//                                     style: TextStyle(
//                                         fontSize: 10.5.sp,
//                                         color: Color(0xff041D67)),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 2,
//                                 height: 40.h,
//                                 color: const Color(0xffC3CFE2),
//                               ),
//                               Expanded(
//                                 child: DropdownButton<Country>(
//                                   underline: const SizedBox.shrink(),
//                                   // icon: const Icon(Icons.keyboard_arrow_down),
//                                   icon: const SizedBox.shrink(),
//                                   hint: Center(
//                                       child:
//                                           Text(_selectedCountry?.name ?? '',textAlign:TextAlign.center,style: TextStyle(fontSize: 10.5))),
//                                   items: _addAdvertiserChannelController
//                                       .countries
//                                       .map((Country value) {
//                                     return DropdownMenuItem<Country>(
//                                       value: value,
//                                       child: Container(
//                                           width: 200,
//                                           child: Text(value.name ?? '',style:TextStyle(fontSize: 12))),
//                                     );
//                                   }).toList(),
//                                   // value: _selectedLocation,
//                                   // isDense: true,
//                                   isExpanded: true,
//                                   onChanged: (newVal) {
//                                     setState(() {
//                                       _selectedCountry = newVal!;
//                                       // if (_selectedCountry?.id != newVal.id) {
//                                       _selectedCity = null;
//                                       // }
//                                     });
//                                     controller.addToList(_selectedCountry);
//                                     _addAdvertiserChannelController.countriesIds.add(_selectedCountry?.id??0);
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )),
//               ),
//               Expanded(
//                 child: GetBuilder<AddAdvertiserChannelController>(
//                     init: AddAdvertiserChannelController(),
//                     builder: (controller) => Container(
//                           margin: const EdgeInsets.all(15.0),
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                               color: const Color(0xffC3CFE2),
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topRight: Radius.circular(15),
//                                   bottomRight: Radius.circular(15),
//                                 ),
//                                 child: Container(
//                                   // alignment: Alignment.center,
//                                   width: 40.w,
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 2,
//                                     vertical: 11,
//                                   ),
//                                   // color: const Color(0xffE8E8E8),
//                                   child: Text(
//                                     "المدينة",
//                                     style: TextStyle(
//                                         fontSize: 10.5.sp,
//                                         color: Color(0xff041D67)),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 2,
//                                 height: 40.h,
//                                 color: const Color(0xffC3CFE2),
//                               ),
//                               Expanded(
//                                 child: DropdownButton<Area>(
//                                   underline: const SizedBox.shrink(),isExpanded:true,
//                                   // icon: const Icon(Icons.keyboard_arrow_down),
//                                   icon: const SizedBox.shrink(),
//                                   hint: SizedBox(
//     width: 200,
// height: 100,
//     child: Center(
//                                         child: Text(_selectedCity?.name ?? '',textAlign:TextAlign.center,style: TextStyle(fontSize: 10.5))),
//                                   ),
//                                   items: _addAdvertiserChannelController
//                                           .countries.isNotEmpty
//                                       ? _addAdvertiserChannelController
//                                           .countries[_addAdvertiserChannelController
//                                                       .countries
//                                                       .indexWhere((element) =>
//                                                           _selectedCountry
//                                                               ?.id ==
//                                                           element.id) ==
//                                                   -1
//                                               ? 0
//                                               : _addAdvertiserChannelController
//                                                   .countries
//                                                   .indexWhere((element) =>
//                                                       _selectedCountry?.id ==
//                                                       element.id)]
//                                           .areas
//                                           ?.map((Area value) {
//                                           return DropdownMenuItem<Area>(
//                                             value:
//                                                 value, //enabled: _addAdvertiserChannelController.countries.length>1?false:true,
//                                             child: SizedBox(
//                                                 height:150,
//                                                 child: Text(value.name??'',style:TextStyle(fontSize: 11))),
//                                           );
//                                         }).toList()
//                                       : [],
//                                   // value: _selectedLocation,
//                                    isDense: true,
//                                  // isExpanded: true,
//                                   onChanged: (newVal) {
//                                     setState(() {
//                                       _selectedCity = newVal;
//                                     });
//                                     controller.addToList(_selectedCity);
//                                     _addAdvertiserChannelController.areasIds.add(_selectedCity?.id??0);
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )),
//               ),
//             ],
//           ),

        ///the wrap widget old
//           GetBuilder<AddAdvertiserChannelController>(
//               init: AddAdvertiserChannelController(),
//               builder: (controller) => Container(
//                     padding: EdgeInsets.all(15),
//                     child: Wrap(
//                         children: controller.citiesCountriesController
//                             .map<Widget>((e) => SelectedAreaWidget(
//                                   title: "${e.name}",
//                                   onPressed: () {
//                                     controller.removeFromList(e);
//
//                                     print(e.name);
//                                   },
//                                 ))
//                             .toList()
//                         // <Widget>[
//                         //
//                         //   SelectedAreaWidget(title: "العالم العربي",),
//                         //   SelectedAreaWidget(title: "الخليج العربي",),
//                         //   SelectedAreaWidget(title: "السعودية",),
//                         //   SelectedAreaWidget(title: "الرياض",),
//                         //   SelectedAreaWidget(title: "جدة",),
//                         //   SelectedAreaWidget(title: "الرياض",),
//                         //   SelectedAreaWidget(title: "الرياض",),
//                         // ],
//                         ),
//                   )),
          Obx(
                () => Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 18),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _addAdvertiserChannelController
                    .selectedUserLocations.isNotEmpty
                    ? Wrap(
                  direction: Axis.horizontal,
                  children: _addAdvertiserChannelController
                      .selectedUserLocations.value
                      .map((value) => Stack(
                    children: [
                      Container(
                        height: 35,
                        margin: EdgeInsets.only(
                            left: 18.0, top: 8, bottom: 3),
                        child: Chip(
                          elevation: 3.0,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: AppColors
                                      .activitiesSheetRounded,
                                  width: 0.5)),
                          labelPadding: EdgeInsets.only(
                              bottom: 4, left: 6, right: 6),
                          label: Container(
                            //margin: EdgeInsets.only(bottom: 4),
                            child: Text(
                              value.name ?? '',
                              style: TextStyle(
                                color: AppColors
                                    .activitiesDropDown,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          backgroundColor:
                          AppColors.bottomSheetTabColor,
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 3,
                        child: InkWell(
                          onTap: () {
                            _addAdvertiserChannelController
                                .removeCountryOrArea(
                                value);
                          },
                          child: Container(
                            // alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors
                                      .bottomSheetTabColorRounded),
                              child: Icon(
                                Icons.clear,
                                color: AppColors.white,
                                size: 18,
                              )),
                        ),
                      )
                    ],
                  ))
                      .toList(),
                )
                    : _addAdvertiserChannelController.isLoadingLocation.value
                    ? Container(
                    alignment: Alignment.topCenter,
                    child: const CircularProgressIndicator(
                      color: AppColors.tabColor,
                    ))
                    : Container(
                    alignment: Alignment.center,
                    child: const Text('لا يوجد عناصر')),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 45, left: 35, right: 35, top: 25),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _addAdvertiserChannelController.addChannel();
                    Get.delete<AdvertisingInfluenceChannelsController>();
                  },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        "حفظ",
                        style: TextStyle(
                            color: Color(0xff4391D4),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffE8E8E8),
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.delete<AdvertisingInfluenceChannelsController>();
                  },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text(
                        "الغاء",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4391D4),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<QudsPopupMenuBase> getMenuItems(RxList<Channel> channels) {
    late List<Widget> channelsWidgets=[];
    for(Channel chan in channels){
      channelsWidgets.add(SizedBox(
        width: 70.w,
        height: 50.w,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  _addAdvertiserChannelController.choosedChannel.value=chan.image??'';
                  _addAdvertiserChannelController.channelId.value=chan.id??0;
                  Get.back();
                },
                icon: Image.network(chan.image??' ')),
            VerticalDivider(),
          ],
        ),
      ));}
     return [QudsPopupMenuWidget(
                builder: (c) => Container(
                  alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: IntrinsicHeight(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5,
                        direction: Axis.horizontal,
                        children: channelsWidgets)
                    )
                )
     )];
    }
    // return [
    //   QudsPopupMenuWidget(
    //       builder: (c) => Container(
    //           padding: EdgeInsets.all(10),
    //           child: IntrinsicHeight(
    //             child: Wrap(
    //
    //               children: [
    //                 IconButton(
    //                     onPressed: () {
    //
    //                     },
    //                     icon: Icon(
    //                       Icons.favorite,
    //                       color: Colors.red,
    //                     )),
    //                 VerticalDivider(),
    //                 IconButton(
    //                     onPressed: () {},
    //                     icon: Icon(
    //                       Icons.music_note,
    //                       color: Colors.blue,
    //                     )),
    //                 VerticalDivider(),
    //                 IconButton(
    //                     onPressed: () {},
    //                     icon: Icon(
    //                       Icons.umbrella,
    //                       color: Colors.green,
    //                     ))
    //               ],
    //             ),
    //           )))
    // ];
 // }
}

// class Country {
//   final int id;
//   final String name;
//   final List<City> cities;
//
//   Country(this.id, this.name, this.cities);
//
//   static final List<Country> countries = [
//     Country(
//       11,
//       'مصر',
//       [
//         City(1, 'المنصورة'),
//         City(2, 'القاهرة'),
//         City(3, 'اﻷسكندرية'),
//       ],
//     ),
//     Country(
//       12,
//       'السعودية',
//       [
//         City(4, 'مكة'),
//         City(5, 'الرياض'),
//         City(6, 'المدينة'),
//       ],
//     ),
//   ];
// }

// class City {
//   final int id;
//   final String name;
//
//   City(this.id, this.name);
// }

class CitiesCountries {
  int? id;
  String? name;
  CitiesCountries({this.id, this.name});
}
