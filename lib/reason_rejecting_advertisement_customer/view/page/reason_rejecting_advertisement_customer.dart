import 'dart:io';

import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/reason_rejecting_advertisement_customer/controller/reason_rejecting_advertisement_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReasonRejectingAdvertisementCustomer extends StatelessWidget {
  ReasonRejectingAdvertisementCustomer({Key? key}) : super(key: key);
  ReasonRejectingAdvertisementCustomerController reasonRejectingAdvertisementCustomerController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient:   LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff9cf2fd),
                      Color(0xffb7eafc),
                      Color(0xffd7e5fb),
                      Color(0xfffdfdfd),
                      Color(0xfffefeff),
                      Color(0xfffefeff),
                      Color(0xfffefeff),
                    ]
                ),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 35,right: 20,left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('images/arrow_back.svg',
                    // matchTextDirection: true,
                    height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .04,
            width: double.infinity,
            decoration:const  BoxDecoration(
              color: Color(0xffe9e8f6),
              borderRadius:  BorderRadius.only(
                topLeft:  Radius.circular(20.0),
                topRight:  Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 65,
                  height: 2,
                  color:const Color(0xffbfbfc7),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 45,
                  height: 2,
                  color:const Color(0xffbfbfc7),
                ),
              ],
            ),),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [

                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient:   LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff6fd3de),
                          Color(0xff486ac7),
                        ]
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.id.toString()??'',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        const  SizedBox(
                          height: 15,
                        ),
                        Row(
                          children:  [
                            InkWell(
                                onTap: ()async{
                                  if (!await launch("tel:${reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.advertiser?.phone??''}")) throw 'Could not launch PhoneCall';
                                },
                                child: const FaIcon(FontAwesomeIcons.phoneAlt,color: Colors.white,size: 20,)),
                            Container(
                              height: 45,
                              width: 1,
                              color: Colors.white,
                              margin:const EdgeInsets.symmetric(horizontal: 25),
                            ),

                            InkWell(
                                onTap: (){

                                },
                                child: const FaIcon(FontAwesomeIcons.commentDots
                                    ,color: Colors.white,size: 25)),

                            Container(
                              height: 45,
                              width: 1,
                              color: Colors.white,
                              margin:const EdgeInsets.symmetric(horizontal: 25),
                            ),

                                  InkWell(
                                      onTap: ()async{
                                        await openwhatsapp(context,reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.advertiser?.phone);
                                    // var whatsappUrl ="whatsapp://send?phone=${reasonRejectingAdvertisementCustomerController.reasonDataModel.value.user?.phone??''}";
                                    // await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                //  },
                                },
                                child: const FaIcon(FontAwesomeIcons.whatsapp
                                    ,color: Color(0xff148253),size: 30)),
                            SizedBox(
                              width: 75.w,
                            ),
                            Card(
                              elevation: 8,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child:  ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                child: Image.network('https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg',
                                 // reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.user?.image??'',
                                  height: 50.w,
                                  width: 50.w,
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Center(
                          child: Text("تغطية مع الحضور .......................................................",style: TextStyle(color: Colors.white),),
                        ),
                        const   SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: Colors.white,
                              elevation: 8,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child:  Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 20,
                                ),
                                child: Text("طلب مرفوض",style: TextStyle(color:const Color(0xff1A2D67),fontWeight: FontWeight.bold,fontSize: 15.sp),),
                              ),
                            ),
                          ],
                        ),
                        const  SizedBox(
                          height: 20,
                        ),

                        Container(
                          padding:const EdgeInsets.only(top: 15,right: 10,left: 10,bottom: 60),
                          decoration: BoxDecoration(
                            color:const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("السبب",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(child: Text(reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.reason??'',style: TextStyle(color:const Color(0xff6D6B6B),fontSize: 13.sp),),)
                            ],
                          ),),
                        const  SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15,
                              left: 20,
                              right: 20,
                              top: 5
                          ),
                          child: Row(
                            children: [
                              Expanded(child: InkWell(onTap: (){
                                Get.find<MyOrdersController>().refuseRequest(requestId: reasonRejectingAdvertisementCustomerController.myRefuseReason.data?.id??0);
                                Get.back();
                              },
                                child: Container(
                                  height: 40,
                                  child: Center(
                                    child: Text("رفض الطلب",style: TextStyle(color: Color(0xff427AD0),fontSize: 18,fontWeight: FontWeight.bold),),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffE8E8E8),
                                  ),
                                ),)),

                             const SizedBox(
                                width: 35,
                              ),
                              Expanded(child: InkWell(onTap: (){

                              },
                                child: Container(
                                  height: 40,
                                  child: Center(
                                    child: Text("تعديل الطلب",style: TextStyle(color: Color(0xff244094),fontSize: 16.sp,),),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xfff4f4f4),

                                  ),
                                ),)) ,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  openwhatsapp(context,whatsapp) async{
    //var whatsapp ="+919144040888";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }
}
