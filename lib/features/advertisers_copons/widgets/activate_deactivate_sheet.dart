import 'dart:io';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
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
class ActivateDeactivateSheet extends StatelessWidget {
  ScrollController? scrollController;

  ActivateDeactivateSheet({Key? key, this.scrollController,this.coponModelResponse}) : super(key: key);
  CoponModelResponse? coponModelResponse;

  AdvertisersCoponsController requestAdvertiseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        controller: this.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12,
                      width: 12,
                    margin: EdgeInsets.only(top: 24,right: 18),
                      decoration: BoxDecoration (
                        shape: BoxShape.circle,
                        color: Colors.deepPurple
                      ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12),
                        child: Text("يمكنك تفعيل اكواد الخصم التى يمكن لعملائك استخدامها \n ملحوظة : مبلغ خصم كود الخصم يتحمله المعلن بنسبة 100%",maxLines: 4,overflow: TextOverflow.ellipsis,)),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 12,
                    width: 12,
                    margin: EdgeInsets.only(top: 24,right: 18),
                    decoration: BoxDecoration (
                        shape: BoxShape.circle,
                        color: Colors.deepPurple
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(12),
                        child: Text("لتفعيل كود او اكثر إضغط مطولا ثم موافق",maxLines: 4,overflow: TextOverflow.ellipsis,)),
                  )
                ],
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
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: 180.0,
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.error,
                                      color:Colors.red,
                                      size: 60,
                                    ),
                                    Center(
                                      child: Text("هل انت متأكد من تفعيل الكوبون !",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 20.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),textAlign: TextAlign.center,

                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            // minWidth: 70,
                                            child: Container(
                                                width: 60,
                                                alignment: Alignment.center,
                                                child: Text('تأكيد')),
                                            onPressed: () {
                                              print('Confirmed');
                                             // Navigator.of(context).pop();
                                              requestAdvertiseController.onActivateClicked(context,coponModelResponse!.id!);
                                            },
                                            /*style:TextButton.styleFrom(
                                                               primary: Colors.white,
                                                               backgroundColor: Colors.red,
                                                             fixedSize: Size.fromWidth(50)
                                                               ),*/
                                          ),
                                          SizedBox(width: 30,),
                                          MaterialButton(
                                            color: Colors.grey[300],
                                            textColor: Colors.white,
                                            // minWidth: 70,
                                            child: Container(
                                                width: 60,
                                                alignment: Alignment.center,
                                                child: Text('إلغاء')),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            /*style:TextButton.styleFrom(
                                                            primary: Colors.white,
                                                            backgroundColor: Colors.grey,
                                                          ),*/
                                          ),
                                        ],),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );

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
                            'موافق',
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
                        //requestAdvertiseController.isDiscountSaveClicked.value = false;
                       // Get.back();
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                height: 180.0,
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.error,
                                      color:Colors.red,
                                      size: 60,
                                    ),
                                    Center(
                                      child: Text("هل انت متأكد من تعطيل الكوبون !",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 20.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),textAlign: TextAlign.center,

                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            // minWidth: 70,
                                            child: Container(
                                                width: 60,
                                                alignment: Alignment.center,
                                                child: Text('تأكيد')),
                                            onPressed: () {
                                              print('Confirmed');

                                              requestAdvertiseController.onDeActivateClicked(context,coponModelResponse!.id!);
                                            },
                                            /*style:TextButton.styleFrom(
                                                               primary: Colors.white,
                                                               backgroundColor: Colors.red,
                                                             fixedSize: Size.fromWidth(50)
                                                               ),*/
                                          ),
                                          SizedBox(width: 30,),
                                          MaterialButton(
                                            color: Colors.grey[300],
                                            textColor: Colors.white,
                                            // minWidth: 70,
                                            child: Container(
                                                width: 60,
                                                alignment: Alignment.center,
                                                child: Text('إلغاء')),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            /*style:TextButton.styleFrom(
                                                            primary: Colors.white,
                                                            backgroundColor: Colors.grey,
                                                          ),*/
                                          ),
                                        ],),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
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
                            'إلغاء',
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
}

