import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:advertisers/features/users_module/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget({Key? key}) : super(key: key);
  final WalletController _walletController=Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
      ),
      child:   Padding(
        padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              InkWell(
                onTap: (){
                  Get.toNamed("/ListPage");
                },
                child: Image.asset(
                  "images/Nav.png",
                  // height: ,
                  // color: AppStyle.blueTextButton,
                ),
              ),

              SizedBox(
                width: 25,
              ),
              Expanded(
                child: SizedBox(
                  // width: 323.w,
                  height: 45.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextFormField(
                      style: TextStyle(fontSize: 15.sp ),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: (){

                            },

                            child: SvgPicture.asset(
                              "images/bx-search-alt.svg",
                              height: 10,
                            ),
                          ),
                        ),

                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            onTap: (){

                            },
                            child: SvgPicture.asset(
                              "images/filter.svg",
                              height: 10,
                            ),
                          ),
                        ),

                        filled: true,
                        fillColor: Colors.white.withOpacity(.9),
                        hintStyle:TextStyle(color: const Color(0xffA5A5A5,),fontSize: 15.sp),
                      ),
                      controller: _walletController.searchController,
                      onSaved: (value){
                        _walletController.search=value!;
                      },
                      validator: (value){
                        return _walletController.validatePhone(value!);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),

              InkWell(
                onTap: (){

                },
                child: SvgPicture.asset(
                  "images/bell.svg",
                  height: 25,
                ),
              ),

            ],
          ),
        ),
      ),
      decoration:  BoxDecoration(
          gradient:  const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
      ),
    );
  }
}
