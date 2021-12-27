import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;


class AppBarWidget extends StatelessWidget {
  bool? isBack, isSearchBar,isSideMenu,isFilter,
      isNotification,searchBarBigLeft,searchBarBigRight;
  VoidCallback?  backPressed,searchPressed,filterPressed,
      sideMenuPresses,notificationPresses;

  String? searchHint;
  Widget? widgetInsteadSearchBar;

  AppBarWidget({
    Key? key,
    this.widgetInsteadSearchBar,
    this.isBack = true,
    this.searchBarBigLeft = true,
    this.searchBarBigRight = true,
    this.isSearchBar = false,
    this.isSideMenu = true,
    this.isFilter = true,
    this.isNotification = false,
    this.backPressed,
    this.filterPressed,
    this.searchHint,
    this.searchPressed,
    this.sideMenuPresses,
    this.notificationPresses
  }) : super(key: key);

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

              if(isNotification == false)  if(isBack == true)  Row(
                children: [
                  InkWell(
                    onTap: (){
                      backPressed != null
                          ? backPressed!()
                          : Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('images/arrow_back.svg',
                      matchTextDirection: true,
                      height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
              if(isBack == false)  if(isNotification == true) Row(
               children: [
                 InkWell(
                   onTap: notificationPresses,
                   child: SvgPicture.asset("images/appBarNotifiactions.svg",
                     matchTextDirection: true,
                     // height: 50,
                     fit: BoxFit.fitHeight,
                     ),
                 ),
                 const SizedBox(
                   width: 25,
                 ),
               ],
             ),
              widgetInsteadSearchBar ?? Container(),
             if(isSearchBar == true) Expanded(
                child: SizedBox(
                  height: 45.h,
                  child: Row(
                    children: [
                      if(searchBarBigRight == false) Container(
                        width: 50,
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15.sp),
                            // textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:  EdgeInsets.symmetric(vertical: 0),
                              hintText: searchHint,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: searchPressed,
                                  child: SvgPicture.asset(
                                    "images/bx-search-alt.svg",
                                    height: 10,
                                  ),
                                ),
                              ),
                              suffixIcon: isFilter == true ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: filterPressed,
                                  child: SvgPicture.asset(
                                    "images/filter.svg",
                                    height: 10,
                                  ),
                                ),
                              ):Container(),
                              filled: true,
                              fillColor: Colors.white.withOpacity(.9),
                              hintStyle: TextStyle(
                                  color: const Color(
                                    0xffA5A5A5,
                                  ),
                                  fontSize: 15.sp),
                            ),
                            // controller: _walletController.searchController,
                            // onSaved: (value) {
                            //   _walletController.search = value!;
                            // },
                            // validator: (value) {
                            //   return _walletController.validatePhone(value!);
                            // },
                          ),
                        ),
                      ),
                      if(searchBarBigLeft == false) Container(
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),


           if(isSideMenu == true)  Row(
               children: [
                 const SizedBox(
                   width: 25,
                 ),
                 InkWell(
                   /// To Do side menu on pressed
                   onTap: sideMenuPresses,
                   child: Transform(
                     alignment: Alignment.center,
                     transform: Matrix4.rotationY(
                         Get.locale?.languageCode == const Locale('en').languageCode  ? 0 : math.pi),
                     child: Container(
                       child: Image.asset(
                         "images/Nav.png",
                         // height: ,
                         // color: AppStyle.blueTextButton,
                       ),
                     ),
                   ),
                 ),
               ],
             ),


            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]),
    );
  }
}
