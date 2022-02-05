import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StaticsWidget extends StatelessWidget {
   String? title,price,currency,percent;
   bool? isPoint;
   StaticsWidget({Key? key,this.title,this.price,this.currency,this.isPoint = true,this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          if(isPoint == true)  Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff9DAEE2),
                  ),
                )
              ],
            ),
          ),
           SizedBox(
            width:  isPoint == true ? 4 : 25,
          ),
          Expanded(child: Text("$title",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),)),
       if(percent != null)   Container(
           padding: EdgeInsets.symmetric(horizontal: 40),
           child: Text("$percent",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),)),
          Row(
            children: [
              Text("$price",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp,fontWeight: FontWeight.bold),),
             const SizedBox(
                width: 5,
              ),
              // Spacer(),
              Text("$currency",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),
              const SizedBox(
                width: 10,
              ),
            ],
          )

        ],
      ),
    );
  }
}
