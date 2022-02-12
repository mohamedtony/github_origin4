import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class AdvertiserInvoiceInputAppbar extends StatelessWidget {



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
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white.withOpacity(.4)),
                    child: Row(
                      children: [
                        Container(
                          padding:const EdgeInsets.only(right: 10,left: 10),
                          child: Image.asset("images/call.png",height: 45,),
                        ),
                        Container(
                          margin:const EdgeInsets.symmetric(vertical: 5),
                          height: double.infinity,
                          width: 1,
                          color: Colors.white,
                        ),
                        Container(
                          padding:const EdgeInsets.only(right: 10,left: 10),
                          child: Image.asset("images/chat-dots.png",height: 45,),
                        ),
                        Container(
                          margin:const EdgeInsets.symmetric(vertical: 5),
                          height: double.infinity,
                          width: 1,
                          color: Colors.white,
                        ),
                        Container(
                          padding:const EdgeInsets.only(right: 10,left: 10),
                          child: Image.asset("images/whatsapp.png",height: 45,),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Card(
                    elevation: 3,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child:  ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                      child: Image.network(
                        'https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg',
                        height: 50.w,
                        // width: 50.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),





                ],
              ),
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
