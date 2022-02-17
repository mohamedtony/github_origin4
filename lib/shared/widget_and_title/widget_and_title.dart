import 'package:advertisers/features/home_page/app_colors.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 15,vertical:4),
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
                  child: Text("$title",style: TextStyle(color: Colors.white,fontSize: 14.sp),),
                ),
                iconWidget!,
              ],
            ),
          ),
          const Divider(
            color: AppColors.dividerBottom,
            thickness: 4.0,
          ),
        ],
      ),
    );
  }
}
