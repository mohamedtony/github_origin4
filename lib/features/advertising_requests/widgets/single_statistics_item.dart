import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SingleStatisticsItemWidget extends StatelessWidget {
  final String? upperTitle,sideTitle,desc;
  bool isCenterMainAxisAlignment ,isCenterCrossAxisAlignment;

   SingleStatisticsItemWidget({Key? key,this.desc,this.sideTitle,this.upperTitle,this.isCenterMainAxisAlignment= true,this.isCenterCrossAxisAlignment = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff4f599c),
                Color(0xff385aa3),
              ]
          ),        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        ),
        child: Row(
          mainAxisAlignment: isCenterMainAxisAlignment == true ? MainAxisAlignment.center : MainAxisAlignment.start,

          children: [
        if(sideTitle != null)    Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("$sideTitle",style: TextStyle( fontSize: 13.sp,color: Colors.white,height: 1.5,fontWeight: FontWeight.bold),),
            ),

            Column(
              crossAxisAlignment: isCenterCrossAxisAlignment == true ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [

             if(upperTitle != null)   Text("$upperTitle",style: TextStyle( fontSize: 11.sp,color: Colors.white,height: 1.5,fontWeight: FontWeight.bold)),

                Text("$desc",style: TextStyle( fontSize: 10.sp,color: Colors.white,height: 1.5),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
