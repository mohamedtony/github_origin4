import 'package:advertisers/features/advertiser_settings_page/widgets/activities_sheet_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/attatchement_page_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActivitiesBottomSheet extends StatelessWidget {
  ScrollController? scrollController;

  ActivitiesBottomSheet({Key? key, this.scrollController}) : super(key: key);
  final ActivitiesSheetController controller =
      Get.put(ActivitiesSheetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        controller: this.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                //margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(4.0),
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
                        'النشاطات',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Image.asset(
                        'images/attatch_file_icon.png',
                        fit: BoxFit.fill,
                        height: 25.0,
                        width: 13.0,
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
                margin: EdgeInsets.all(10.0),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.isChecked == true
                        ? selectedRadio()
                        : unSelectedRadio(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6.0),
                      child: Text(
                        "تعديل",
                        style: TextStyle(fontSize: 16, color: Color(0xff244094),decoration: TextDecoration.underline,decorationThickness: 4),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(left: 14.0, right: 14.0),
                padding:
                    EdgeInsets.only(left: 14.0, right: 14.0, top: 6, bottom: 6),
                child: Text(
                  'دقة البيانات تساعد التاجر على الوصول اليك وتعطيك مصداقية اكبر لدلا عملائك',
                  style: TextStyle(color: AppColors.activitiesSheetTextColor),
                ),
                decoration: BoxDecoration(
                    color: AppColors.activitiesSheetTextBg,
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(left: 14.0, right: 14.0, top: 10.0),
                padding:
                    EdgeInsets.only(left: 14.0, right: 14.0, top: 6, bottom: 6),
                child: Text(
                  'اختر النشاطات التجارية التى ترغب أو انت متخصص فى الاعلان لها عادة',
                  style: TextStyle(
                      color:
                          AppColors.editProfileTextColorOpa.withOpacity(0.42)),
                ),
              ),
              Container(
                height: 42,
                margin: EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: AppColors.activitiesSheetRounded, width: 0.5),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
                        child: Text(
                          "اختر نشاطك",
                          style: TextStyle(
                              color: AppColors.activitiesDropDown.withOpacity(0.73),
                              fontWeight: FontWeight.w500, fontSize: 16.0),
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      color: Colors.grey.withOpacity(0.2),
                      width: 2,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 0.0, left: 16.0, right: 20.0, bottom: 0.0),
                        height: 45.0,
                        child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            dropDownButton: Container(
                              margin: EdgeInsets.only(left: 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black.withOpacity(0.32),
                              )
                            ),
                            /*dropdownButtonBuilder: (BuildContext context){
                               return Text('mm');
                            },*/
                            dropdownBuilder: (BuildContext context,s){
                              return Text('$s',style: TextStyle(color: AppColors.activitiesDropDown.withOpacity(0.73),decoration: TextDecoration.underline,decorationThickness: 2,fontSize: 16.0),textAlign: TextAlign.center,);
                            },
                            dropdownSearchDecoration: InputDecoration(
                              // filled: true,
                              //fillColor: Color(0xFFF2F2F2),
                              contentPadding: EdgeInsets.only(
                                  right: 20.0, top: 0.0, bottom: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(70.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(70.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(70.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            items: [
                              "كل النشاطات التجارية",
                              "كل النشاطات الخدمية",
                              "السيارات",
                              'الملابس والاكسسوارات',
                              'المواد الغذائية'
                            ],
                            // label: "Menu mode",
                            hint: "country in menu mode",
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged:  (String? s) => controller.addItem(s!),
                            selectedItem: 'كل النشاطات'.tr),

                      ),
                    ),
                  ],
                ),
              ),
              Obx(()=>Container(
                margin: EdgeInsets.only(right: 10.0,left: 10.0,top: 18),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: controller.realImages.isNotEmpty
                      ? Wrap(
                    direction: Axis.horizontal,
                    children: controller.realImages.value
                        .map((value) => Stack(
                          children: [
                            Container(
                      height: 35,
                      margin: EdgeInsets.only(left: 18.0,top: 8,bottom: 3),
                              child:
                              Chip(
                                elevation: 3.0,
                                shape: StadiumBorder(side: BorderSide(
                                    color: AppColors.activitiesSheetRounded,
                                    width: 0.5
                                )),
                                labelPadding: EdgeInsets.only(bottom: 4,left: 6,right: 6),
                                label: Container(
                                  //margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    value,
                                    style: TextStyle(color: AppColors.activitiesDropDown,fontSize: 16.0,),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                backgroundColor: AppColors.bottomSheetTabColor,
                              ),

                            ),
                            Positioned(
                              left: 6,
                              top:3,
                              child: InkWell(
                                onTap: (){
                                  controller.removeItem(value);
                                },
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle
                                        ,color: AppColors.bottomSheetTabColorRounded
                                    ),
                                    child: Icon(Icons.clear,color: AppColors.white,size: 18,)),
                              ),
                            )
                          ],
                        ))
                        .toList(),
                  )
                      : Container(
                    alignment: Alignment.center,
                    child:Text('لا يوجد عناصر')
                  ),
                ),
              ),),

              Container(
                margin: EdgeInsets.only(top: 24),
                child: Row(
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
