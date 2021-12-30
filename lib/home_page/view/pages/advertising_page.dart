import 'package:advertisers/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/request_advertise_module/view/pages/request_advertise_page.dart';
import 'package:advertisers/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AdvertisingPage extends StatelessWidget {
  const AdvertisingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            AdvertiseItem(),
            AdvertiseItem(),
            AdvertiseItem(),
            AdvertiseItem(),
            AdvertiseItem(),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestAdvertisePage(),
                  ),
                );
              },
              child: Container(
                width: 62,
                height: 62,
                margin: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("requestAdvertise".tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 14.0,color: Colors.white),))
                ,decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.beginColor, AppColors.endColor],
                ),
              ),),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}