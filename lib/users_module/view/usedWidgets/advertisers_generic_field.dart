import 'package:advertisers/users_module/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertisersGenericField extends StatelessWidget {
   AdvertisersGenericField({this.borderColor, required this.textAlignment,required this.obscureText,this.onSaved,required this.controller,required this.hintText,this.validator,Key? key}) : super(key: key);

  late final String hintText;
  bool  obscureText= false;
  late final TextEditingController controller;
  final void Function(String?)? onSaved;
  String? Function(String?)? validator;
  Color? borderColor;
   TextAlign textAlignment=TextAlign.center ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 323.w,
      //height: 50.h,
      child: TextFormField(
        obscureText:obscureText,
        style: TextStyle(fontSize: 15.sp,fontFamily: 'Arabic-Regular' ),
        textAlign: textAlignment==null?TextAlign.center:textAlignment,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 10.w),

         border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          filled: true,
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          focusColor: AppColors.borderfayrozy,
          fillColor:AppColors.whiteColor,
          hintStyle:TextStyle(color: AppColors.greyColor,fontSize: 15.sp),
          hintText: hintText,
        ),
        controller:controller,
        onSaved: onSaved,
        validator: validator,

      ),
    );
  }
}
