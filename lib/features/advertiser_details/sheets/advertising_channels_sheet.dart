import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
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


  // final AdvertisingDetailsController controller =
  //     Get.put(AdvertisingDetailsController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) => Container(
        child: ListView(
          // controller: this.scrollController,
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
                /*const SizedBox(
                  height: 10,
                ),*/
                Container(
                  //height: 30.0,
                 // width: 140.0,
                  //padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(top:10.0,right: 18.0,bottom: 10.0),
                  child: Text(
                    'اختر من قنوات الاعلان',
                    style: TextStyle(
                        color: AppColors.adVertiserPageDataColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 70.0, left: 70.0, bottom: 20.0),
                    shrinkWrap: true,
                    itemCount: advertisingItems!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      //childAspectRatio: 100 / 150,
                      height: 65.0,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 40,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        controller.addRemoveCheckList(advertisingItems![index].id);
                      },
                      child: Container(
                        decoration: controller.checkList!.contains(advertisingItems![index].id) ? BoxDecoration(
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
                        child: Image.asset(
                          "${advertisingItems![index].imgUrl}",
                          fit: BoxFit.cover,
                          height: 50.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 75),
                        height: 40,
                        child: Center(
                          child: Text("حفظ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff4391D4),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class AdvertisingItem {
  int? id;
  String? name,imgUrl;
  AdvertisingItem({this.name,this.id,this.imgUrl});
}


List<AdvertisingItem>? advertisingItems = [
  AdvertisingItem(
    id: 0,
    name: "1",
    imgUrl: 'images/snapshat_icon.png',
  ),
  AdvertisingItem(
    id: 1,
    name: "2",
    imgUrl: 'images/instegram.png',
  ),
  AdvertisingItem(
    id: 2,
    name: "3",
    imgUrl: 'images/twitter.png',
  ),
  AdvertisingItem(
    id: 3,
    name: "4",
    imgUrl: 'images/youtube.png',
  ),
  AdvertisingItem(
    id: 4,
    name: "5",
    imgUrl: 'images/facebook.png',
  ),
  AdvertisingItem(
    id: 5,
    name: "6",
    imgUrl: 'images/whatsup.png'
  ),
  AdvertisingItem(
    id: 6,
    name: "1",
    imgUrl: 'images/snapshat_icon.png',
  ),
  AdvertisingItem(
    id: 7,
    name: "2",
    imgUrl: 'images/instegram.png',
  ),
  AdvertisingItem(
    id: 8,
    name: "3",
    imgUrl: 'images/twitter.png',
  ),
  AdvertisingItem(
    id: 9,
    name: "4",
    imgUrl: 'images/youtube.png',
  ),
  AdvertisingItem(
    id: 10,
    name: "5",
    imgUrl: 'images/facebook.png',
  ),
  AdvertisingItem(
    id: 11,
    name: "6",
    imgUrl: 'images/whatsup.png'
  ),
];