import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SlideRightItemsWraper extends StatelessWidget {
  Widget? firstWidget,secondWidget;
   SlideRightItemsWraper({this.firstWidget,this.secondWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(left:2.0,right: 2,bottom: 4),
            child: Container(
              width: 70.sp,
                height: 88.sp,
                margin:const EdgeInsets.only(right: 4,left: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffeff7fa),
                ),
                child: firstWidget!
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left:2.0,right: 2,top: 4),
            child: Container(
                width: 70.sp,
                height: 88.sp,
                margin:const EdgeInsets.only(right: 4,left: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffeff7fa),
                ),
                child: secondWidget!
            ),
          ),

        ],
      ),
    );
  }
}
