import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/find_order_advertisers_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterOrderAdvertisersSheet extends StatelessWidget {
  ScrollController? scrollController;

  FilterOrderAdvertisersSheet({Key? key, this.scrollController}) : super(key: key);
  FindOrderAdvertisersController findOrderAdvertisersController =
  Get.put(FindOrderAdvertisersController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: this.scrollController,
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
                        'فرز وترتيب المعلنين',
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
                        'عرض المعلنين بحسب',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 12),
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: /*findOrderAdvertisersController
                        .selectedUserLocations.isNotEmpty
                        ? */
                  Wrap(
                    direction: Axis.horizontal,
                    children: findOrderAdvertisersController.images
                        .map(
                          (value) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          color: value=='الاقدم' || value=='الاسرع ردا'
                              ? AppColors.filterAdvertiserColor
                              .withOpacity(.60)
                              : AppColors.bottomSheetTabColor,
                        ),
                        margin: EdgeInsets.only(left: 10, bottom: 10),
                        // height: 30,
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 16, right: 16),
                        child: Text(
                          value ?? '',
                          style: value=='الاقدم' || value=='الاسرع ردا'
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
                  /*: findOrderAdvertisersController.isLoadingLocation.value
                        ? Container(
                        alignment: Alignment.topCenter,
                        child: const CircularProgressIndicator(
                          color: AppColors.tabColor,
                        ))
                        : Container(
                        alignment: Alignment.center,
                        child: const Text('لا يوجد عناصر'))*/
                  ,
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
                        ' عرض المعلنين بحسب أقسام إعلانتهم',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
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
                          ?*/
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
                      items: findOrderAdvertisersController.sections,
                      // label: "Menu mode",
                      itemAsString: (String? u) => u!,
                      // hint: "الدولة",
                      //popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (country) {
                        //controller.country.value = country!;
                      },
                      selectedItem: findOrderAdvertisersController.sections[
                      0]) /*: Container(
                          alignment: Alignment.centerRight,
                          child: const Text("لا يوجد مناطق")),*/
              ),

//--------------------------  third section chips  عرض المعلنين بحسب عدد متابعيهم--------------------
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
                        ' عرض المعلنين بحسب عدد متابعيهم',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 5.0, right: 10.0, bottom: 8.0),
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
                                ?*/
                        DropdownSearch<String>(
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
                                '${(s ?? '')}',
                                style: TextStyle(
                                    color: AppColors.white,
                                    /*decoration: TextDecoration.underline,decorationThickness: 2,*/
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
                            items: findOrderAdvertisersController.images,
                            // label: "Menu mode",
                            itemAsString: (String? u) => u!,
                            // hint: "الدولة",
                            //popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (country) {
                              //controller.country.value = country!;
                            },
                            selectedItem: findOrderAdvertisersController
                                .socials[
                            0]) /*: Container(
                                alignment: Alignment.centerRight,
                                child: const Text("لا يوجد مناطق")),*/
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 5.0, bottom: 8.0),
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
                            ?*/
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
                                    /*decoration: TextDecoration.underline,decorationThickness: 2,*/
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
                            items: findOrderAdvertisersController.images,
                            // label: "Menu mode",
                            itemAsString: (String? u) => u!,
                            // hint: "الدولة",
                            //popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (country) {
                              //controller.country.value = country!;
                            },
                            selectedItem: findOrderAdvertisersController
                                .numbers[
                            0]) /*: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("لا يوجد مناطق")),*/
                    ),
                  )
                ],
              ),
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
                        'ترتيب المعلنين حسب نطاقاتهم الجغارفية',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 10.0, bottom: 8.0),
                        height: 35.0,
                       // width: 200,
                        child: /*Obx(
                                () => findOrderAdvertisersController
                                .isLoadingLocation.value ? Container(
                              child: const SpinKitThreeBounce(
                                color: Colors.blue,
                                size: 25,
                              ),
                            )
                                :controller.countries.isNotEmpty
                                ?*/
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
                            items: findOrderAdvertisersController.images,
                            // label: "Menu mode",
                            itemAsString: (String? u) => u!,
                            // hint: "الدولة",
                            //popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (country) {
                              //controller.country.value = country!;
                            },
                            selectedItem: findOrderAdvertisersController.countries[
                            0]) /*: Container(
                                alignment: Alignment.centerRight,
                                child: const Text("لا يوجد مناطق")),*/
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10.0, right: 20.0, bottom: 8.0),
                        height: 35.0,
                        //width: 200,
                        child: /*Obx(
                            () => findOrderAdvertisersController
                            .isLoadingLocation.value ? Container(
                          child: const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 25,
                          ),
                        )
                            :controller.countries.isNotEmpty
                            ?*/
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
                            items: findOrderAdvertisersController.images,
                            // label: "Menu mode",
                            itemAsString: (String? u) => u!,
                            // hint: "الدولة",
                            //popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (country) {
                              //controller.country.value = country!;
                            },
                            selectedItem: findOrderAdvertisersController.cities[
                            0]) /*: Container(
                            alignment: Alignment.centerRight,
                            child: const Text("لا يوجد مناطق")),*/
                    ),
                  ),
                ],
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
                  child: /*findOrderAdvertisersController
                        .selectedUserLocations.isNotEmpty
                        ? */
                  Wrap(
                    direction: Axis.horizontal,
                    children: findOrderAdvertisersController.selectedCities
                        .map(
                          (value) => Container(
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
                          value ?? '',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.0,
                          )
                             ,
                          // textAlign: TextAlign.center,
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
                  /*: findOrderAdvertisersController.isLoadingLocation.value
                        ? Container(
                        alignment: Alignment.topCenter,
                        child: const CircularProgressIndicator(
                          color: AppColors.tabColor,
                        ))
                        : Container(
                        alignment: Alignment.center,
                        child: const Text('لا يوجد عناصر'))*/
                  ,
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
                  style: TextStyle(
                      color: (AppColors.editProfileTextColorOpa)
                          .withOpacity(0.51),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
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
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(left: 0.0),
                        padding: EdgeInsets.only(left: 15.0,right: 25,top: 13,bottom: 15),
                        child: SvgPicture.asset(
                          'images/dropdown_icon.svg',
                          fit: BoxFit.fill,
                          height: 8.0,
                          width: 8.0,
                          color: AppColors.buttonDropDown,
                        ),
                      ),
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
                      hintText: 'ابجث باسم المعلن',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
