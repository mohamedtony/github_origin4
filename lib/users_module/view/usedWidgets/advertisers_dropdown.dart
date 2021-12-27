import 'package:advertisers/users_module/app_colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisersDropDown extends StatelessWidget {
  late String hintText; double? width=323.w;
  Color? borderColor;
   AdvertisersDropDown({this.borderColor,this.width,required this.hintText,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Container(
      // width: width==0?323.w:width,
      // height: 47.h,
      // decoration: BoxDecoration(
      //   color: AppColors.whiteColor,
      //   border: Border.all(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // child:
      SizedBox(
        width: width==0?323.w:width,
         height: 47.h,
        child: DropdownSearch<String>(
            mode: Mode.MENU,showSearchBox: true,dropDownButton: Icon(Icons.arrow_drop_down_sharp,size: 35,color:Color(0xff244094),),
            items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],dropdownButtonSplashRadius: 12,
            //label: "Menu mode",
            hint: hintText,dropdownSearchBaseStyle: TextStyle(fontFamily: 'Arabic-Regular',fontSize: 14.sp),
            popupItemDisabled: (String s) => s.startsWith('I'),dropdownSearchDecoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 10.w),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
          filled: true,
          disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),fillColor: AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
          ),
        ),
            onChanged: print,
            //selectedItem: "Brazil"
        //),
    ),
      );
  }
}
