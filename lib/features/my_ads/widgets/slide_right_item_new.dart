import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideRightItemNewWidget extends StatelessWidget {
  VoidCallback?  onPress;
  bool? isSvg;
  Color? textColor;
  String? icon,title,viewNumber;
  double widgetOpacity,checkOpacity,iconWidth,iconHeight;

  SlideRightItemNewWidget({Key? key,this.viewNumber,this.textColor,this.isSvg,this.onPress,this.icon,this.checkOpacity = 0,this.widgetOpacity = 1,this.title,this.iconHeight=1,this.iconWidth=1}) : super(key: key);

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
                isSvg == true ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: SvgPicture.asset(
                        "images/repost ads icon.svg",
                        height: 30,
                        width: 30,
                        //color: Color(0xff459FD4),
                        fit: BoxFit.fill,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        child:const Center(
                          child:  Text(
                            "7",style: TextStyle(color: Color(0xff459FD4),fontSize: 26),
                            ),
                        ),
                      ),
                    ),

                  ],
                ):Image.asset("$icon",height: iconHeight,width: iconWidth,fit: BoxFit.fill,),

                Padding(
                  padding: const EdgeInsets.only(bottom:30.0,top: 4),
                  child: Text("$title",textAlign:TextAlign.center,style: TextStyle(color: textColor?? Color(0xff459FD4),fontSize: 13.sp),),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration:const BoxDecoration(
                      color: Color(0xff459FD4),
                      shape: BoxShape.circle
                    ),
                    child: Center(child: Text("$viewNumber",textAlign:TextAlign.center,style: TextStyle(color: textColor?? Colors.white,fontSize: 20.sp),)),
                  ),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}
