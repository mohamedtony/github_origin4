
import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/GetAdsFilterForm.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/app_core/network/models/GetMyRequestsFilterForm.dart';
import 'package:advertisers/app_core/network/models/SelectedNotSelectedFilterAdsType.dart';
import 'package:advertisers/app_core/network/requests/GetGallaryRequestFilter.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/gallery/controller/gallery_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/FilterSortAdsController.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/features/notifications/controller/notifications_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class GallerySheet extends StatefulWidget {
  ScrollController? scrollController;

  String? type;
  GallerySheet({Key? key, this.scrollController,this.type}) : super(key: key);

  @override
  State<GallerySheet> createState() => _GallerySheetState();
}

class _GallerySheetState extends State<GallerySheet> {

  GalleryController galleryController = Get.put(GalleryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    galleryController.getAdsForm(context);
  }
  double _startValue = 20.0;
  double _endValue = 90.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      duration: const Duration(milliseconds: 500),
      curve:Curves.bounceIn,
      child: Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.0,
                        width: 180.0,
                        //padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'فرز وترتيب معرضى بحسب',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: AppColors.tabColor),
                      ),
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
                    ],
                  ),
                ),
                /*Divider(
                  color: AppColors.dividerBottom,
                  thickness: 4.0,
                ),*/

                //--------------------------  first section chips عرض المعلنين بحسب--------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.only(right: 10.0,top: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 5.0, bottom: 3,top: 16),
                        child: Text(
                          'عرض المعرض بحسب',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 12),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0xff21449F).withOpacity(0.25),
                  ),
                  child: Obx(()=>SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:  galleryController.advertisersTopRated.isNotEmpty?
                    Wrap(
                      direction: Axis.horizontal,
                      children: galleryController.advertisersTopRated.value
                          .map(
                            (value) => InkWell(
                          onTap: (){
                            if(value.isSelected.isTrue){
                              value.isSelected.value = false;
                            }else{
                              value.isSelected.value = true;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12.0),
                              color: value.isSelected.isTrue
                                  ? Color(0xffF5F5F5).withOpacity(0.40)
                                  : AppColors.bottomSheetTabColor,
                            ),
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            // height: 30,
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 16, right: 16),
                            child: Text(
                              value.name ?? '',
                              style: value.isSelected.isTrue
                                  ? TextStyle(
                                color: AppColors.white,
                                fontSize: 14.0,
                              )
                                  : TextStyle(
                                color: AppColors.activitiesDropDown,
                                fontSize: 14.0,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ), /*Container(
                          height: 30,
                          margin: EdgeInsets.only(
                              left: 4.0, top: 8, bottom: 6),
                          child: Chip(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                            */ /*shape: StadiumBorder(
                                    side: BorderSide(
                                        color: AppColors
                                            .activitiesSheetRounded,
                                        width: 0.5)),*/ /*
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
                        ),*/
                      )
                          .toList(),
                    )
                        : galleryController.isLoadingGetAdvertisersFromModel.value
                        ? Container(
                        alignment: Alignment.topCenter,
                        child: const CircularProgressIndicator(
                          color: AppColors.tabColor,
                        ))
                        : Container(
                        alignment: Alignment.center,
                        child: const Text('لا يوجد عناصر'))
                    ,
                  )),
                ),
                //--------------------------  second section chips عرض المعلنين بحسب أقسام إعلانتهم--------------------
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
                        margin: EdgeInsets.only(right: 5.0, bottom: 3),
                        child: Text(
                          'البحث بحسب اسم العميل',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                  height: 35.0,
                  child: Obx(
                        () => galleryController.isLoadingGetAdvertisersFromModel.isTrue
                        ? Container(
                      child: const SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 25,
                      ),
                    )
                        :galleryController.users!=null && galleryController.users.value.isNotEmpty
                        ?
                    DropdownSearch<SelectedNotSelectedFilterAdsType>(
                        mode: Mode.MENU,
                        dropDownButton: Container(
                          margin: const EdgeInsets.only(left: 0.0),
                          child: SvgPicture.asset(
                            'images/dropdown_icon.svg',
                            fit: BoxFit.fill,
                            height: 8.0,
                            width: 8.0,
                            color: AppColors.buttonDropDown,
                          ),
                        ),
                        dropdownBuilder: (BuildContext context, s) {
                          return Text(
                            '${(s?.name ?? '')}',
                            style: TextStyle(
                                color: AppColors.activitiesDropDown,
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
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(12)),
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
                            fillColor: Colors.white),
                        items: galleryController.users.value,
                        // label: "Menu mode",
                        itemAsString: (SelectedNotSelectedFilterAdsType? u) => u?.name??'',
                        // hint: "الدولة",
                        //popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (category) {
                          //controller.country.value = country!;
                          galleryController.selectedNotSelectedFilterAdsType.value = category!;
                        },
                        selectedItem: galleryController.selectedNotSelectedFilterAdsType.value!=null && galleryController.selectedNotSelectedFilterAdsType.value.key!=null?galleryController.selectedNotSelectedFilterAdsType.value:galleryController.users.value[0]

                    ) : Container(
                        alignment: Alignment.centerRight,
                        child: const Text("لا يوجد بيانات")),
                  ),
                ),
//--------------------------  second section chips عرض المعلنين بحسب أقسام إعلانتهم--------------------

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
                        margin: EdgeInsets.only(right: 5.0, bottom: 3),
                        child: Text(
                          'عرض محتوى المعرض بحسب النشاط/القسم',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                  height: 35.0,
                  child: Obx(
                        () => galleryController.isLoadingGetAdvertisersFromModel.isTrue
                        ? Container(
                      child: const SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 25,
                      ),
                    )
                        :galleryController.services!=null && galleryController.services.value.isNotEmpty
                        ?
                    DropdownSearch<CategoryModel>(
                        mode: Mode.MENU,
                        dropDownButton: Container(
                          margin: const EdgeInsets.only(left: 0.0),
                          child: SvgPicture.asset(
                            'images/dropdown_icon.svg',
                            fit: BoxFit.fill,
                            height: 8.0,
                            width: 8.0,
                            color: AppColors.buttonDropDown,
                          ),
                        ),
                        dropdownBuilder: (BuildContext context, s) {
                          return Text(
                            '${(s?.name ?? '')}',
                            style: TextStyle(
                                color: AppColors.activitiesDropDown,
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
                              borderRadius: BorderRadius.all(
                                  const Radius.circular(12)),
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
                            fillColor: Colors.white),
                        items: galleryController.services.value,
                        // label: "Menu mode",
                        itemAsString: (CategoryModel? u) => u?.name??'',
                        // hint: "الدولة",
                        //popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (category) {
                          //controller.country.value = country!;
                          galleryController.categorySelected.value = category!;
                          galleryController.addCategory(category);
                        },
                        selectedItem: galleryController.categorySelected.value!=null && galleryController.categorySelected.value.id!=null?galleryController.categorySelected.value:galleryController.services.value[0]

                    ) : Container(
                        alignment: Alignment.centerRight,
                        child: const Text("لا يوجد بيانات")),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14.0),
                    color: /*value=='الاقدم' || value=='الاسرع ردا'
                        ? AppColors.filterAdvertiserColor
                        .withOpacity(.60)
                        :*/ AppColors.white,
                  ),
                  margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 12),
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Obx(()=>galleryController
                        .selectedUserLocations.isNotEmpty
                        ?
                    Wrap(
                      direction: Axis.horizontal,
                      children: galleryController.selectedUserLocations.value
                          .map(
                            (value) => InkWell(
                          onTap: (){
                            if(value.id!=null) {
                              galleryController.onSelectedCategoriesClicked(
                                  value.id!);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              color:  AppColors.selectedCity
                              ,
                            ),
                            margin: EdgeInsets.only(left: 8, bottom: 5,top: 5),
                            // height: 30,
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 16, right: 16),
                            child: Text(
                              value?.name ?? '',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.0,
                              )
                              ,
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ), /*Container(
                          height: 30,
                          margin: EdgeInsets.only(
                              left: 4.0, top: 8, bottom: 6),
                          child: Chip(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                            */ /*shape: StadiumBorder(
                                    side: BorderSide(
                                        color: AppColors
                                            .activitiesSheetRounded,
                                        width: 0.5)),*/ /*
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
                        ),*/
                      )
                          .toList(),
                    )
                        : Container(
                        height: 40.0,
                        alignment: Alignment.center,
                        child: const Text('لا يوجد عناصر')))
                    ,
                  ),
                ),

//--------------------------  six section حفظ استعادة--------------------
                Divider(
                  color: Colors.black54,
                  thickness: .5,
                  endIndent: 20,
                  indent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 135,
                        height: 35,
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: InkWell(
                          onTap: () => galleryController.onDateClickedSaved(context),
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
                        margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: InkWell(

                          onTap: () {
                           galleryController.onReturnClicked(context);
                            // Get.back();
                          },
                          child: Material(
                            elevation: 6.0,
                            shadowColor: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.white,
                            child: Container(
                              /*margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20),*/
                              alignment: Alignment.center,
                              child: Text(
                                'إستعادة',
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(widget.type=="archive") {
      if(galleryController.isFilterSavedClicked.isFalse) {
        galleryController.isLoadingGetAdvertisersFromModel.value =
        true;
        galleryController.getMyRequestsFilterForm.value = GetGallaryRequestFilter();
        galleryController.advertisersTopRated.value = [];
        galleryController.selectedUserLocations.value = [];
        galleryController.isAreaEnabled.value = true;
        galleryController.isCountryEnabled.value = true;
        galleryController.users.value = [];
        galleryController.services.value = [];
      }
    }
    super.dispose();
  }
}
