import 'dart:io';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class DiscountCouponSheet extends StatefulWidget {
  ScrollController? scrollController;

  DiscountCouponSheet({Key? key, this.scrollController, this.coponId,this.from}) : super(key: key);
  int? coponId;
  String? from;

  @override
  State<DiscountCouponSheet> createState() => _DiscountCouponSheetState();
}

class _DiscountCouponSheetState extends State<DiscountCouponSheet> {
  AdvertisersCoponsController requestAdvertiseController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*if(requestAdvertiseController.isDiscountSaveClicked.isFalse){
      //----------------------------------------- for discount sheet ------------------------------------
      requestAdvertiseController.coponNumberController=  TextEditingController();
      requestAdvertiseController.coponNameController=  TextEditingController();
      requestAdvertiseController.coponDiscountController=  TextEditingController();
      requestAdvertiseController.coponUsesController=  TextEditingController();
      requestAdvertiseController.coponLinkController=  TextEditingController();
    }*/
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: this.widget.scrollController,
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
                      margin: EdgeInsets.only(top: 0, left: 5.0),
                      width: 120.0,
                      height: 110.0,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderOnForeground: true,
                        color: AppColors.white,
                        child: Container(
                            width: 170.0,
                            height: 170.0,
                            child:  Obx(()=>requestAdvertiseController.imagePathCopon.value.isNotEmpty && !requestAdvertiseController.imagePathCopon.value.startsWith('http')
                                ? Image.file(
                              File(requestAdvertiseController.imagePathCopon.value),
                              width: 170.0,
                              height: 170.0,
                              fit: BoxFit.fitHeight,
                            ):CachedNetworkImage(
                              imageUrl: requestAdvertiseController
                                  .imagePathCopon.value ??
                                  '',
                              placeholder: (context, url) =>
                              const SpinKitThreeBounce(
                                color: Colors.grey,
                                size: 25,
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                              width: 170.0,
                              height: 170.0,
                              fit: BoxFit.fitHeight,
                            )),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.dividerBottom, width: 0.5),
                              borderRadius: BorderRadius.circular(8.0),
                              /*image: DecorationImage(
                                      image: AssetImage("images/image1.jpg"),
                                      fit: BoxFit.cover,
                                    )*/
                            )),
                      ),
                    ),
                    Positioned(
                      left: -2,
                      top:1,
                      child: InkWell(
                        onTap: (){
                          requestAdvertiseController.showChoiceImageDialog(context);
                        },
                        child:Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: PhysicalModel(
                            //borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.circle,
                            color: Colors.blue,
                            elevation: 6,
                            shadowColor: Colors.grey,
                            child:  Container(
                              width: 30,
                              height: 30,
                              // margin: EdgeInsets.all(4),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.camera_alt_outlined
                                    ,
                                    color: Colors.white70,
                                    size: 20.0,
                                  )/*SvgPicture.asset(
                                    'images/filter_edit.svg',
                                    fit: BoxFit.fill,
                                    //color: Colors.white,
                                    height: 24.0,
                                    width: 30.0,
                                  )*/,
                                ),)
                              ,decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppColors.beginColor, AppColors.endColor],
                              ),
                            ),),
                          ),
                        ),
                      ),
                    ),
                    /*Align(
                      alignment: Alignment.topLeft,
                      child: *//*Container(
                          // alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.bottomSheetTabColorRounded,
                          ))*//*Container(
                       // margin: EdgeInsets.only(left: 10.0,right: 10.0),
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'images/camera_icon.png',
                          fit: BoxFit.fill,
                          height: 40.0,
                          width: 40.0,
                        ),
                      ),
                    )*/
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
                child: InkWell(
                  onTap: (){
                    requestAdvertiseController.onDiscountCoponSaveClicked(context);
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
                              textAlign: TextAlign.start,
                              focusNode: requestAdvertiseController.coponNumberNode,
                              textAlignVertical: TextAlignVertical.center,
                              //keyboardType:TextInputType.number,
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
                              controller: requestAdvertiseController.coponNumberController,
                            ),
                          ),
                        ],
                      ),
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
                            focusNode: requestAdvertiseController.coponNameNode,
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
                            controller: requestAdvertiseController.coponNameController,
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
                          child: TextField(
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType:TextInputType.number,
                            focusNode: requestAdvertiseController.coponDiscountNode,
                            decoration: InputDecoration(
                                suffixIcon: Container(
                                  margin: EdgeInsets.only(top:5.0),
                                  child: Text(
                                    '%',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
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
                                hintText: 'نسبة الخصم',
                                fillColor: Colors.white70),
                            controller: requestAdvertiseController.coponDiscountController,
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
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            focusNode: requestAdvertiseController.coponUsesNode,
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
                            controller: requestAdvertiseController.coponUsesController,
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
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.url,
                            maxLines: 1,
                            focusNode: requestAdvertiseController.coponStroreUrlNode,
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
                            controller: requestAdvertiseController.coponStoreUrlController,
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
                              "اسم المتجر",
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
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.url,
                            maxLines: 1,
                            focusNode: requestAdvertiseController.coponStoreNameNode,
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
                                hintText: 'اسم المتجر',
                                fillColor: Colors.white70),
                            controller: requestAdvertiseController.coponStoreNameController,
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
                    requestAdvertiseController.onSelectCoponDate(context);
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
                            child: Obx(()=>TextField(
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
                                  hintStyle: requestAdvertiseController.endAdvertisingDateCoupon.value.isNotEmpty ? TextStyle(color: AppColors.adVertiserPageDataColor.withOpacity(0.51),decoration: TextDecoration.underline,decorationThickness: 4): TextStyle(color: Colors.grey[350],),
                                  hintText: requestAdvertiseController.endAdvertisingDateCoupon.value.isNotEmpty ? "${requestAdvertiseController.endAdvertisingDateCoupon.value}" :  "تاريخ الانتهاء",
                                  fillColor: Colors.white70),
                              //controller: requestAdvertiseController.dat,
                            )),
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
                        if(widget.from=="edit") {
                          requestAdvertiseController.onEditRequestClicked(
                              context, widget.coponId!);
                        }else{
                            requestAdvertiseController.onAddRequestClicked(context);
                        }
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
                        requestAdvertiseController.isDiscountSaveClicked.value = false;
                        Get.back();
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
                            'إستعادة',
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
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    /*if(requestAdvertiseController.isDiscountSaveClicked.isFalse){
      //----------------------------------------- for discount sheet ------------------------------------
      requestAdvertiseController.coponNumberController?.dispose();
      requestAdvertiseController.coponNameController?.dispose();
      requestAdvertiseController.coponDiscountController?.dispose();
      requestAdvertiseController.coponUsesController?.dispose();
      requestAdvertiseController.coponLinkController?.dispose();
      requestAdvertiseController.imagePathCopon.value = "";
      requestAdvertiseController.endAdvertisingDateCoupon.value = "";
    }*/
    super.dispose();
  }
}

