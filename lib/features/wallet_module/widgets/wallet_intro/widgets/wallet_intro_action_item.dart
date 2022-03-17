import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class WalletIntroActionItem extends StatelessWidget {
  String? title;
  VoidCallback? onPress;
  IconData? iconData;
  Color? color;

   WalletIntroActionItem({this.title,this.onPress,this.iconData,this.color});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPress,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
          child: Row(
            children: [
              FaIcon(iconData,color: color,size: 14.sp,),
              SizedBox(
                width: 15,
              ),
              Text(
                '$title',
                style: TextStyle(color: color,fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
