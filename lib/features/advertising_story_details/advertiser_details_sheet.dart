import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserDetailsSheet extends StatefulWidget {
  ScrollController? scrollController;

  AdvertiserDetailsSheet({Key? key, this.scrollController}) : super(key: key);

  @override
  State<AdvertiserDetailsSheet> createState() => _AdvertiserDetailsSheetState();
}

class _AdvertiserDetailsSheetState extends State<AdvertiserDetailsSheet> {

  FindAdvertiseController findOrderAdvertisersController =Get.put(FindAdvertiseController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(findOrderAdvertisersController.isFilterSavedClicked.isFalse) {
      findOrderAdvertisersController.getAdvertisersForm(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.beginColor, AppColors.endColor],
        ),
        shape: BoxShape.rectangle,
        //color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
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
      ),*/
      child: ListView(
        controller: widget.scrollController,
        //physics:const AlwaysScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                //margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(8.0),
                color: AppColors.bottomSheetTabColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Image.asset(
                          'images/dropdown.png',
                          fit: BoxFit.fill,
                          height: 35.0,
                          width: 35.0,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Stack(
                    children: [

                    Container(
                      margin: EdgeInsets.only(left: 14.0,top: 10.0),
                      child: CircleAvatar(
                      radius: 25.0,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: CachedNetworkImageProvider(
                          "https://wallpapercave.com/wp/AYWg3iu.jpg",
                        ),
                      ),
                    ),
                      Positioned(
                        left:0.0,
                        child:
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: CachedNetworkImageProvider(
                          "https://wallpapercave.com/wp/AYWg3iu.jpg",
                        ),
                      ),)
                      ],
              ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 6.0,bottom: 8),
                            child: Text(
                              'محمد التونى',
                              style: TextStyle(
                                  color: AppColors.advertiseNameColor,
                                  fontSize: 24.0,
                                  fontFamily: 'DecoType-Regular',
                                  fontWeight: FontWeight.w400),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                                child: /*advertisersModel.is_liked !=
                                    null && *//*advertisersModel.is_liked!*//* true
                                    ?*/ false?SvgPicture.asset(
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
                                padding: /*advertisersModel.is_muted != null &&
                                    advertisersModel.is_muted!*/
    true
                                    ? EdgeInsets.only(left: 2.0, right: 2.0, bottom: 4.0)
                                    : EdgeInsets.only(left: 2.0, right: 2.0, bottom: 4.0),
                                child: InkWell(
                                  onTap: () {
                                    //blockedUsersController.removeBlockedUser(blockedUserModel.id!);
                                  },
                                  child: /*advertisersModel.is_muted !=
                                      null &&*/ /*advertisersModel.is_muted!*/ false
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
                                child: /*advertisersModel.chat != null &&*/
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
                  ],
                ),
              ),
              /*Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),*/

              //--------------------------  first section chips عرض المعلنين بحسب--------------------
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                          alignment: Alignment.topRight,
                          child: Text(
                            'تقييم المحتوى',
                            style: TextStyle(color: Color(0xff4184CE)),
                            textAlign: TextAlign.center,
                          ),),
                    ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 26,
                                    direction: Axis.horizontal,
                                    textDirection: TextDirection.ltr,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                    print(rating);
                                    },
                                    ),
                          )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'ابلاغ عن محتوى',
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20,top:2.0),
                        child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color:  Color(0xff486ac7),)),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'إظهار الاعلانات دائما فى المقدمة',
                          style: TextStyle(color: Color(0xff4184CE)),
                          textAlign: TextAlign.center,
                        ),),
                    ),
                    InkWell(
                      onTap: () {
                        /*if (controller.isChat.value) {
                          controller.isChat.value = false;
                        } else {
                          controller.isChat.value = true;
                        }*/
                      },
                      child: Container(
                        child: false
                            ? Container(
                          //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Image.asset(
                            'images/switch_icon_right.png',
                            scale: 2,
                            width: 45,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        )
                            : Container(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            //left: 10.0
                          ),
                          //margin: EdgeInsets.only(bottom: 10.0),
                          child: Image.asset(
                            'images/no_chat_left.png',
                            scale: 2,
                            width: 45,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'نبهنى بلإعلانات الجديدة',
                          style: TextStyle(color: Color(0xff4184CE)),
                          textAlign: TextAlign.center,
                        ),),
                    ),
                    InkWell(
                      onTap: () {
                        /*if (controller.isChat.value) {
                          controller.isChat.value = false;
                        } else {
                          controller.isChat.value = true;
                        }*/
                      },
                      child: Container(
                        child: true
                            ? Container(
                          //margin: EdgeInsets.only(left: 10.0,bottom: 10.0),
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Image.asset(
                            'images/switch_icon_right.png',
                            scale: 2,
                            width: 45,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        )
                            : Container(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            //left: 10.0
                          ),
                          //margin: EdgeInsets.only(bottom: 10.0),
                          child: Image.asset(
                            'images/no_chat_left.png',
                            scale: 2,
                            width: 45,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'حفظ فى المفضلة',
                          style: TextStyle(color: Color(0xff4184CE)),
                          textAlign: TextAlign.center,
                        ),),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20,top:2.0),
                        child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color:  Color(0xff486ac7),)),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 0.0,top: 10,left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 3,top: 0),
                        alignment: Alignment.topRight,
                        child: Text(
                          'شارك الملف التعريفى مع',
                          style: TextStyle(color: Color(0xff4184CE)),
                          textAlign: TextAlign.center,
                        ),),
                    ),
                    Directionality(textDirection: TextDirection.ltr, child: Container(
                      width: 35.0,
                      height: 35.0,
                      //padding: EdgeInsets.all(10),
                      /* decoration: new BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),*/
                      child: Image.asset(
                        'images/telegram.png',
                        height: 25,
                        width: 30,
                        fit: BoxFit.fill,
                        matchTextDirection: true,
                        //color: Colors.white,
                      ),
                    ),)

                  ],
                ),
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
    if(findOrderAdvertisersController.isFilterSavedClicked.isFalse) {
      findOrderAdvertisersController.isLoadingGetAdvertisersFromModel.value =
      true;
      findOrderAdvertisersController.advertisersFormModel.value =
          GetAdvertisersFromModel();
      findOrderAdvertisersController.advertisersTopRated.value = [];
      findOrderAdvertisersController.categories.value = [];
      findOrderAdvertisersController.selectedUserLocations.value = [];
      findOrderAdvertisersController.isAreaEnabled.value = true;
      findOrderAdvertisersController.isCountryEnabled.value = true;
      findOrderAdvertisersController.searchAdvertiserController.text = '';
      findOrderAdvertisersController.selectedEffectSlidesModel.value = EffectSlidesModel();
      findOrderAdvertisersController.selectedCountry.value = Country();
      findOrderAdvertisersController.selectedArea.value = Area();
      findOrderAdvertisersController.areasForLocationSheet.value = [];
    }
/*    RxList<Country> countriesForLocationSheet = <Country>[].obs;
    RxList<Area> areasForLocationSheet = <Area>[].obs;
    var countryForLocationSheet  = Country().obs;
    var areaForLocationSheet  = Area().obs;
    RxList<dynamic> selectedUserLocations = <dynamic>[].obs;
    var isFilterSavedClicked  = false.obs;
    var isAreaEnabled = true.obs;
    var isCountryEnabled = true.obs;*/
    super.dispose();
  }
}
