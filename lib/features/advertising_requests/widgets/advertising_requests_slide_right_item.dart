import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdvertisingRequestsSlideRightItemWidget extends StatelessWidget {
  VoidCallback?  onPress;
  bool? isSvg,isClickable;
  String? icon,title;
  double widgetOpacity,checkOpacity;
  AdvertisingRequestsSlideRightItemWidget({Key? key,this.isSvg,this.isClickable,this.onPress,this.icon,this.checkOpacity = 0,this.widgetOpacity = 1,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable == true ? onPress : null,
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
                  height: 20.sp,
                  color:const Color(0xff459FD4),
                ):Image.asset("$icon"),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                    // color: Colors.red,
                    child: Text("$title",style: TextStyle(color: const Color(0xff459FD4),fontSize: 14.sp,height: 1.3),textAlign: TextAlign.center))
              ],
            ),
          ),
          Positioned(
            top:0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Opacity(
              opacity: checkOpacity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  "images/check_mark_dark.svg",
                  height: 30,
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
