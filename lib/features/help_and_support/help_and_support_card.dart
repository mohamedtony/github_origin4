import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpAndSupportCard extends StatelessWidget {
   HelpAndSupportCard({this.isWidthBig,this.image,this.title,Key? key}) : super(key: key);
   final String? image,title;
   final bool? isWidthBig;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 153.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color:Color(0xff244094))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image??' ',
              height: 42.43.h,
              width: 37.43.w,

            ),
           const SizedBox(height: 20,),
            Text(title??' ',style: TextStyle(color: Color(0xff244094)),),
          ],
        ),
      ),
    );
  }
}
