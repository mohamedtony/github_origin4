import 'package:advertisers/features/advertiser_qr/view/widgets/advertiser_qr_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiserQrPage extends StatelessWidget {
  const AdvertiserQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AdvertiserQrAppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 250.h),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 30),
        decoration:const BoxDecoration(
          gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff71d6df),
                Color(0xff6ac4d9),
                Color(0xff62add4),
                Color(0xff5ba0d1),
                Color(0xff5a9ed1),
                Color(0xff5793cf),
                Color(0xff5185cb),
                Color(0xff4d7bca),
                Color(0xff486ac7),
              ]),
        ),
        child: Container(
          padding:const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:const Color(0xffD5C7E9)),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("# Elrashed",style: TextStyle(color:const Color(0xff244094),fontSize: 16.sp),),
              const  SizedBox(
                height: 9,
              ),
              Expanded(child: Image.asset("images/qr)code.png",fit: BoxFit.fill,)),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                child: InkWell(onTap: (){

                },
                  child: Container(
                    height: 40,
                    child: const Center(
                      child: Text("ارسال",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:const Color(0xff4391D4),

                    ),
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
