import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertisingChannelsPage extends StatefulWidget {
  ScrollController? scrollController;

  AdvertisingChannelsPage({Key? key, this.scrollController}) : super(key: key);

  @override
  State<AdvertisingChannelsPage> createState() => _AdvertisingChannelsPageState();
}

class _AdvertisingChannelsPageState extends State<AdvertisingChannelsPage> {
  RequestAdvertiseController requestAdvertiseController=Get.find();
   @override
  void initState() {
    // TODO: implement initState
     print("sss= "+requestAdvertiseController.showInPlatform.value.toString());
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
     print("width: "+MediaQuery.of(context).size.width.toString() + "height: "+MediaQuery.of(context).size.height.toString() );
    return Container(
      child: ListView(
        controller: this.widget.scrollController,
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
                  'اختر من قنوات الاعلان',
                  style: TextStyle(
                      color: AppColors.adVertiserPageDataColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Obx(()=>requestAdvertiseController.isLoadingTypes.value?Container(
                child:const SpinKitThreeBounce(color: Colors.blue, size: 25,) ,
              ):GridView.builder(
                padding: EdgeInsets.only(right: 70.0, left: 70.0, bottom: 20.0),
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                itemCount: requestAdvertiseController.channels.length??0,
                gridDelegate:MediaQuery.of(context).size.width>700?
                const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                 //childAspectRatio: 100 / 150,
                  height: 65.0,
                  crossAxisSpacing: 100,
                  mainAxisSpacing: 40,
                  crossAxisCount: 4,
                ):const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
    //childAspectRatio: 100 / 150,
    height: 65.0,
    crossAxisSpacing: 20,
    mainAxisSpacing: 40,
    crossAxisCount: 3,
    ),
                itemBuilder: (context, index) => Obx(()=>InkWell(
                  onTap: () => requestAdvertiseController.changeTabIndex(index, true),
                  child: Container(
                    //margin: const EdgeInsets.all(15.0),
                    // padding: const EdgeInsets.all(3.0),
                    decoration: requestAdvertiseController.channels[index].isTapped!=null && requestAdvertiseController.channels[index].isTapped.isTrue
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
                       margin: EdgeInsets.all(4.0),
                      //padding: EdgeInsets.all(2),
                      child: /*requestAdvertiseController.channels.value[index].image!=null&& *//*requestAdvertiseController.channels.value[index].image!.isNotEmpty?*/
                      CachedNetworkImage(
                        imageUrl: requestAdvertiseController.channels.value[index].image??
                            '',
                        placeholder: (context, url) =>
                        const SpinKitThreeBounce(
                          color: Colors.grey,
                          size: 25,
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        fit: BoxFit.fill,
                        height: 40.0,
                        width: 40.0,
                      )/*:Image.asset(
                        requestAdvertiseController.images[index],
                        fit: BoxFit.cover,
                        height: 50.0,
                        width: 30.0,
                      )*/,
                    ),
                  ),
                ),)
              )),
              const SizedBox(
                height: 5,
              ),
              Obx(()=>InkWell(
                onTap: (){
                  requestAdvertiseController.switchShowInPlatform();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      requestAdvertiseController.showInPlatform.isTrue?Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: selectedBigCheckBox(),
                      ) : Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: unSelectedBigCheckBox(),
                      ),
                      // controller.showInPlatform! ? selectedBigCheckBox() : unSelectedBigCheckBox(),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("العرض في منصة ( المعلنين )",style: TextStyle(fontSize: 15,color:const Color(0xff041D67)),)
                    ],
                  ),
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0),
                    child: InkWell(
                      onTap: ()=> requestAdvertiseController.onSaveChannelsClicked(context),
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
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 15.0),
                    child: InkWell(
                      onTap: (){
                        requestAdvertiseController
                            .isChannelSaveClicked.value = false;
                        Get.back();
                      },
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
                            'إستعادة',
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(requestAdvertiseController.isChannelSaveClicked.isFalse){
      requestAdvertiseController.channelsIds = [];
      requestAdvertiseController.showInPlatform.value = false;
      requestAdvertiseController.channels.forEach((element) {
        if(element.isTapped!=null) {
          element.isTapped.value = false;
        }
      });
    }
    super.dispose();
  }
}
