import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UrlsPage extends StatelessWidget {
  // ScrollController? scrollController;

  // UrlsPage({Key? key, this.scrollController}) : super(key: key);
  final AdertisingChannelsController controller =
      Get.put(AdertisingChannelsController());

  @override
  Widget build(BuildContext context) {
   return GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) => Container(
        child: ListView(
          // controller: this.scrollController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.all(8.0),
                  color: AppColors.bottomSheetTabColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                        width: 140.0,
                        //padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'links'.tr,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.tabColor),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 18.0),
                        child: SvgPicture.asset(
                          'images/link_line_icon.svg',
                          fit: BoxFit.fill,
                          height: 18.0,
                          width: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.dividerBottom,
                  thickness: 4.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    controller.addToUrlList();
                  },
                  child: Container(
                    width: 45,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 30.0, top: 0.0),
                    child: Material(
                      elevation: 6.0,
                      shadowColor: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: AppColors.addPhotoBottom,
                      child: Container(
                        //margin: EdgeInsets.only(left: 15.0),
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 12, left: 12.0),
                        child: Image.asset(
                          'images/plus_circle.png',
                          fit: BoxFit.fill,

                          height: 12.0,
                          // width: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller!.urlList!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              // color: Colors.red,
                              child:  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:const Color(0xfff29637)
                                ),
                                padding: const EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 35.h),
                                child: Container(
                                  height: 25,
                                    width: 25,
                                  // padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.white)
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.clear,
                                      size: 15.0.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('ازالة'),
                                  content: const Text('هل انت متآكد من ازالة هذا العنصر ؟'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        controller.removeFromUrlList(controller.urlList![index]);
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('نعم'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('الغاء'),
                                    )
                                  ],
                                );
                              });
                        },
                        key: Key("${controller!.urlList![index].id}"),
                        direction: DismissDirection.endToStart,
                        child: Column(
                          children: [
                            Container(
                              height: 42,
                              margin: EdgeInsets.only(
                                  top: 10, left: 22.0, right: 22.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Material(
                                elevation: 6.0,
                                shadowColor: Colors.grey[200],
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                //borderOnForeground: true,
                                color: AppColors.saveButtonBottomSheet,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.addPhotoBottom,
                                          width: 0.5),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin:const EdgeInsets.only(
                                              top: 2.0,
                                              bottom: 2.0,
                                              left: 10.0,
                                              right: 10.0),
                                          child: Text(
                                            "${index+1}",
                                            style:const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0),
                                          )),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        color: Colors.grey.withOpacity(0.2),
                                        width: 2,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          onChanged: (val){
                                            controller.urlList![index]!.urlName = val;
                                            // controller.setStateBehavior();
                                          },
                                          textAlign: TextAlign.start,
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.only(left: 10.0,right: 10.0,),
                                              // isCollapsed: true,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    70.0),
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none,
                                                ),
                                              ),
                                              filled: true,
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[350]),
                                              hintText: 'urlName'.tr,
                                              fillColor: Colors.white70),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 42,
                              margin: EdgeInsets.only(
                                  top: 5, left: 22.0, right: 22.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Material(
                                elevation: 6.0,
                                shadowColor: Colors.grey[200],
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                //borderOnForeground: true,
                                color: AppColors.saveButtonBottomSheet,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.addPhotoBottom,
                                          width: 0.5),
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                      color: Colors.white),
                                  child: TextField(
                                    onChanged: (val){
                                      controller.urlList![index]!.urlTitle = val;
                                      // controller.setStateBehavior();
                                    },
                                    textAlign: TextAlign.start,
                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    decoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.only(right: 40.0),
                                        // isCollapsed: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(70.0),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(
                                            color: Colors.grey[350]),
                                        hintText: 'urlName'.tr,
                                        fillColor: Colors.white70),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.setStateBehavior();
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        width: 135,
                        height: 35,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.saveButtonBottomSheet,
                          child: Container(
                            /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                            alignment: Alignment.center,
                            child: Text(
                              'save'.tr,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.tabColor,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        width: 135,
                        height: 35,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.tabColor,
                          child: Container(
                            /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                            alignment: Alignment.center,
                            child: Text(
                              'cancel'.tr,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class UrlDataType {
  int? id;
  String? urlName,urlTitle;
  UrlDataType({
    this.id,
    this.urlName,
    this.urlTitle
});
}