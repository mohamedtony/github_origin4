import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget unSelectedBigCheckBox(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    height: 25.h,
    width: 25.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Color(0xff486ac7), width: 1.5),
      // gradient:  const LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color(0xff6fd3de),
      //       Color(0xff486ac7),
      //     ]
      // ),
      borderRadius: BorderRadius.all(
        Radius.circular(3.0),
      ),
//      color: Colors.white,
    ),
  );
}

Widget selectedBigCheckBox(){
  return Container(
    height: 25.h,
    width: 25.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Color(0xff486ac7), width: 1),
      // gradient:  const LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color(0xff6fd3de),
      //       Color(0xff486ac7),
      //     ]
      // ),
      borderRadius: BorderRadius.all(
        Radius.circular(3.0),
      ),
    ),
    child: Center(
      child: Icon(Icons.check,color:Color(0xff486ac7),size: 20,),
    ),
  );
}
