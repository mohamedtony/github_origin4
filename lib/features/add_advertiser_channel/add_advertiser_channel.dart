import 'dart:convert';
import 'dart:io';

import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/controller/add_advertiser_channel_controller.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/selected_countery_area_widget.dart';
import 'package:advertisers/features/add_advertiser_channel/widgets/title.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery
            .of(context)
            .size
            .width, 120.h),
      ),
      body: ListView(
        children: [
          const AddAdvertiserTitle(),
          Row(
            children: [
              Image.asset(
                'images/snapshat_icon.png',
                height: 100.w,
                width: 100.w,
              ),
              Text(
                'السناب شات',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Color(0xff041D67),
                ),
              ),
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
                      style: TextStyle(
                          fontSize: 14.sp, color: Color(0xff041D67)),
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
                      controller: _addAdvertiserChannelController.accountNameController,
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
                      style: TextStyle(
                          fontSize: 14.sp, color: Color(0xff041D67)),
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
                  color: Color(0xff041D67)
              ),
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
                      style: TextStyle(
                          fontSize: 14.sp, color: Color(0xff041D67)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButton<String>(
                      underline: const SizedBox.shrink(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: _addAdvertiserChannelController.selectedRange!='0'
                          ? Center(child: Text(_addAdvertiserChannelController.selectedRange.value))
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
                          _addAdvertiserChannelController.selectedRange.value = newVal!;
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
                  color: Color(0xff041D67)
              ),
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
                          hint: Center(child: Text(_addAdvertiserChannelController.selectedMenPercentage.value)),
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
                              _addAdvertiserChannelController.selectedMenPercentage.value = newVal!;
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
                          hint: Center(child: Text(_addAdvertiserChannelController.selectedWomenPercentage.value)),
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
                              _addAdvertiserChannelController.selectedWomenPercentage.value = newVal!;
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
                          hint: Center(child: Text(_addAdvertiserChannelController.selectedBoysPercentage.value)),
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
                              _addAdvertiserChannelController.selectedBoysPercentage.value = newVal!;
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
                          hint: Center(child: Text(_addAdvertiserChannelController.selectedGirlsPercentage.value)),
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
                              _addAdvertiserChannelController.selectedGirlsPercentage.value = newVal!;
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
                  color: Color(0xff041D67)
              ),
            ),
          ),
          Row(
            children: [

              Expanded(
                child: GetBuilder<AddAdvertiserChannelController>(
                    init: AddAdvertiserChannelController(),
                    builder: (controller) =>
                        Container(
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
                                    "الدولة",
                                    style: TextStyle(fontSize: 10.5.sp,
                                        color: Color(0xff041D67)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 40.h,
                                color: const Color(0xffC3CFE2),
                              ),
                              Expanded(
                                child: DropdownButton<Country>(
                                  underline: const SizedBox.shrink(),
                                  // icon: const Icon(Icons.keyboard_arrow_down),
                                  icon: const SizedBox.shrink(),
                                  hint:
                                  Center(child: Text(
                                      _selectedCountry?.name ?? '')),
                                  items: _addAdvertiserChannelController.countries.map((Country value) {
                                    return DropdownMenuItem<Country>(
                                      value: value,
                                      child: Text(value.name??''),
                                    );
                                  }).toList(),
                                  // value: _selectedLocation,
                                  // isDense: true,
                                  isExpanded: true,
                                  onChanged: (newVal) {
                                    setState(() {
                                      _selectedCountry = newVal!;
                                      // if (_selectedCountry?.id != newVal.id) {
                                      _selectedCity = null;
                                      // }
                                    });
                                    controller.addToList(_selectedCountry);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                ),
              ),

              Expanded(
                child: GetBuilder<AddAdvertiserChannelController>(
                    init: AddAdvertiserChannelController(),
                    builder: (controller) =>
                        Container(
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
                                    "المدينة",
                                    style: TextStyle(fontSize: 10.5.sp,
                                        color: Color(0xff041D67)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 40.h,
                                color: const Color(0xffC3CFE2),
                              ),
                              Expanded(
                                child: DropdownButton<Area>(
                                  underline: const SizedBox.shrink(),
                                  // icon: const Icon(Icons.keyboard_arrow_down),
                                  icon: const SizedBox.shrink(),
                                  hint: Center(
                                      child: Text(_selectedCity?.name ?? '')),
                                  items: _addAdvertiserChannelController
                                      .countries.isNotEmpty?_addAdvertiserChannelController
                                      .countries[_addAdvertiserChannelController.countries.indexWhere(
                                          (element) =>
                                      _selectedCountry?.id ==
                                          element.id) ==
                                      -1
                                      ? 0
                                      : _addAdvertiserChannelController.countries.indexWhere((
                                      element) =>
                                  _selectedCountry?.id == element.id)]
                                      .areas
                                      ?.map((Area value) {
                                    return DropdownMenuItem<Area>(
                                      value: value,
                                      child: Text(value.name??''),
                                    );
                                  }).toList():[],
                                  // value: _selectedLocation,
                                  // isDense: true,
                                  isExpanded: true,
                                  onChanged: (newVal) {
                                    setState(() {
                                      _selectedCity = newVal ;
                                    });
                                    controller.addToList(_selectedCity);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                ),
              ),
            ],
          ),
          GetBuilder<AddAdvertiserChannelController>(
              init: AddAdvertiserChannelController(),
              builder: (controller) =>
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Wrap(
                        children: controller.citiesCountriesController.map<
                            Widget>((e) =>
                            SelectedAreaWidget(
                              title: "${e.name}", onPressed: () {
                              controller.removeFromList(e);
                              print(e.name);
                            },)).toList()
                      // <Widget>[
                      //
                      //   SelectedAreaWidget(title: "العالم العربي",),
                      //   SelectedAreaWidget(title: "الخليج العربي",),
                      //   SelectedAreaWidget(title: "السعودية",),
                      //   SelectedAreaWidget(title: "الرياض",),
                      //   SelectedAreaWidget(title: "جدة",),
                      //   SelectedAreaWidget(title: "الرياض",),
                      //   SelectedAreaWidget(title: "الرياض",),
                      // ],
                    ),
                  )
          ),


          Padding(
            padding: const EdgeInsets.only(
                bottom: 45,
                left: 35,
                right: 35,
                top: 25
            ),
            child: Row(
              children: [
                Expanded(child: InkWell(onTap: () {
                  _addAdvertiserChannelController.addChannel();
                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("حفظ", style: TextStyle(color: Color(
                          0xff4391D4),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffE8E8E8),
                    ),
                  ),)),

                SizedBox(
                  width: 20,
                ),
                Expanded(child: InkWell(onTap: () {

                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("الغاء", style: TextStyle(color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4391D4),

                    ),
                  ),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
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


class CitiesCountries{
  int ? id;
  String ? name;
  CitiesCountries({
    this.id,
    this.name
  });
}


