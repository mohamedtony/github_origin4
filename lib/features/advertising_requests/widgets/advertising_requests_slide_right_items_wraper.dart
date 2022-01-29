import 'package:flutter/material.dart';


class AdvertisingRequestsSlideRightItemsWraper extends StatelessWidget {
  Widget? firstWidget,secondWidget;
  AdvertisingRequestsSlideRightItemsWraper({this.firstWidget,this.secondWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4,left: 4),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffeff7fa),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            firstWidget!,

            Container(
              margin: EdgeInsets.only(bottom: 20,top: 10),
              height: 1,
              width: 45,
              color: Color(0xff8fb7d9),
            ),

            secondWidget!,

          ],
        ),
      ),
    );
  }
}
