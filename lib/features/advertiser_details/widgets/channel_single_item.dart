import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelSingleItem extends StatelessWidget {
 final String? imgUrl,title;
 final VoidCallback?  onTap;
   ChannelSingleItem({Key? key,this.imgUrl,this.onTap,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          '$imgUrl',
          // ,
          height: 40.w,
          width: 40.w,
        ),
        Positioned(
            left: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 12.sp,
                ),
              ),
            ))
      ],
    );
  }
}
