import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/selected_countery_area_widget.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/title.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/controller/edit_channel_advertiser_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:quds_popup_menu/quds_popup_menu.dart';

class EditAdvertiserChannel extends StatefulWidget {
  const EditAdvertiserChannel({Key? key}) : super(key: key);

  @override
  State<EditAdvertiserChannel> createState() => _EditAdvertiserChannelState();
}

class _EditAdvertiserChannelState extends State<EditAdvertiserChannel> {
  EditChannelAdvertiserController _editChannelAdvertiserController = Get.find();
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
 late ChannelData channel;
@override
  void initState() {
  channel=channel=ChannelData.fromJson(jsonDecode(Get.parameters['channel']??''));
  _editChannelAdvertiserController.linkController.text=channel.link??'';
  _editChannelAdvertiserController.selectedRange.value=channel.followers_from.toString()+' - '+channel.followers_to.toString();
  _editChannelAdvertiserController.selectedWomenPercentage.value=channel.women.toString();
  _editChannelAdvertiserController.selectedMenPercentage.value=channel.men.toString();
  _editChannelAdvertiserController.selectedBoysPercentage.value=channel.boys.toString();
  _editChannelAdvertiserController.accountNameController.text=channel.name??'';
  _editChannelAdvertiserController.selectedGirlsPercentage.value=channel.girls.toString();
  _editChannelAdvertiserController.choosedChannel.value=channel.channel?.image??'';
  for(Area are in channel.areas??[] ){
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${are.name}");
    _editChannelAdvertiserController.areasIds.add(are.id);
    _editChannelAdvertiserController.addToList(are);
  }
  for(Country count in channel.countries??[] ){
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${count.name}");
    _editChannelAdvertiserController.countriesIds.add(count.id);
    _editChannelAdvertiserController.addToList(count);
  }


  // controller.addToList(_selectedCity);
  // _editChannelAdvertiserController.areas.value=channel.areas??[];
    super.initState();
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
          Row(
            children: [
              Obx(()=>QudsPopupButton(
                // backgroundColor: Colors.red,
                tooltip: 'اختر قناة',
                items: getMenuItems(_editChannelAdvertiserController.basicChannels),
                child:_editChannelAdvertiserController.choosedChannel.value!=''?Obx(()=>Image.network(_editChannelAdvertiserController.choosedChannel.value,height: 100.w,
                  width: 100.w,errorBuilder: (context,object,err){
                    return Image.asset('images/no_image_available.png',height: 70);
                  },)): Image.asset(
                  'images/snapshat_icon.png',
                  height: 100.w,
                  width: 100.w,
                ),)),
              // Image.asset(
              //   'images/snapshat_icon.png',
              //   height: 100.w,
              //   width: 100.w,
              // ),
              // Text(
              //   'السناب شات',
              //   style: TextStyle(
              //     fontSize: 18.sp,
              //     color: Color(0xff041D67),
              //   ),
              // ),
            ],
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
                      _editChannelAdvertiserController.accountNameController,
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
                      controller: _editChannelAdvertiserController.linkController,
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
                      hint: _editChannelAdvertiserController.selectedRange != '0'
                          ? Center(
                          child: Text(_editChannelAdvertiserController
                              .selectedRange.value))
                          : const Center(child: Text('من فضلك اختر النطاق')),
                      items: _ranges.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      // value: _selectedLocation,
                      // isDense: true,
                      isExpanded: true,
                      onChanged: (newVal) {
                        setState(() {
                          _editChannelAdvertiserController.selectedRange.value =
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
                              child: Text(_editChannelAdvertiserController
                                  .selectedMenPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _editChannelAdvertiserController
                                  .selectedMenPercentage.value = newVal!;
                              if (int.parse(_editChannelAdvertiserController.selectedMenPercentage.value)+int.parse(_editChannelAdvertiserController.selectedWomenPercentage.value)+
                                  int.parse(_editChannelAdvertiserController.selectedBoysPercentage.value)+int.parse(_editChannelAdvertiserController.selectedGirlsPercentage.value)>100){
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
                              child: Text(_editChannelAdvertiserController
                                  .selectedWomenPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _editChannelAdvertiserController
                                  .selectedWomenPercentage.value = newVal!;
                              if (int.parse(_editChannelAdvertiserController.selectedMenPercentage.value)+int.parse(_editChannelAdvertiserController.selectedWomenPercentage.value)+
                                  int.parse(_editChannelAdvertiserController.selectedBoysPercentage.value)+int.parse(_editChannelAdvertiserController.selectedGirlsPercentage.value)>100){
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
                              child: Text(_editChannelAdvertiserController
                                  .selectedBoysPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _editChannelAdvertiserController
                                  .selectedBoysPercentage.value = newVal!;
                              if (int.parse(_editChannelAdvertiserController.selectedMenPercentage.value)+int.parse(_editChannelAdvertiserController.selectedWomenPercentage.value)+
                                  int.parse(_editChannelAdvertiserController.selectedBoysPercentage.value)+int.parse(_editChannelAdvertiserController.selectedGirlsPercentage.value)>100){
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
                              child: Text(_editChannelAdvertiserController
                                  .selectedGirlsPercentage.value)),
                          items: _percentages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _editChannelAdvertiserController
                                  .selectedGirlsPercentage.value = newVal!;
                              if (int.parse(_editChannelAdvertiserController.selectedMenPercentage.value)+int.parse(_editChannelAdvertiserController.selectedWomenPercentage.value)+
                                  int.parse(_editChannelAdvertiserController.selectedBoysPercentage.value)+int.parse(_editChannelAdvertiserController.selectedGirlsPercentage.value)>100){
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
          // Row(
          //   children: [
          //     Expanded(
          //       child: GetBuilder<EditChannelAdvertiserController>(
          //           init: EditChannelAdvertiserController(),
          //           builder: (controller) => Container(
          //             margin: const EdgeInsets.all(15.0),
          //             padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15),
          //               border: Border.all(
          //                 color: const Color(0xffC3CFE2),
          //               ),
          //             ),
          //             child: Row(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: const BorderRadius.only(
          //                     topRight: Radius.circular(15),
          //                     bottomRight: Radius.circular(15),
          //                   ),
          //                   child: Container(
          //                     // alignment: Alignment.center,
          //                     width: 40.w,
          //                     padding: const EdgeInsets.symmetric(
          //                       horizontal: 2,
          //                       vertical: 11,
          //                     ),
          //                     // color: const Color(0xffE8E8E8),
          //                     child: Text(
          //                       "الدولة",
          //                       style: TextStyle(
          //                           fontSize: 10.5.sp,
          //                           color: Color(0xff041D67)),
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   width: 2,
          //                   height: 40.h,
          //                   color: const Color(0xffC3CFE2),
          //                 ),
          //                 Expanded(
          //                   child: DropdownButton<Country>(
          //                     underline: const SizedBox.shrink(),
          //                     // icon: const Icon(Icons.keyboard_arrow_down),
          //                     icon: const SizedBox.shrink(),
          //                     hint: Center(
          //                         child:
          //                         Text(_selectedCountry?.name ?? '',textAlign:TextAlign.center,style: TextStyle(fontSize: 10.5))),
          //                     items: _editChannelAdvertiserController
          //                         .countries
          //                         .map((Country value) {
          //                       return DropdownMenuItem<Country>(
          //                         value: value,
          //                         child: Text(value.name ?? '',style:TextStyle(fontSize: 11)),
          //                       );
          //                     }).toList(),
          //                     // value: _selectedLocation,
          //                     // isDense: true,
          //                     isExpanded: true,
          //                     onChanged: (newVal) {
          //                       setState(() {
          //                         _selectedCountry = newVal!;
          //                         // if (_selectedCountry?.id != newVal.id) {
          //                         _selectedCity = null;
          //                         // }
          //                       });
          //                       controller.addToList(_selectedCountry);
          //                       _editChannelAdvertiserController.countriesIds.add(_selectedCountry?.id??0);
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           )),
          //     ),
          //     Expanded(
          //       child: GetBuilder<EditChannelAdvertiserController>(
          //           init: EditChannelAdvertiserController(),
          //           builder: (controller) => Container(
          //             margin: const EdgeInsets.all(15.0),
          //             padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15),
          //               border: Border.all(
          //                 color: const Color(0xffC3CFE2),
          //               ),
          //             ),
          //             child: Row(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: const BorderRadius.only(
          //                     topRight: Radius.circular(15),
          //                     bottomRight: Radius.circular(15),
          //                   ),
          //                   child: Container(
          //                     // alignment: Alignment.center,
          //                     width: 40.w,
          //                     padding: const EdgeInsets.symmetric(
          //                       horizontal: 2,
          //                       vertical: 11,
          //                     ),
          //                     // color: const Color(0xffE8E8E8),
          //                     child: Text(
          //                       "المدينة",
          //                       style: TextStyle(
          //                           fontSize: 10.5.sp,
          //                           color: Color(0xff041D67)),
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   width: 2,
          //                   height: 40.h,
          //                   color: const Color(0xffC3CFE2),
          //                 ),
          //                 Expanded(
          //                   child: DropdownButton<Area>(
          //                     underline: const SizedBox.shrink(),
          //                     // icon: const Icon(Icons.keyboard_arrow_down),
          //                     icon: const SizedBox.shrink(),
          //                     hint: Center(
          //                         child: Text(_selectedCity?.name ?? '',textAlign:TextAlign.center,style: TextStyle(fontSize: 10.5))),
          //                     items: _editChannelAdvertiserController
          //                         .countries.isNotEmpty
          //                         ? _editChannelAdvertiserController
          //                         .countries[_editChannelAdvertiserController
          //                         .countries
          //                         .indexWhere((element) =>
          //                     _selectedCountry
          //                         ?.id ==
          //                         element.id) ==
          //                         -1
          //                         ? 0
          //                         : _editChannelAdvertiserController
          //                         .countries
          //                         .indexWhere((element) =>
          //                     _selectedCountry?.id ==
          //                         element.id)]
          //                         .areas
          //                         ?.map((Area value) {
          //                       return DropdownMenuItem<Area>(
          //                         value:
          //                         value,
          //                         child: Text(value.name ?? '',style: TextStyle(fontSize: 10.5),),
          //                       );
          //                     }).toList()
          //                         : [],
          //                     // value: _selectedLocation,
          //                     // isDense: true,
          //                     isExpanded: true,
          //                     onChanged: (newVal) {
          //                       setState(() {
          //                         _selectedCity = newVal;
          //                       });
          //                       controller.addToList(_selectedCity);
          //                       _editChannelAdvertiserController.areasIds.add(_selectedCity?.id??0);
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           )),
          //     ),
          //   ],
          // ),
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
                            child: Obx(() => _editChannelAdvertiserController
                                .isLoadingLocation.value
                                ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                : DropdownSearch<Country>(
                                enabled: _editChannelAdvertiserController
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
                                items: _editChannelAdvertiserController
                                    .countriesForLocationSheet,
                                // label: "Menu mode",
                                itemAsString: (Country? u) =>
                                u?.itemAsStringByName() ?? '',
                                /*popupItemDisabled: (String s) => s.startsWith('I'),
                                    onChanged:  (String? s) => controller.addItem(s!),*/
                                onChanged: (c) {
                                  _editChannelAdvertiserController
                                      .changeCountry(c);
                                },
                                selectedItem:
                                _editChannelAdvertiserController
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
                            child: Obx(() => _editChannelAdvertiserController
                                .isLoadingLocation.value
                                ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                : _editChannelAdvertiserController
                                .areasForLocationSheet.isNotEmpty
                                ? DropdownSearch<Area>(
                                mode: Mode.MENU,
                                enabled:
                                _editChannelAdvertiserController
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
                                _editChannelAdvertiserController
                                    .areasForLocationSheet,
                                // label: "Menu mode",
                                itemAsString: (Area? u) =>
                                u?.itemAsStringByName() ?? '',
                                onChanged: (area) {
                                  _editChannelAdvertiserController
                                      .changeArea(area);
                                },
                                selectedItem:
                                _editChannelAdvertiserController
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
          Obx(
                () => Container(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 18),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _editChannelAdvertiserController
                    .selectedUserLocations.isNotEmpty
                    ? Wrap(
                  direction: Axis.horizontal,
                  children: _editChannelAdvertiserController
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
                            _editChannelAdvertiserController
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
                    : _editChannelAdvertiserController.isLoadingLocation.value
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
          ///old wrap
          // GetBuilder<EditChannelAdvertiserController>(
          //     init: EditChannelAdvertiserController(),
          //     builder: (controller) => Container(
          //       padding: EdgeInsets.all(15),
          //       child: Wrap(
          //           children: controller.citiesCountriesController
          //               .map<Widget>((e) => SelectedAreaWidget(
          //             title: "${e.name}",
          //             onPressed: () {
          //               controller.removeFromList(e);
          //
          //               print(e.name);
          //             },
          //           ))
          //               .toList()
          //         // <Widget>[
          //         //
          //         //   SelectedAreaWidget(title: "العالم العربي",),
          //         //   SelectedAreaWidget(title: "الخليج العربي",),
          //         //   SelectedAreaWidget(title: "السعودية",),
          //         //   SelectedAreaWidget(title: "الرياض",),
          //         //   SelectedAreaWidget(title: "جدة",),
          //         //   SelectedAreaWidget(title: "الرياض",),
          //         //   SelectedAreaWidget(title: "الرياض",),
          //         // ],
          //       ),
          //     )),

          Padding(
            padding:
            const EdgeInsets.only(bottom: 45, left: 35, right: 35, top: 25),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: () {
                        _editChannelAdvertiserController.editChannel(id:channel.channel_id??0,type: channel?.type??'');
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
  late List<Widget> channelsWidgets=[];
  List<QudsPopupMenuBase> getMenuItems(RxList<Channel> channels) {
    for(Channel chan in channels){
      channelsWidgets.add(SizedBox(
        width: 50.w,
        height: 50.w,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  _editChannelAdvertiserController.choosedChannel.value=chan.image??'';
                  _editChannelAdvertiserController.channelId.value=chan.id??0;
                },
                icon: Image.network(chan.image??' ',errorBuilder: (context,object,err){
                  return Image.asset('images/no_image_available.png',height: 70);
                },)),
            VerticalDivider(),
          ],
        ),
      ));}
    return [QudsPopupMenuWidget(
        builder: (c) => Container(
            padding: EdgeInsets.all(10),
            child: IntrinsicHeight(
                child: Wrap(

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
