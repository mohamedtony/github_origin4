import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SlideRightItemsWraperOneItem extends StatelessWidget {
  Widget? firstWidget;
  SlideRightItemsWraperOneItem({this.firstWidget,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 70.sp,
            height: 188.sp,
            margin:const EdgeInsets.only(right: 4,left: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffeff7fa),
            ),
            child: firstWidget!
        ),
      ),
    );
  }
}
