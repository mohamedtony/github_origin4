import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget unSelectedBigRadio(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    height: 25.h,
    width: 25.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
//      color: Colors.white,
    ),
  );
}

Widget selectedBigRadio(){
  return Container(
    height: 25.h,
    width: 25.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.grey, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
    ),
    child: Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient:  const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff6fd3de),
              Color(0xff486ac7),
            ]
        ),        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
    ),
  );
}




Widget unSelectedRadio(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    height: 18.h,
    width: 18.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
//      color: Colors.white,
    ),
  );
}

Widget selectedRadio(){
  return Container(
    height: 18.h,
    width: 18.h,
    decoration: BoxDecoration(
      border: Border.all(
          color: Colors.grey, width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
    ),
    child: Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient:  const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff6fd3de),
              Color(0xff486ac7),
            ]
        ),        borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
      ),
    ),
  );
}
