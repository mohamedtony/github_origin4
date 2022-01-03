import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:advertisers/features/home_page/app_colors.dart';

class AdvertisingChannelsPage extends StatelessWidget {
  ScrollController? scrollController;

  AdvertisingChannelsPage({Key? key, this.scrollController}) : super(key: key);
  final AdertisingChannelsController controller =
      Get.put(AdertisingChannelsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: this.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'adChannels'.tr,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: SvgPicture.asset(
                        'images/tv_icon.svg',
                        fit: BoxFit.fill,
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),
              Container(
                height: 30.0,
                width: 140.0,
                //padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(18.0),
                child: Text(
                   'chooseChannel'.tr,
                  style: TextStyle(
                      color: AppColors.adVertiserPageDataColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.only(right: 70.0, left: 70.0, bottom: 20.0),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  //childAspectRatio: 100 / 150,
                  height: 65.0,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) => Obx(() => InkWell(
                      onTap: () => controller.changeTabIndex(index, true),
                      child: Container(
                        //margin: const EdgeInsets.all(15.0),
                        // padding: const EdgeInsets.all(3.0),
                        decoration: controller.items[index].isTapped!.isTrue
                            ? BoxDecoration(
                                border: Border.all(
                                    color:
                                        AppColors.bottomSheetTabColorRounded),
                                color: Colors.white,
                                boxShadow: [
                                  // so here your custom shadow goes:
                                  BoxShadow(
                                    color: Colors.grey,
                                    // the color of a shadow, you can adjust it
                                    spreadRadius: 0,
                                    //also play with this two values to achieve your ideal result
                                    blurRadius: 4,
                                    offset: Offset(0,
                                        4), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                  ),
                                ],
                              )
                            : BoxDecoration(
                                //border: Border.all(color: Colors.white)
                                ),
                        child: Container(
                          // margin: EdgeInsets.only(right: 18.0),
                          //padding: EdgeInsets.all(2),
                          child: Image.asset(
                            controller.images[index],
                            fit: BoxFit.cover,
                            height: 50.0,
                            width: 30.0,
                          ),
                        ),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 45.0),
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
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 45.0),
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
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
