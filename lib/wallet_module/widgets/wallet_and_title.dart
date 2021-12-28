import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletAndTitle extends StatelessWidget {
  const WalletAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff4184CE)
                ),
                child: Text("المحفظة",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
              ),
              SvgPicture.asset(
                "images/wallet.svg",
                height: 21,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey.withOpacity(.5),
          height: 1,
          width: double.infinity,
        ),



      ],
    );
  }
}
