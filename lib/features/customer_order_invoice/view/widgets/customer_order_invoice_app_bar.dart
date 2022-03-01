import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:advertisers/app_core/network/responses/RegisterClientUserResponse.dart';
import 'package:advertisers/features/customer_order_invoice/controller/customer_order_invoice_controller.dart';
import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';


class CustomerOrderInvoiceBarWidget extends StatelessWidget {

MyOrdersController _myOrdersController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Row(
                children: [
                  InkWell(
                    onTap:()async{
                      RegisterClientUserResponse registerClientUserResponse=RegisterClientUserResponse.fromJson(json.decode(json.encode(storage.read("data"))));
                       if (!await launch("tel:${registerClientUserResponse.data?.phone??''}")) throw 'Could not launch PhoneCall';
                      //bool? res = await FlutterPhoneDirectCaller.callNumber(registerClientUserResponse.data?.phone??'');
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 10,left: 25),
                      child: Image.asset("images/call.png",height: 45,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: double.infinity,
                    width: 1,
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 25,left: 25),
                    child: Image.asset("images/chat-dots.png",height: 45,),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: double.infinity,
                    width: 1,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: ()async{
                      RegisterClientUserResponse registerClientUserResponse=RegisterClientUserResponse.fromJson(json.decode(json.encode(storage.read("data"))));
                      // var whatsappUrl ="whatsapp://send?phone=${registerClientUserResponse.data?.phone??''}";
                      // await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                      await openwhatsapp(context,registerClientUserResponse.data?.phone);

                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 25,left: 25),
                      child: Image.asset("images/whatsapp.png",height: 45,),
                    ),
                  ),
                ],
              )),

              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('images/arrow_back.svg',
                  // matchTextDirection: true,
                  height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
              ),

            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topRight,
            // stops: [
            //   0.2,
            //   0.2,
            //   0.4,
            //   1,
            // ],
            end: Alignment.bottomRight,
            colors: [
              Color(0xff71d7de),
              Color(0xff6ccbdc),
              // Colors.white
            ]),
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
