import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedTab extends StatelessWidget {
  String? title;
  int? id;
  SelectedTab({Key? key,this.title,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<WalletController>(
      init: WalletController(),
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color:controller.tabId != id? Colors.transparent :  Color(0xff4184CE)
        ),
        child: Text("$title",style: TextStyle(color:controller.tabId != id? Color(0xff4184CE) : Colors.white,fontSize: 16.sp),),
      ),
    );
  }
}