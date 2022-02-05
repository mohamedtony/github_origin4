import 'package:advertisers/features/client_setting_page/client_setting_page.dart';
import 'package:advertisers/features/home_page/view/widgets/advertiser_person_item.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/attatchements_sheet.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/urls_bottom_sheet.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FindAdvertisePage extends StatelessWidget {
  FindAdvertisePage({Key? key,this.onSheetClicked}) : super(key: key);
  Function(int x)? onSheetClicked;
  RequestAdvertiseController requestAdvertiseController=Get.put(RequestAdvertiseController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    width: 250.0,
                    height: 44.0,
                    margin: EdgeInsets.only(top: 10.0, bottom: 7.0),
                    child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          bottomLeft: Radius.circular(22),
                        ),
                        child: Container(
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 20.0),
                                child: SvgPicture.asset(
                                  'images/advetrise_data_icon.svg',
                                  fit: BoxFit.fill,
                                  color: Colors.blue,
                                  height: 24.0,
                                  width: 30.0,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 16.0, bottom: 4.0, right: 40),
                                child: Text(
                                  'advertisingData'.tr,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: AppColors.searchAdsColor,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.beginSearchAds,
                                AppColors.endSearchAds
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                            ),
                          ),
                        )),
                  ),
                ),
                Container(
                  width: 250.0,
                  height: 46.0,
                  margin: EdgeInsets.only(top: 7.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: SvgPicture.asset(
                          'images/user.svg',
                          fit: BoxFit.cover,
                          height: 24.0,
                          width: 30.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16.0, bottom: 4.0, right: 40),
                        child: Text(
                          'findAdvertiser'.tr,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.beginColor, AppColors.endColor],
                    ),
                    shape: BoxShape.rectangle,
                    //color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
                    ),
                    boxShadow: [
                      // so here your custom shadow goes:
                      BoxShadow(
                          color: Colors.black.withAlpha(25),
                          // the color of a shadow, you can adjust it
                          spreadRadius: 2,
                          //also play with this two values to achieve your ideal result
                          blurRadius: 4.0,
                          offset: Offset(2,
                              1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: PhysicalModel(
                //borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle,
                color: Colors.blue,
                elevation: 6,
                shadowColor: Colors.grey,
                child: Container(
                  child: InkWell(
                    onTap: (){
                      //Get.toNamed("/FilterOrderAdvertisers");
                      onSheetClicked!(8);
                    },
                    child: Container(
                      width: 62,
                      height: 62,
                      margin: EdgeInsets.all(4),
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                          child: SvgPicture.asset(
                              'images/filter_edit.svg',
                              fit: BoxFit.fill,
                              //color: Colors.white,
                              height: 24.0,
                              width: 30.0,
                            ),
                          ),)
                      ,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.beginColor, AppColors.endColor],
                      ),
                    ),),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
        Expanded(
          child: ListView(
            children: [
              AdvertiserItem(),
              AdvertiserItem(),
              AdvertiserItem(),
              AdvertiserItem(),
              AdvertiserItem(),
              AdvertiserItem(),
              AdvertiserItem(),
            ],
          ),
        ),
        Container(
          //width: 135,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right:50.0, left: 50.0, top: 10.0,bottom: 10.0),
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
                'أرسل طلبك',
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
    );
  }

  void showMyBottomSheet(BuildContext context,int bottomNumber){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,

          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            if(bottomNumber==2) {
              return AdvertisingChannelsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else {
              return UrlsPage(
                  scrollController: scrollController);
            }
          },
        );
      },
    );
  }
}
