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

    return controller.obx(
            (state) {
          return Scaffold(
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
                       state!.cardData!.isNotEmpty ? Row(
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
                                    onPress: (){
                                      if(controller.paymentCard!.status != true){
                                        controller.toggleCardsData(id:controller.paymentCard!.id);
                                      }

                                    },
                                    iconData: FontAwesomeIcons.checkDouble,
                                    color: const Color(0xff129835),
                                  ),
                                  WalletIntroActionItem(
                                    title: "ايقاف",
                                    onPress: (){
                                      if(controller.paymentCard!.status != false){
                                        controller.toggleCardsData(id:controller.paymentCard!.id);
                                      }
                                    },
                                    iconData: FontAwesomeIcons.stop,
                                    color: const Color(0xffffad00),

                                  ),
                                  WalletIntroActionItem(
                                    title: "حذف",
                                    onPress: (){
                                      controller.deleteCardsData(id:controller.paymentCard!.id);

                                    },
                                    iconData: FontAwesomeIcons.removeFormat,
                                    color: const Color(0xffdf3e46),

                                  ),
                                ],
                              )

                            ],
                          ):Container(),

                          const  SizedBox(
                            height: 75,
                          ),

                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state!.cardData!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: InkWell(
                                      onTap: (){
                                        controller.passPaymentIndex(cardData: state!.cardData![index]);
                                        print("${controller.tabId}");
                                      },
                                      child:  Container(
                                        padding: const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            // controller.paymentIdList.contains(state!.data![index].id) ? selectedBigRadio() : unSelectedBigRadio(),
                                            controller.paymentCard!.id==state!.cardData![index].id ? selectedBigRadio() : unSelectedBigRadio(),

                                            const  SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 70,
                                              child: state?.cardData?[index].type != "mastercard" ? Image.asset(
                                                state?.cardData?[index].type ==
                                                    'visa'
                                                    ? "images/visa.png"
                                                    : state?.cardData?[index]
                                                    .type ==
                                                    'mada'
                                                    ? "images/mada.png"
                                                    : state?.cardData?[index]
                                                    .type ==
                                                    'stc'
                                                    ? "images/stc.png"
                                                    : state
                                                    ?.cardData?[
                                                index]
                                                    .type ==
                                                    'apple_pay'
                                                    ? "images/apple.png"
                                                    : state
                                                    ?.cardData?[
                                                index]
                                                    .type ==
                                                    'bian'
                                                    ? "images/bian.png"
                                                    : '',
                                                // height: 21,
                                                // width: 40,
                                              ):SvgPicture.asset(
                                                'images/Mastercard.svg',
                                                // width: 45.0,
                                                // height: 45.0,
                                                // fit: BoxFit.fill,
                                              ),
                                            ),
                                            const  SizedBox(
                                              width: 20,
                                            ),
                                            if(state?.cardData?[index].type == "apple_pay") Spacer(),
                                            if(state?.cardData?[index].type != "apple_pay")       if(state?.cardData?[index].type == "bian" || state?.cardData?[index].type == "stc") Expanded(child: Text("${state!.cardData![index].info!.mobile}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                            if(state?.cardData?[index].type != "apple_pay")    if(state?.cardData?[index].type != "bian" && state?.cardData?[index].type != "stc")  Expanded(child: Text("${state!.cardData![index].info!.cardNumberFour}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                            state!.cardData![index].status == true ?  FaIcon(FontAwesomeIcons.checkDouble,color: const Color(0xff129835),size: 17.sp,):const FaIcon(FontAwesomeIcons.stop,
                                              color:  Color(0xffffad00),)
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


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}




