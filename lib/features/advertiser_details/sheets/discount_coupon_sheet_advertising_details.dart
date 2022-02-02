import 'dart:io';

import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/attatchement_page_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountCouponSheetAdvertisingDetails extends StatelessWidget {
  // ScrollController? scrollController;

  final List<String> _discountPercentageType = [
    "%1",
    "%2",
    "%3",
    "%4",
    "%5",
    "%6",
    "%7",
    "%8",
    "%9",
    "%10",
    "%11",
    "%12",
    "%13",
    "%14",
    "%15",
    "%16",
    "%17",
    "%18",
    "%19",
    "%20",
    "%21",
    "%22",
    "%23",
    "%24",
    "%25",
    "%26",
    "%27",
    "%28",
    "%29",
    "%30",
    "%31",
    "%32",
    "%33",
    "%34",
    "%35",
    "%36",
    "%37",
    "%38",
    "%39",
    "%40",
  ];

  final AttatchementPageController controller =
      Get.put(AttatchementPageController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) => Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.all(8.0),
                  color: AppColors.bottomSheetTabColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                        width: 140.0,
                        //padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'discountCoupon'.tr,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.tabColor),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: SvgPicture.asset(
                          'images/discount_copon_img.svg',
                          fit: BoxFit.fill,
                          height: 25.0,
                          width: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.dividerBottom,
                  thickness: 4.0,
                ),
                Container(
                  // height: 120,
                  // width: 120,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        padding: EdgeInsets.all(40),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10,left: 5.0),
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Material(
                                elevation: 6.0,
                                shadowColor: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                //borderOnForeground: true,
                                color: AppColors.saveButtonBottomSheet,
                                child:Container(
                                    width: 150.0,
                                    height: 150.0,
                                    child:
                                    controller.hasSelectedImage == true
                                        ? Image.file(
                                      File(controller.selectedImage.path),
                                      fit: BoxFit.fill,
                                    )
                                        :Image.asset(
                                      "images/instegram.png",
                                      width: 150.0,
                                      height: 150.0,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.addPhotoBottom,width: 0.5),
                                      borderRadius: BorderRadius.circular(8.0),
                                      /*image: DecorationImage(
                                          image: AssetImage("images/image1.jpg"),
                                          fit: BoxFit.cover,
                                        )*/
                                    )),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                          top: 30,
                          left: 30,
                          child: InkWell(
                              onTap: () async {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => CupertinoActionSheet(
                                    actions: [
                                      CupertinoActionSheetAction(
                                        child: Text(
                                            'الكاميرا'),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await controller.getImage(fromGallery: false)
                                              .then((value) {
                                            controller.setStateBehavior();
                                            print("${controller.hasSelectedImage} hasSelectedImage");
                                          });
                                        },
                                      ),
                                      CupertinoActionSheetAction(
                                        child: Text(
                                            'معرض الصور'),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await controller.getImage(fromGallery: true)
                                              .then((value) {
                                            controller.setStateBehavior();
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration:const BoxDecoration(
                                  gradient:   LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff6fd3de),
                                        Color(0xff486ac7),
                                      ]
                                  ),        borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                ),
                                child:const Icon(Icons.camera_alt_outlined,size: 25,color: Colors.white,),
                              )))
                    ],
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderOnForeground: true,
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.addPhotoBottom, width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                              width: 95,
                              margin: EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                              child: Text(
                                "رقم الكوبون",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16.0,color:AppColors.activitiesDropDown.withOpacity(0.73)),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.couponNumberController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
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
                                  hintText: 'رقم الكوبون',
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderOnForeground: true,
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.addPhotoBottom, width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                              width: 95,
                              margin: EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                              child: Text(
                                "اسم الكوبون",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16.0,color: AppColors.activitiesDropDown.withOpacity(0.73)),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.couponNameController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
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
                                  hintText: 'اسم الكوبون',
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderOnForeground: true,
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.addPhotoBottom, width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                              width: 95,
                              margin: EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                              child: Text(
                                "نسبة الخصم",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16.0,color: AppColors.activitiesDropDown.withOpacity(0.73)),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            icon: SvgPicture.asset('images/dropdown_icon.svg'),
                            hint: controller.selectedDiscountPercentage.isNotEmpty
                                ? Center(
                                child: Text(
                                  controller.selectedDiscountPercentage,
                                  style: TextStyle(fontSize: 12.sp),
                                ))
                                : const Center(
                              child: Text(
                                '%1',
                                style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                              ),
                            ),
                            items: _discountPercentageType.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              );
                            }).toList(),
                            // value: _selectedLocation,
                            // isDense: true,
                            isExpanded: true,
                            onChanged: (newVal) {
                              controller.selectDiscountPercentage(newVal);
                            },
                          ),
                        ),
                      ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderOnForeground: true,
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.addPhotoBottom, width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                              width: 95,
                              margin: EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                              child: Text(
                                "عدد الاستخدام",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16.0,color: AppColors.activitiesDropDown.withOpacity(0.73)),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.numberOfUseController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
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
                                  hintText: 'عدد الاستخدام',
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    //borderOnForeground: true,
                    color: AppColors.saveButtonBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.addPhotoBottom, width: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                              width: 95,
                              margin: EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                              child: Text(
                                "رابط المتجر",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16.0,color: AppColors.activitiesDropDown.withOpacity(0.73)),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.storeUrlController,
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
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
                                  hintText: 'رابط المتجر',
                                  fillColor: Colors.white70),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0,right: 10.0),
                            child: SvgPicture.asset(
                              'images/link_line_icon.svg',
                              fit: BoxFit.fill,
                              height: 18.0,
                              width: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0,bottom: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: InkWell(
                    onTap: (){
                      DateTime selectedDate = DateTime.now();

                      Future<void> _selectDate(BuildContext context) async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: ( DateTime.now()).add( Duration(days: 1)),
                            firstDate:( DateTime.now()),
                            lastDate: ( DateTime.now()).add( Duration(days: 600)));
                        // if (picked != null && picked != selectedDate)
                        if (picked != null && picked != selectedDate)
                        {
                          controller.addendAdvertisingDateCoupon(dateFormat.format(picked));
                          // controller.endAdvertisingDate = dateFormat.format(picked);
                        }
                        // selectedDate = picked;

                      }

                      _selectDate(context);


                    },
                    child: Material(
                      elevation: 6.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      //borderOnForeground: true,
                      color: AppColors.saveButtonBottomSheet,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.addPhotoBottom, width: 0.5),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                                width: 95,
                                margin: EdgeInsets.only(
                                    top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                                child: Text(
                                  "تاريخ الانتهاء",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 16.0,color: AppColors.activitiesDropDown.withOpacity(0.73)),
                                )),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              color: Colors.grey.withOpacity(0.2),
                              width: 2,
                            ),
                            Expanded(
                              child: TextField(
                                enabled: false,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                    ),
                                    // isCollapsed: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(70.0),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: controller.endAdvertisingDateCoupon != null ? TextStyle(color: Colors.grey[700]): TextStyle(color: Colors.grey[350]),
                                    hintText: controller.endAdvertisingDateCoupon != null ? "${controller.endAdvertisingDateCoupon}" :  "تاريخ الانتهاء",
                                    fillColor: Colors.white70),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              color: Colors.grey.withOpacity(0.2),
                              width: 2,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0,right: 10.0),
                              child: Image.asset(
                                'images/calender_icon.png',
                                fit: BoxFit.fill,
                                height: 18.0,
                                width: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 135,
                      height: 35,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                      child: InkWell(
                        onTap: (){
                          controller.setStateBehavior();
                          Navigator.pop(context);
                        },
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
                    ),
                    Container(
                      width: 135,
                      height: 35,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
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
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      )
    );

  }
}
