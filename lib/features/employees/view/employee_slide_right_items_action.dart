import 'package:flutter/material.dart';


class EmployeeSlideRightItemsAction extends StatelessWidget {
  Widget? firstWidget,secondWidget,thirdWidget;
  EmployeeSlideRightItemsAction({this.firstWidget,this.secondWidget,this.thirdWidget});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(right: 4,left: 4),

      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color:   Color (0xffeff7fa) ,
      // ),
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: firstWidget!,
            ),



            secondWidget!,


            Padding(
              padding: const EdgeInsets.all(4.0),
              child: thirdWidget!,
            ),

          ],
        ),
      ),
    );
  }
}
