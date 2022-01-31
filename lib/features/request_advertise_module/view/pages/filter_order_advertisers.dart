import 'package:advertisers/features/client_setting_page/client_setting_page.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_page.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/address_bottom_sheet.dart';
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

class FilterOrderAdvertisers extends StatelessWidget {
  FilterOrderAdvertisers({Key? key,this.onSheetClicked}) : super(key: key);
  Function(int x)? onSheetClicked;
  FindOrderAdvertisersController findOrderAdvertisersController=Get.put(FindOrderAdvertisersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(165.0),
        child: Container(
          height: 145,
          child:  InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10.0, top: 35.0),
              child: SvgPicture.asset(
                "images/back_button.svg",
                height: 45,
                width: 45,
                // matchTextDirection: true,
              ),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.beginColor, AppColors.endColor],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(

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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 5,
                  endIndent: 150,
                  indent: 150,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 5,
                  endIndent: 170,
                  indent: 170,
                ),
                Divider(
                  color: AppColors.dividerBottom,
                  thickness: 4.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5.0,bottom: 3),
                        child: Text('عرض المعلنين بحسب',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 18),
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: /*findOrderAdvertisersController
                        .selectedUserLocations.isNotEmpty
                        ? */Wrap(
                      direction: Axis.horizontal,
                      children: findOrderAdvertisersController
                          .images
                          .map((value) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14.0),
                          color: true?AppColors
                              .filterAdvertiserColor.withOpacity(.60):AppColors.bottomSheetTabColor,
                        ),
                        margin: EdgeInsets.only(left: 10,bottom: 10),
                           // height: 30,
                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 16,right: 16),
                            child: Text(
                              value ?? '',
                              style: true?  TextStyle(
                                color: AppColors
                                    .white,
                                fontSize: 14.0,
                              ):TextStyle(
                                color: AppColors
                                    .activitiesDropDown,
                                fontSize: 14.0,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),/*Container(
                        height: 30,
                        margin: EdgeInsets.only(
                            left: 4.0, top: 8, bottom: 6),
                        child: Chip(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                          *//*shape: StadiumBorder(
                                  side: BorderSide(
                                      color: AppColors
                                          .activitiesSheetRounded,
                                      width: 0.5)),*//*
                          labelPadding: EdgeInsets.only(
                             bottom: 20),
                          label: Text(
                            value ?? '',
                            style: TextStyle(
                              color: AppColors
                                  .activitiesDropDown,
                              fontSize: 16.0,
                            ),
                           // textAlign: TextAlign.center,
                          ),
                          backgroundColor:
                          AppColors.bottomSheetTabColor,
                        ),
                      ),*/)
                          .toList(),
                    )
                        /*: findOrderAdvertisersController.isLoadingLocation.value
                        ? Container(
                        alignment: Alignment.topCenter,
                        child: const CircularProgressIndicator(
                          color: AppColors.tabColor,
                        ))
                        : Container(
                        alignment: Alignment.center,
                        child: const Text('لا يوجد عناصر'))*/,
                  ),
                ),
                Divider(
                  color: Colors.black54,
                  thickness: .5,
                  endIndent: 20,
                  indent: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 5.0,bottom: 3),
                        child: Text(' عرض المعلنين بحسب أقسام إعلانتهم',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 20.0, bottom: 8.0),
                    height: 35.0,
                    child: /*Obx(
                          () => findOrderAdvertisersController
                          .isLoadingLocation.value ? Container(
                        child: const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 25,
                        ),
                      )
                          :controller.countries.isNotEmpty
                          ?*/ DropdownSearch<String>(
                          mode: Mode.MENU,
                          dropDownButton: Container(
                            margin: const EdgeInsets.only(left: 0.0),
                            child: SvgPicture.asset(
                              'images/dropdown_icon.svg',
                              fit: BoxFit.fill,
                              height: 8.0,
                              width: 8.0,
                              color: AppColors.dropFilterColor,
                            ),
                          ),
                          dropdownBuilder: (BuildContext context, s) {
                            return Text(
                              '${(s ?? '')}',
                              style: TextStyle(
                                  color: AppColors.activitiesDropDown,
                                  /*decoration: TextDecoration.underline,decorationThickness: 2,*/
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.start,
                            );
                          },
                          dropdownSearchDecoration: const InputDecoration(
                             filled: true,
                            //fillColor: Color(0xFFF2F2F2),
                            contentPadding: EdgeInsets.only(
                                right: 20.0, top: 0.0, bottom: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(const Radius.circular(12)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),

                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            fillColor: Colors.white
                          ),
                          items: findOrderAdvertisersController.images,
                          // label: "Menu mode",
                          itemAsString: (String? u) => u!,
                          // hint: "الدولة",
                          //popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged: (country){
                            //controller.country.value = country!;
                          },
                          selectedItem: findOrderAdvertisersController.images[0]
                          )/*: Container(
                          alignment: Alignment.centerRight,
                          child: const Text("لا يوجد مناطق")),*/
                    ),
                Divider(
                  color: Colors.black54,
                  thickness: .5,
                  endIndent: 20,
                  indent: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 5.0,bottom: 3),
                        child: Text(' عرض المعلنين بحسب أقسام إعلانتهم',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 10.0, right: 20.0, bottom: 8.0),
                    height: 35.0,
                    child: /*Obx(
                          () => findOrderAdvertisersController
                          .isLoadingLocation.value ? Container(
                        child: const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 25,
                        ),
                      )
                          :controller.countries.isNotEmpty
                          ?*/ DropdownSearch<String>(
                        mode: Mode.MENU,
                        dropDownButton: Container(
                          margin: const EdgeInsets.only(left: 0.0),
                          child: SvgPicture.asset(
                            'images/dropdown_icon.svg',
                            fit: BoxFit.fill,
                            height: 8.0,
                            width: 8.0,
                            color: AppColors.dropFilterColor,
                          ),
                        ),
                        dropdownBuilder: (BuildContext context, s) {
                          return Text(
                            '${(s ?? '')}',
                            style: TextStyle(
                                color: AppColors.activitiesDropDown,
                                /*decoration: TextDecoration.underline,decorationThickness: 2,*/
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          );
                        },
                        dropdownSearchDecoration: const InputDecoration(
                            filled: true,
                            //fillColor: Color(0xFFF2F2F2),
                            contentPadding: EdgeInsets.only(
                                right: 20.0, top: 0.0, bottom: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(const Radius.circular(12)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),

                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  width: 0.4,
                                  color: AppColors.borderDropDownColor),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  width: 1,
                                )),
                            fillColor: Colors.white
                        ),
                        items: findOrderAdvertisersController.images,
                        // label: "Menu mode",
                        itemAsString: (String? u) => u!,
                        // hint: "الدولة",
                        //popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (country){
                          //controller.country.value = country!;
                        },
                        selectedItem: findOrderAdvertisersController.images[0]
                    )/*: Container(
                          alignment: Alignment.centerRight,
                          child: const Text("لا يوجد مناطق")),*/
                )//),
              ],
            ),
          ),
        ],
      ),
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
            }else if(bottomNumber==13){
              return AddressBottomSheet(
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
