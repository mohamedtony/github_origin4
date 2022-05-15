import 'package:advertisers/features/notifications/view/pages/notifications_screen.dart';
import 'package:advertisers/features/notifications/view/widgets/colors.dart';
import 'package:advertisers/features/notifications/view/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

TextEditingController searchController = TextEditingController();

class DefaultAppBar extends StatelessWidget {
  final bool notificationScreen;
  const DefaultAppBar({Key? key, this.notificationScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.appBarGradient1,
              AppColors.appBarGradient2,
            ]),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Nav Bar
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svg/Nav.svg',
                  width: 30.w,
                  height: 30.h,
                )),
            const SizedBox(
              width: 20,
            ),
            //Search
            Expanded(
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(AppConstants.searchRadius),
                    color: AppColors.light.withOpacity(0.87)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/svg/bx-search-alt.svg',
                          width: 20.w,
                          height: 20.h,
                        )),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/svg/filter.svg',
                          width: 20.w,
                          height: 20.h,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            //Notification Bell
            notificationScreen
                ? IconButton(
              iconSize: 48.sp,
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                  'assets/svg/notification/back-opacity.svg'),
            )
                : IconButton(
              iconSize: 20.sp,
              onPressed: () {
                Get.to(() => NotificationsScreen());
              },
              icon: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child:
                      SvgPicture.asset('assets/svg/notification.svg'),
                    ),
                    SvgPicture.asset('assets/svg/new-notification.svg'),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}