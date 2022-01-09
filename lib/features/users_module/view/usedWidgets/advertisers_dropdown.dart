import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
import 'package:advertisers/shared/network/models/Area.dart';
import 'package:advertisers/shared/network/models/Country.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdvertisersDropDown extends StatelessWidget {
  late String hintText; double? width=323.w;
  Color? borderColor;
   List<dynamic>? items;
    Function(dynamic item)? onSelectedItemChanged;

   AdvertisersDropDown({this.items,this.onSelectedItemChanged,this.borderColor,this.width,required this.hintText,Key? key}) : super(key: key);

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
        child: DropdownSearch<dynamic>(
          mode: Mode.MENU,showSearchBox: true,
          dropDownButton: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 20.0.h,top: 0),
            child: Icon(Icons.arrow_drop_down_sharp,size: 30,color:Color(0xff244094),),
          ),
          items: items,
          dropdownButtonSplashRadius: 12,
          itemAsString: (dynamic? u) => u!.itemAsStringByName(),
          //label: "Menu mode",
          hint: hintText,dropdownSearchBaseStyle: TextStyle(fontFamily: 'Arabic-Regular',fontSize: 14.sp),
          dropdownSearchDecoration: InputDecoration(
            contentPadding:  EdgeInsets.symmetric(horizontal: 10.w),

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
          onChanged: (item){
            //_registerNewClientUserController.changeAreas(country!.id!);
              if(this.onSelectedItemChanged!=null) {
                this.onSelectedItemChanged!(item);
              }

          },
          //selectedItem: "Brazil"
          //),
        ),
      );
  }
}
