import 'package:advertisers/users_module/app_colors.dart';
import 'package:advertisers/users_module/controller/login_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdvertisersPhone extends StatelessWidget {

    late final String initialSelection;
    late final String hintText;
    Color? borderColor;
    final void Function(CountryCode)?  onChanged;
    late final TextEditingController controller;
    final void Function(String?)? onSaved;
    String? Function(String?)? validator;
   AdvertisersPhone({this.borderColor,this.onSaved,this.onChanged,required this.initialSelection,required this.controller,required this.hintText,this.validator,Key? key}) : super(key: key);
    //var controllerGetx=Get.find<dynamic>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.w,
      //height: 50.h,
      child: TextFormField(
        style: TextStyle(fontSize: 15.sp ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical: 5.0.h),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('images/phone.svg',height: 22.8.h,fit: BoxFit.fitHeight,),
          ),
          prefixIcon:CountryCodePicker(
              searchDecoration: const InputDecoration(
                  focusColor: AppColors.borderfayrozy,focusedBorder:UnderlineInputBorder(),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderfayrozy),)),

              initialSelection:initialSelection,
              onChanged: onChanged),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          filled: true,
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:  borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          focusColor: AppColors.borderfayrozy,
          fillColor:AppColors.whiteColor,
          hintStyle:TextStyle(color: AppColors.greyColor,fontSize: 15.sp,fontFamily: 'Arabic-Regular'),
          hintText: hintText,
        ),
        controller:controller,
        onSaved: onSaved,
        validator: validator,

      ),
    );
  }
}
