import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/GetAdsFilterForm.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersFromModel.dart';
import 'package:advertisers/features/find_advertise_page/find_advertise_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/FilterSortAdsController.dart';
import 'package:advertisers/features/home_page/controller/ads_page_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class FilterSortAdsSheet extends StatefulWidget {
  ScrollController? scrollController;

  FilterSortAdsSheet({Key? key, this.scrollController}) : super(key: key);

  @override
  State<FilterSortAdsSheet> createState() => _FilterSortAdsSheetState();
}

class _FilterSortAdsSheetState extends State<FilterSortAdsSheet> {

  AdsPageController findOrderAdvertisersController = Get.put(AdsPageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(findOrderAdvertisersController.isFilterSavedClicked.isFalse) {
      findOrderAdvertisersController.getAdsForm(context);
    }
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
                          'فرز وترتيب الاعلانات بحسب',
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
                          'عرض الاعلانات بحسب',
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
                    child: findOrderAdvertisersController
                        .advertisersTopRated.isNotEmpty
                        ?
                    Wrap(
                      direction: Axis.horizontal,
                      children: findOrderAdvertisersController.advertisersTopRated.value
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
                        : findOrderAdvertisersController.isLoadingGetAdvertisersFromModel.value
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
                          ' عرض الاعلانات بحسب أقسام إعلانتهم',
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
                        () => findOrderAdvertisersController
                        .isLoadingGetAdvertisersFromModel.value ? Container(
                      child: const SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 25,
                      ),
                    )
                        :findOrderAdvertisersController.getAdsFilterForm.value.types!=null && findOrderAdvertisersController.getAdsFilterForm.value.types!.isNotEmpty
                        ?
                    DropdownSearch<AdTypeModel>(
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
                        items: findOrderAdvertisersController.getAdsFilterForm.value.types,
                        // label: "Menu mode",
                        itemAsString: (AdTypeModel? u) => u?.itemAsStringByName()??'',
                        // hint: "الدولة",
                        //popupItemDisabled: (String s) => s.startsWith('I'),
                        onChanged: (category) {
                          //controller.country.value = country!;
                          findOrderAdvertisersController.selectedType.value = category!;
                        },
                        selectedItem: findOrderAdvertisersController.selectedType.value.id!=null?findOrderAdvertisersController.selectedType.value:findOrderAdvertisersController.getAdsFilterForm.value.types![
                        0]) : Container(
                        alignment: Alignment.centerRight,
                        child: const Text("لا يوجد بيانات")),
                  ),
                ),

//--------------------------  third section chips  عرض المعلنين بحسب عدد متابعيهم--------------------
               /* Divider(
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
                          ' عرض الاعلانات بحسب عدد متابعيهم',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),*/
                /*Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 5.0, right: 10.0, bottom: 8.0),
                        height: 35.0,
                        child: Obx(
                              () => findOrderAdvertisersController
                              .isLoadingGetAdvertisersFromModel.value ? Container(
                            child: const SpinKitThreeBounce(
                              color: Colors.blue,
                              size: 25,
                            ),
                          )
                              :findOrderAdvertisersController.advertisersFormModel.value.channels!=null && findOrderAdvertisersController.advertisersFormModel.value.channels!.isNotEmpty
                              ?
                          DropdownSearch<Channel>(
                              mode: Mode.MENU,
                              dropDownButton: Container(
                                margin: const EdgeInsets.only(left: 0.0),
                                child: SvgPicture.asset(
                                  'images/dropdown_icon.svg',
                                  fit: BoxFit.fill,
                                  height: 8.0,
                                  width: 8.0,
                                  color: AppColors.white,
                                ),
                              ),
                              dropdownBuilder: (BuildContext context, s) {
                                return Text(
                                  '${(s?.name ?? '')}',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      *//*decoration: TextDecoration.underline,decorationThickness: 2,*//*
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.start,
                                );
                              },
                              dropdownSearchDecoration:
                              const InputDecoration(
                                  filled: true,
                                  //fillColor: Color(0xFFF2F2F2),
                                  contentPadding: EdgeInsets.only(
                                      right: 15.0,
                                      top: 0.0,
                                      bottom: 0.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(12)),
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: AppColors
                                            .borderDropDownColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12)),
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: AppColors
                                            .borderDropDownColor),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12)),
                                    borderSide: BorderSide(
                                        width: 0.4,
                                        color: AppColors
                                            .borderDropDownColor),
                                  ),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  fillColor: AppColors.dropDownFill),
                              items: findOrderAdvertisersController.advertisersFormModel.value.channels,
                              // label: "Menu mode",
                              itemAsString: (Channel? u) => u!.name!,
                              // hint: "الدولة",
                              //popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (channel) {
                                //controller.country.value = country!;
                                findOrderAdvertisersController.selectedChannel.value = channel!;
                              },
                              selectedItem: findOrderAdvertisersController.selectedChannel.value!=null && findOrderAdvertisersController.selectedChannel.value.id!=null?findOrderAdvertisersController.selectedChannel.value:findOrderAdvertisersController.advertisersFormModel.value.channels![0]) : Container(
                              alignment: Alignment.centerRight,
                              child: const Text("لا يوجد قنوات")),
                        ),
                      ),),
                    Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 5.0, bottom: 8.0),
                          height: 35.0,
                          child: Obx(
                                () => findOrderAdvertisersController
                                .isLoadingGetAdvertisersFromModel.value ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                :findOrderAdvertisersController.advertisersFormModel.value.effect_slides!=null && findOrderAdvertisersController.advertisersFormModel.value.effect_slides!.isNotEmpty
                                ?
                            DropdownSearch<EffectSlidesModel>(
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
                                    s!.id==null || s.id==-1?'إختر':'${(s.count_to ?? '')}'+'-'+'${(s.count_from ?? '')}',
                                    style: TextStyle(
                                        color: AppColors.activitiesDropDown,
                                        *//*decoration: TextDecoration.underline,decorationThickness: 2,*//*
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.start,
                                  );
                                },
                                dropdownSearchDecoration:
                                const InputDecoration(
                                    filled: true,
                                    //fillColor: Color(0xFFF2F2F2),
                                    contentPadding: EdgeInsets.only(
                                        right: 20.0,
                                        top: 0.0,
                                        bottom: 0.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          const Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 0.4,
                                          color: AppColors
                                              .borderDropDownColor),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 0.4,
                                          color: AppColors
                                              .borderDropDownColor),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)),
                                      borderSide: BorderSide(
                                          width: 0.4,
                                          color: AppColors
                                              .borderDropDownColor),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    fillColor: Colors.white),
                                items: findOrderAdvertisersController.advertisersFormModel.value.effect_slides,
                                // label: "Menu mode",
                                itemAsString: (EffectSlidesModel? u) => u!.itemAsString(),
                                // hint: "الدولة",
                                //popupItemDisabled: (String s) => s.startsWith('I'),
                                onChanged: (effectSlidesModel) {
                                  //controller.country.value = country!;
                                  findOrderAdvertisersController.selectedEffectSlidesModel.value = effectSlidesModel!;
                                },
                                selectedItem: findOrderAdvertisersController.selectedEffectSlidesModel.value.id!=null? findOrderAdvertisersController.selectedEffectSlidesModel.value:findOrderAdvertisersController.advertisersFormModel.value.effect_slides![0]) : Container(
                                alignment: Alignment.centerRight,
                                child: const Text("لا يوجد شرائح")),
                          ),
                        ))
                  ],
                ),*/
//--------------------------  fourth section chips ترتيب المعلنين حسب نطاقاتهم الجغارفية--------------------
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
                          'ترتيب الاعلانات حسب نطاقاتهم الجغارفية',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Row(
                  //  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                        height: 35.0,
                        child: Obx(() => findOrderAdvertisersController
                            .isLoadingGetAdvertisersFromModel.value
                            ? Container(
                          child: const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 25,
                          ),
                        )
                            : DropdownSearch<Country>(
                            enabled: findOrderAdvertisersController
                                .isCountryEnabled.value,
                            mode: Mode.MENU,
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
                            items: findOrderAdvertisersController
                                .countriesForLocationSheet,
                            // label: "Menu mode",
                            itemAsString: (Country? u) =>
                            u?.itemAsStringByName() ?? '',
                            /*popupItemDisabled: (String s) => s.startsWith('I'),
                                    onChanged:  (String? s) => controller.addItem(s!),*/
                            onChanged: (c) {
                              findOrderAdvertisersController
                                  .changeCountry(c);
                              findOrderAdvertisersController.selectedCountry.value = c!;
                            },
                            selectedItem:
                            findOrderAdvertisersController.selectedCountry.value!=null &&  findOrderAdvertisersController.selectedCountry.value.id!=null? findOrderAdvertisersController.selectedCountry.value:findOrderAdvertisersController
                                .countriesForLocationSheet[0])),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                        height: 35.0,
                        child: Obx(() => findOrderAdvertisersController
                            .isLoadingGetAdvertisersFromModel.value
                            ? Container(
                          child: const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 25,
                          ),
                        )
                            : findOrderAdvertisersController
                            .areasForLocationSheet.isNotEmpty
                            ? DropdownSearch<Area>(
                            mode: Mode.MENU,
                            enabled:
                            findOrderAdvertisersController
                                .isAreaEnabled.value,
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
                            /*dropdownButtonBuilder: (BuildContext context){
                                       return Text('mm');
                                    },*/
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
                            items:
                            findOrderAdvertisersController
                                .areasForLocationSheet,
                            // label: "Menu mode",
                            itemAsString: (Area? u) =>
                            u?.itemAsStringByName() ?? '',
                            onChanged: (area) {
                              findOrderAdvertisersController
                                  .changeArea(area);
                              findOrderAdvertisersController.selectedArea.value = area!;
                            },
                            selectedItem:
                            findOrderAdvertisersController.selectedArea.value!=null &&  findOrderAdvertisersController.selectedArea.value.id!=null ?findOrderAdvertisersController.selectedArea.value :findOrderAdvertisersController
                                .areasForLocationSheet
                                .value[0])
                            : Container(
                            alignment: Alignment.centerRight,
                            child: Text("لا يوجد مناطق"))),
                      ),
                    ),
                  ],
                ),
                /*Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                          height: 35.0,
                         // width: 200,
                          child: Obx(
                                  () => findOrderAdvertisersController
                                  .isLoadingGetAdvertisersFromModel.value ? Container(
                                child: const SpinKitThreeBounce(
                                  color: Colors.blue,
                                  size: 25,
                                ),
                              )
                                  :findOrderAdvertisersController.advertisersFormModel.value.countries!=null && findOrderAdvertisersController.advertisersFormModel.value.countries!.isNotEmpty
                                  ?
                          DropdownSearch<Country>(
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
                                      *//*decoration: TextDecoration.underline,decorationThickness: 2,*//*
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
                              items: findOrderAdvertisersController.advertisersFormModel.value.countries,
                              // label: "Menu mode",
                              itemAsString: (Country? u) => u!.name!,
                              // hint: "الدولة",
                              //popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (country) {
                                //controller.country.value = country!;
                              },
                              selectedItem: findOrderAdvertisersController.advertisersFormModel.value.countries![
                              0]) : Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text("لا يوجد دول")),
                      ),
                    ),),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 20.0, bottom: 8.0),
                          height: 35.0,
                          //width: 200,
                          child: *//*Obx(
                              () => findOrderAdvertisersController
                              .isLoadingLocation.value ? Container(
                            child: const SpinKitThreeBounce(
                              color: Colors.blue,
                              size: 25,
                            ),
                          )
                              :controller.countries.isNotEmpty
                              ?*//*
                          DropdownSearch<String>(
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
                                  '${(s ?? '')}',
                                  style: TextStyle(
                                      color: AppColors.activitiesDropDown,
                                      *//*decoration: TextDecoration.underline,decorationThickness: 2,*//*
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
                              items: findOrderAdvertisersController.images,
                              // label: "Menu mode",
                              itemAsString: (String? u) => u!,
                              // hint: "الدولة",
                              //popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (country) {
                                //controller.country.value = country!;
                              },
                              selectedItem: findOrderAdvertisersController.cities[
                              0]) *//*: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("لا يوجد مناطق")),*//*
                      ),
                    ),
                  ],
                ),*/
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
                    child: Obx(()=>findOrderAdvertisersController
                        .selectedUserLocations.isNotEmpty
                        ?
                    Wrap(
                      direction: Axis.horizontal,
                      children: findOrderAdvertisersController.selectedUserLocations.value
                          .map(
                            (value) => InkWell(
                          onTap: (){
                            findOrderAdvertisersController.onSelectedLocationClicked(value!.id);
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
//--------------------------  fifth section chips ' ابجث بالقرب منك --------------------
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
                          'ابجث بالقرب منك',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
                Container(
                  width: Get.width,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14.0),
                    color: Color(0xff47CEDE).withOpacity(0.97),
                  ),
                  margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 12),
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Column(
                    //textDirection: TextDirection.rtl,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: RangeSlider(
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          labels: RangeLabels(
                            _startValue.round().toString(),
                            _endValue.round().toString(),
                          ),
                          values: RangeValues(_startValue, _endValue),
                          onChanged: (values) {
                            print("Values=${ values.start.toInt()}");
                            print("Values=${ values.end.toInt()}");
                            findOrderAdvertisersController.fromDistance = values.start.toInt();
                            findOrderAdvertisersController.toDistance = values.end.toInt();
                            setState(() {
                              _startValue = values.start;
                              _endValue = values.end;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16.0,right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(_startValue.round().toString(),),
                            Row(
                              children: [
                                Text( _endValue.round().toString(),),
                                SizedBox(width: 10.0,),
                                Text("كيلو")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),


//--------------------------  fifth section chips 'ابجث باسم المعلن--------------------
                Divider(
                  color: Colors.black54,
                  thickness: .5,
                  endIndent: 20,
                  indent: 20,
                ),
                Container(
                  height: 38,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                        top: const BorderSide(
                            color: AppColors.editProfileContainerColor,
                            width: 0.4),
                        bottom: const BorderSide(
                            color: AppColors.editProfileContainerColor,
                            width: 0.4),
                        left: const BorderSide(
                            color: AppColors.editProfileContainerColor,
                            width: 0.4),
                        right: BorderSide(
                            color: AppColors.editProfileContainerColor,
                            width: 0.4),
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(12.0)),
                      color: Colors.white),
                  child: TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    //controller: controller.kayanNameController,
                    //  enabled: controller.isEnabled.value,
                    controller: findOrderAdvertisersController.searchAdvertiserController,
                    style:  TextStyle(
                        color: AppColors.activitiesDropDown,
                        /*decoration: TextDecoration.underline,decorationThickness: 2,*/
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    /*style: TextStyle(
                        color: (AppColors.editProfileTextColorOpa)
                            .withOpacity(0.51),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),*/
                    onChanged: (s){
                      if(s.isEmpty){
                        findOrderAdvertisersController.type=null;
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 10.0, right: 14.0, bottom: 12.0),
                        // isCollapsed: true,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'images/search_icon.svg',
                          ),
                        ),
                        /*suffixIcon: Container(
                          margin: const EdgeInsets.only(left: 0.0),
                          padding: EdgeInsets.only(left: 5.0,right: 5,top: 13,bottom: 15),
                          child: SvgPicture.asset(
                            'images/dropdown_icon.svg',
                            fit: BoxFit.fill,
                            height: 8.0,
                            width: 8.0,
                            color: AppColors.buttonDropDown,
                          ),
                        ),*/
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                            color: AppColors.activitiesDropDown,
                            /*decoration: TextDecoration.underline,decorationThickness: 2,*/
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                        hintText: 'ابجث عن المحتوى الإعلانى باسم المعلن',
                        fillColor: Colors.white70),
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
                          onTap: () => findOrderAdvertisersController
                              .onDateClickedSaved(context),
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
                            findOrderAdvertisersController.onReturnClicked(context);
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
    if(findOrderAdvertisersController.isFilterSavedClicked.isFalse) {
      findOrderAdvertisersController.isLoadingGetAdvertisersFromModel.value =
      true;
      findOrderAdvertisersController.getAdsFilterForm.value =
          GetAdsFilterForm();
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
