import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleSupportWidget extends StatelessWidget {
  const TitleSupportWidget({required this.title,required this.image,Key? key}) : super(key: key);
final String image, title;
  @override
  Widget build(BuildContext context) {
    return      Container(
      color: Color(0xffF5F5F5),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  height: 30.0,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xff4184CE)
                  ),
                  child: Text(title,style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                ),
                SvgPicture.asset(image,height: 32.43.h,
                  width: 37.43.w,fit: BoxFit.fitWidth,),
              ],
            ),
          ),
          // const Divider(
          //   color: AppColors.dividerBottom,
          //   thickness: 4.0,
          // ),
        ],
      ),
    );
  }
}
