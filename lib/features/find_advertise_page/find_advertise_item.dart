import 'dart:convert';

import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_controller.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../app_core/network/models/User.dart';
import '../../main.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertiseItem extends StatelessWidget {
  FindAdvertiseItem(
      {Key? key,
      required this.advertisersModel,
      required this.findAdvertiseController,required this.index})
      : super(key: key);
  GetAdvertisersModel advertisersModel;
  FindAdvertiseController findAdvertiseController;
  int index;

  @override
  Widget build(BuildContext context) {
    advertisersModel.isLikedObs.value  = advertisersModel.is_liked!;
    advertisersModel.iisMutedObs.value  = advertisersModel.is_muted!;
    advertisersModel.isInBlackList.value  = advertisersModel.in_blacklist!;
    return Obx(()=>Container(
      height: 85.0.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: findAdvertiseController.indexClicked.value==index?Color(0xFFFFCC99):Colors.grey[300]!,
              blurRadius: 4,
              offset: Offset(0, 3), // S
              spreadRadius:findAdvertiseController.indexClicked.value==index?4:2// hadow position
          ),
        ],
      ),
      margin:
      EdgeInsets.only(top: 9.0, bottom: 10.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed('/AdvertiserProfileOrderPage?id=${advertisersModel.id}');
                  },
                  child: Container(
                    width: 75.0,
                    height: 75.0,
                    margin: EdgeInsets.only(right: 6.0, left: 6.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: advertisersModel.image != null &&
                          advertisersModel.image!.isNotEmpty
                          ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(advertisersModel.image!),
                      )
                          : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/user.png'),
                      ),
                      boxShadow: [
                        // so here your custom shadow goes:
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          // the color of a shadow, you can adjust it
                          spreadRadius: 3,
                          //also play with this two values to achieve your ideal result
                          blurRadius: 7,
                          offset: Offset(7,
                              0), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 6.0,bottom: 8),
                    child: Text(
                      advertisersModel.username ?? '',
                      style: TextStyle(
                          color: AppColors.advertiseNameColor,
                          fontSize: 20.0.sp,
                          fontFamily: 'DecoType-Regular',
                          fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 158.0,
            // margin: EdgeInsets.only(left: 10.0,right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(()=>InkWell(
                  onTap: () async {

                    String myToken = await storage.read("token");
                    if(myToken==null ) {
                      showMyToast("مشكلة غير معروفة !");
                      return;
                    }
                    client!.likeAdvertiser(advertisersModel.id,"Bearer "+myToken).then((value) {
                      print("token");
                      Logger().i(value.status.toString());
                      if(value.status==200){

                        if(value.data?.is_liked!=null && value.data!.is_liked==1){
                          advertisersModel.isLikedObs.value  = true;
                          advertisersModel.is_liked = true;
                          showMyToast("تم الإعجاب بالمعلن بنجاح !");
                        }else{
                          advertisersModel.isLikedObs.value = false;
                          advertisersModel.is_liked = false;
                          showMyToast("تم إلغاء الإعجاب بالمعلن بنجاح !");
                        }
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 2.0, right: 2.0),
                    child: advertisersModel.isLikedObs.isTrue
                        ?  SvgPicture.asset(
                      'images/heart_filled.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ):SvgPicture.asset(
                      'images/heart_solid.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),),
                Obx(()=>Container(
                  margin: advertisersModel.in_blacklist==1
                      ? EdgeInsets.only(left: 10.0, right: 10.0,bottom: 4.0)
                      : EdgeInsets.only(left: 10.0, right: 10.0,bottom: 4.0),
                  child: InkWell(
                    onTap: () async {
                      //blockedUsersController.removeBlockedUser(blockedUserModel.id!);
                      String myToken = await storage.read("token");
                      if(myToken==null ) {
                        showMyToast("مشكلة غير معروفة !");
                        return;
                      }
                      client!.blacklistAdvertiser(advertisersModel.id,"Bearer "+myToken).then((value) {
                        print("token= ${advertisersModel.id}");
                        Logger().i(value.status.toString());
                        if(value.status==200){

                          if(value.data?.in_blacklist!=null && value.data!.in_blacklist==1){
                            advertisersModel.isInBlackList.value  = 1;
                            advertisersModel.in_blacklist = 1;
                            showMyToast("تم متابعة المعلن بنجاح !");
                          }else{
                            advertisersModel.isInBlackList.value  = 0;
                            advertisersModel.in_blacklist = 0;
                            showMyToast("تم إلغاء متابعة المعلن بنجاح !");
                          }
                        }
                      });
                    },
                    child:  advertisersModel.isInBlackList ==0
                        ? Image.asset(
                      'images/icon_eye_open.png',
                      fit: BoxFit.fill,
                      height: 18.0,
                      width: 26.0,
                    ):Image.asset(
                      'images/icon_eye_off.png',
                      fit: BoxFit.fill,
                      height: 23.0,
                      width: 26.0,
                    ),
                  ),
                )),
                InkWell(
                  onTap: () async {
                    /*String myToken = await storage.read("token");
                    if(myToken==null ) {
                      showMyToast("مشكلة غير معروفة !");
                      return;
                    }
                    client!.muteAdvertiser(advertisersModel.id,"Bearer "+myToken).then((value) {
                      print("token= ${advertisersModel.id}");
                      Logger().i(value.status.toString());
                      if(value.status==200){

                        if(value.data?.is_muted!=null && value.data!.is_muted==1){
                          advertisersModel.iisMutedObs  = true;
                          advertisersModel.is_muted = true;
                          showMyToast("تم حظر مراسلة المعلن !");
                        }else{
                          advertisersModel.iisMutedObs  = false;
                          advertisersModel.is_muted = false;
                          showMyToast("تم إلغاء حظر مراسلة المعلن !");
                        }
                      }
                    });*/

                    //  Get.to(ChatRecentPage());

                    //String myId = await storage.read("id");
                    dynamic data = await storage.read("data");

                    User user = User.fromJson(data);

                    print("UserId=${user.id}");
                    print("UserId=${user.username}");
                    print("UserIrrd=${advertisersModel.id}");
                    Get.toNamed('/ChatPage?room=${advertisersModel.id}-${user.id}'
                        '&from_user=${json.encode(FromUserModel(id: user.id,username: user.username,image: user.image))}&to_user=${json.encode(ToUserModel(id: advertisersModel.id,image:    advertisersModel.image,username:advertisersModel.username))}&id=${0}');


                  },
                  child: Obx(()=>Container(
                    padding: EdgeInsets.only(left: 2.0, right: 2.0),
                    child: advertisersModel.iisMutedObs.isTrue
                        ? SvgPicture.asset(
                      'images/chat_icon.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ):SvgPicture.asset(
                      'images/chat_icon_dot.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  )),
                ),
              ],
            ),
          )
        /*  Container(
            width: 158.0,
            // margin: EdgeInsets.only(left: 10.0,right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2.0, right: 2.0),
                  child: advertisersModel.is_liked !=
                      null && *//*advertisersModel.is_liked!*//* true
                      ? SvgPicture.asset(
                    'images/heart_solid.svg',
                    fit: BoxFit.fill,
                    height: 45.0,
                    width: 45.0,
                  )
                      : SvgPicture.asset(
                    'images/heart_filled.svg',
                    fit: BoxFit.fill,
                    height: 45.0,
                    width: 45.0,
                  ),
                ),
                Container(
                  padding: advertisersModel.is_muted != null &&
                      advertisersModel.is_muted!
                      ? EdgeInsets.only(left: 2.0, right: 2.0, bottom: 4.0)
                      : EdgeInsets.only(left: 2.0, right: 2.0, bottom: 4.0),
                  child: InkWell(
                    onTap: () {
                      //blockedUsersController.removeBlockedUser(blockedUserModel.id!);
                    },
                    child: advertisersModel.is_muted !=
                        null && *//*advertisersModel.is_muted!*//* false
                        ? SvgPicture.asset(
                      'images/Icon_closed_eye.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    )
                        : SvgPicture.asset(
                      'images/Icon_open_eye.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 2.0, right: 2.0),
                  child: advertisersModel.chat != null &&
                      *//*advertisersModel.chat!*//*true
                      ? SvgPicture.asset(
                    'images/chat_icon_dot.svg',
                    fit: BoxFit.fill,
                    height: 45.0,
                    width: 45.0,
                  )
                      : SvgPicture.asset(
                    'images/chat_icon.svg',
                    fit: BoxFit.fill,
                    height: 45.0,
                    width: 45.0,
                  ),
                ),
              ],
            ),
          )*/
        ],
      ),
    ));
  }

  void showMyToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        //fontFamily: 'Arabic-Regular',
        fontSize: 16.0);
  }
}
