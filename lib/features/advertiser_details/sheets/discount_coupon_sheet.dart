import 'dart:io';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DiscountCouponSheet extends StatelessWidget {

  final AdvertisingDetailsController controller = Get.put(AdvertisingDetailsController());





  // ScrollController? scrollController;
  // DiscountCouponSheet({Key? key,this.scrollController}) : super(key: key);
  // final AttatchementPageController controller = Get.put(AttatchementPageController());
  @override
  Widget build(BuildContext context) {
   return GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) {




        return Container(
          child: ListView(
            // controller: this.scrollController,
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
                          child: Text('discountCoupon'.tr,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
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
                  Stack(
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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 135,
                        height: 35,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
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
                        width: 135,
                        height: 35,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
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
                  )
                ],),
            ],
          ),
        );
      },
    );

  }
}
