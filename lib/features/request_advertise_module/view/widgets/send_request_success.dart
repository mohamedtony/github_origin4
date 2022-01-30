import 'dart:async';

import 'package:advertisers/features/request_advertise_module/controller/address_bottom_sheet_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/users_module/app_colors.dart' as aliColors;
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_generic_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class SendRequestSuccess extends StatelessWidget {
  ScrollController? scrollController;

  SendRequestSuccess({Key? key, this.scrollController}) : super(key: key);

  AddressBottomSheetController addressBottomSheetController=Get.put(AddressBottomSheetController());


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: aliColors.AppColors.verifyFayrouzyFirst,
          gradient: LinearGradient(
              colors: [
                aliColors.AppColors.verifyFayrouzyFirst.withOpacity(.99),
                aliColors.AppColors.verifyBlueSecond.withOpacity(.99),
                aliColors.AppColors.verifyGreenThird
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [-.7, 20.5, .5]),
        ),
      child: ListView(
        controller: this.scrollController,
        children: [
          Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  onTap: (){
                   Get.back();
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(15.0.w),
                    child: SvgPicture.asset('images/arrow_back_register.svg'),
                  ),
                ),
              ),
              SizedBox(height:57.93.h ,),
              CircleAvatar(
                backgroundColor: aliColors.AppColors.borderCircleColor,
                radius: 100,
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage('images/personPhoto.jpg'),
                ),
              ),
              Text('منصور الرقيبة',style: TextStyle(color: aliColors.AppColors.whiteColor,fontSize: 13.sp),),
              SizedBox(height:18.h),
              AdvertisersButton(text: 'تم ارسال الطلب بنجاح', backgroundColor: aliColors.AppColors.whiteColor,textColor: aliColors.AppColors.textButtonColor,onPressed: (){

              }),
              SizedBox(height: 10.h,),
              AdvertisersButton(text: 'اذهب إلى طلباتك وانتظر\n رد المعلن', onPressed: (){

              },backgroundColor: aliColors.AppColors.whiteColor,textColor: aliColors.AppColors.textButtonColor,height: 90,),

              
              ],
      ),
    ]));
  }

}
