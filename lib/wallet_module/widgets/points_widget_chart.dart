import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsChartWidget extends StatelessWidget {
  String? title,value,name;
  PointsChartWidget({Key? key,this.name,this.value,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 125.w,
      height: 75.h,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient:  const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("$title",style: const TextStyle(color: Colors.white,fontSize: 18),),
          Text("$value",style: const TextStyle(color: Colors.white,fontSize: 18),),
          Text("$name",style: const TextStyle(color: Colors.white,fontSize: 16),),
        ],
      ),
    );
  }
}
