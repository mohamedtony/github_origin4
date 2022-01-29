
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_colors.dart';

class AdvantagesBakaCard extends StatelessWidget {
   AdvantagesBakaCard({required this.text,Key? key}) : super(key: key);
  late String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:3.0.h),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 10.w,width: 10.w,
            decoration: BoxDecoration(
                color: AppColors.bakaPriceColor,
                shape: BoxShape.circle
            ),),SizedBox(width: 10.5.w,),
          SizedBox(
            child: Text(text,style: TextStyle(fontSize: 14.sp,color: AppColors.arrowBlueColor),),
          ),
        ],
      ),
    );
  }
}
