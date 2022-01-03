import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetAndTitle extends StatelessWidget {
  String? title;
  Widget? iconWidget;
  Color?  containerColor;
  WidgetAndTitle({Key? key,this.title,this.iconWidget,this.containerColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xff4184CE)
                  ),
                  child: Text("$title",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                ),
                iconWidget!,
              ],
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(.5),
            height: 1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
