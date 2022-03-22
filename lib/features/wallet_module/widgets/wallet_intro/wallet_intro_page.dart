import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/widgets/new_account_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/widgets/wallet_intro_action_item.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class WalletIntroPage extends GetWidget<WalletIntroController>  {
  WalletIntroPage({Key? key}) : super(key: key);
  // final WalletController _walletController=Get.put(WalletController());

  @override
  Widget build(BuildContext context) {

    return      GetBuilder<WalletIntroController>(
        init: WalletIntroController(),
        builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          appBar:  PreferredSize(
            child:  AppBarWidget(
            ),
            preferredSize:  Size(
                MediaQuery.of(context).size.width,
                80.0
            ),
          ),
          body:  Container(
            // padding: EdgeInsets.all(50),
            // color: Color(0xffF5F5F5),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color(0xff4184CE)
                            ),
                            child: Text("الحساب",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
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
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "images/payment.png",
                              height: 80,
                              // color: AppStyle.blueTextButton,
                            ),
                            Column(
                              children: [
                                WalletIntroActionItem(
                                  title: "تفعيل",
                                  onPress: (){},
                                  iconData: FontAwesomeIcons.checkDouble,
                                  color: const Color(0xff129835),
                                ),
                                WalletIntroActionItem(
                                  title: "ايقاف",
                                  onPress: (){},
                                  iconData: FontAwesomeIcons.stop,
                                  color: const Color(0xffffad00),

                                ),
                                WalletIntroActionItem(
                                  title: "حذف",
                                  onPress: (){},
                                  iconData: FontAwesomeIcons.removeFormat,
                                  color: const Color(0xffdf3e46),

                                ),
                              ],
                            )

                          ],
                        ),

                        const  SizedBox(
                          height: 75,
                        ),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
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
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          controller.paymentIdList.contains(payments[index].id) ? selectedBigRadio() : unSelectedBigRadio(),

                                          const  SizedBox(
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
                                          const  SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(child: Text("${payments[index].number}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                          FaIcon(FontAwesomeIcons.checkDouble,color: const Color(0xff129835),size: 17.sp,),
                                        ],
                                      ),
                                    )
                                ),
                              ) ;
                            }),

                        const   SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.switchAddAccount();
                              },
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  // width: 150,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5,),
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
                                          const  SizedBox(
                                            width: 10,
                                          ),
                                          Text("حساب جديد",style: TextStyle(color:const Color(0xff486ac7) ,fontSize:17.sp,height: 1.3),),
                                        ],
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        NewAccountWidget(),

                        const  SizedBox(
                          height: 60,
                        ),

                        Row(
                          children: [
                            Expanded(child: InkWell(onTap: (){

                            },
                              child: Container(
                                height: 40,
                                child: const Center(
                                  child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffE8E8E8),
                                ),
                              ),)),

                            const  SizedBox(
                              width: 20,
                            ),
                            Expanded(child: InkWell(onTap: (){

                            },
                              child: Container(
                                height: 40,
                                child: const Center(
                                  child:  Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff4391D4),

                                ),
                              ),)) ,
                          ],
                        ),
                        const  SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}




