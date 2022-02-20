import 'package:advertisers/app_core/network/models/BlockedUserModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/features/blocked_users_page/blocked_users_controller.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertiseItem extends StatelessWidget {
  FindAdvertiseItem(
      {Key? key,
      required this.advertisersModel,
      required this.findAdvertiseController})
      : super(key: key);
  GetAdvertisersModel advertisersModel;
  FindAdvertiseController findAdvertiseController;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        //shadowColor: Colors.grey[300],
        shadowColor: Color(0xFF800066).withOpacity(0.0),


        margin:
            EdgeInsets.only(top: 9.0, bottom: 10.0, left: 10.0, right: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 85.0.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
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
                    Container(
                      padding: EdgeInsets.only(left: 2.0, right: 2.0),
                      child: advertisersModel.is_liked !=
                              null && /*advertisersModel.is_liked!*/ true
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
                                null && /*advertisersModel.is_muted!*/ true
                            ? SvgPicture.asset(
                                'Icon_closed_eye.svg',
                                fit: BoxFit.fill,
                                height: 45.0,
                                width: 45.0,
                              )
                            : SvgPicture.asset(
                                'Icon_open_eye.svg',
                                fit: BoxFit.fill,
                                height: 45.0,
                                width: 45.0,
                              ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 2.0, right: 2.0),
                      child: advertisersModel.chat != null &&
                              /*advertisersModel.chat!*/true
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
              )
            ],
          ),
        ));
  }
}
