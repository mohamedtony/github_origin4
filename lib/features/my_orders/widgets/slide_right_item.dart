import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideRightItemWidget extends StatelessWidget {
  VoidCallback?  onPress;
  bool? isSvg;
  Color? textColor;
  String? icon,title;
  double widgetOpacity,checkOpacity;

   SlideRightItemWidget({Key? key,this.textColor,this.isSvg,this.onPress,this.icon,this.checkOpacity = 0,this.widgetOpacity = 1,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(
        children: [
          Opacity(
            opacity: widgetOpacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isSvg == true ?  SvgPicture.asset(
                  "$icon",
                  height: 25.sp,
                  color: Color(0xff459FD4),
                ):Image.asset("$icon",height: 25.sp,),
                const SizedBox(
                  height: 4,
                ),
                Text("$title",textAlign:TextAlign.center,style: TextStyle(color: textColor?? Color(0xff459FD4),fontSize: 13.sp),)
              ],
            ),
          ),
          // Positioned(
          //   top:0,
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Opacity(
          //     opacity: checkOpacity,
          //     child: SvgPicture.asset(
          //       "images/check_mark_dark.svg",
          //       height: 30,
          //     ),
          //   ),)
        ],
      ),
    );
  }
}
