import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/wallet_module/wallet_controller.dart';
import 'package:advertisers/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/wallet_module/widgets/wallet_intro/wallet_intro_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletIntroPage extends StatelessWidget {
  WalletIntroPage({Key? key}) : super(key: key);
  final WalletController _walletController=Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        child:  AppbarIntroWidget(),
        preferredSize:  Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),
      body:  Container(
        padding: EdgeInsets.all(50),
        // color: Color(0xffF5F5F5),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // SizedBox(
            //   height: 60,
            // ),

            Center(
              child: Image.asset(
                "images/payment.png",
                height: 80,
                // color: AppStyle.blueTextButton,
              ),
            ),

            SizedBox(
              height: 75,
            ),

            GetBuilder<WalletController>(
              init: WalletController(),
              builder: (controller) => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: payments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                          onTap: (){
                            controller.passPaymentIndex(payments[index].id);
                            print("${controller.tabId}");
                          },
                          child:  Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                controller.paymentId == payments[index].id  ? selectedBigRadio() : unSelectedBigRadio(),

                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 70,
                                  child: SvgPicture.asset(
                                    "${payments[index].img}",
                                    // height: 21,
                                    // width: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("${payments[index].number}",style: TextStyle(color: Colors.grey,fontSize: 18),),

                              ],
                            ),
                          )
                      ),
                    ) ;
                  }),
            ),

            SizedBox(
              height: 30,
            ),

            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                // width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5,),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "images/plus-circle@.png",
                        height: 35,
                        // color: AppStyle.blueTextButton,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("حساب جديد",style: TextStyle(color:Color(0xff486ac7) ,fontSize:17.sp,height: 1.3),),
                    ],
                  )
                ),
              ),
            ),
            Spacer(),

            Row(
              children: [
                Expanded(child: InkWell(onTap: (){

                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffE8E8E8),
                    ),
                  ),)),

                SizedBox(
                  width: 20,
                ),
                Expanded(child: InkWell(onTap: (){

                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4391D4),

                    ),
                  ),)) ,
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}





