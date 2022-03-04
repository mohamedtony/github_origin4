import 'dart:ui';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';


class CustomerOrderInvoiceBarWidget extends StatelessWidget {

  final Advertiser? user;

  CustomerOrderInvoiceBarWidget({this.user});

  launchURL(urlLink) async {
    var url = urlLink;
    if(url != null){
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

  }

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
                    onTap: (){
                      _launchCaller() async {
                        final url = "tel:${user!.phone}";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                      _launchCaller();
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
                    onTap: (){
                      launchURL("https://wa.me/${user!.whatsapp}?text=Hello");

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
}
