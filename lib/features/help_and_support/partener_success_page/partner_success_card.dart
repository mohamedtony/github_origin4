import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerSuccessCard extends StatelessWidget {
  const PartnerSuccessCard({required this.image,required this.title,required this.text,Key? key}) : super(key: key);
final String title,text,image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 19.0,bottom: 19,end: 29),
      child: Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xff244094)),

        ),
        child: Stack(
          alignment: Alignment.center,overflow: Overflow.visible,

          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment:Alignment.centerRight,
                      child: Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)),
                  Text(text,textAlign:TextAlign.center,style: TextStyle(fontSize: 15.sp,color: Color(0xff929292))),
                  Text('اقرأ المزيد...',textAlign:TextAlign.center,style: TextStyle(fontSize: 15.sp,color: Color(0xff929292))),
                ],
              ),
            ),

          Positioned(
            left: -21.5,
            child: SvgPicture.asset(image,height: 44.h,width: 44.w,),
          )
          ],
        ),
      ),
    );
  }
}
