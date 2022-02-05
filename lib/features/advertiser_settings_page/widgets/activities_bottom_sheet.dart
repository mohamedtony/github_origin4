import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/features/advertiser_settings_page/controller/AdvertiserSettingPageController.dart';
import 'package:advertisers/features/advertiser_settings_page/widgets/activities_sheet_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/attatchement_page_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class ActivitiesBottomSheet extends StatelessWidget {
  ScrollController? scrollController;

  ActivitiesBottomSheet({Key? key, this.scrollController}) : super(key: key);
  final ActivitiesSheetController controller =
      Get.put(ActivitiesSheetController());

  final AdvertiserSettingPageController advertiserSettingPageController =
  Get.find();

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
                padding: const EdgeInsets.all(4.0),
                color: AppColors.bottomSheetTabColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0,
                      width: 140.0,
                      //padding: EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      child: const Text(
                        'النشاطات',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: SvgPicture.asset(
                        'images/list_bullet.svg',
                        fit: BoxFit.fill,
                        height: 25.0,
                        width: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.isChecked == true
                        ? selectedRadio()
                        : unSelectedRadio(),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6.0),
                      child: const Text(
                        "تعديل",
                        style: TextStyle(fontSize: 16, color: const Color(0xff244094),decoration: TextDecoration.underline,decorationThickness: 4),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.only(left: 14.0, right: 14.0),
                padding:
                    const EdgeInsets.only(left: 14.0, right: 14.0, top: 6, bottom: 6),
                child: const Text(
                  'دقة البيانات تساعد التاجر على الوصول اليك وتعطيك مصداقية اكبر لدلا عملائك',
                  style: const TextStyle(color: AppColors.activitiesSheetTextColor),
                ),
                decoration: BoxDecoration(
                    color: AppColors.activitiesSheetTextBg,
                    borderRadius: BorderRadius.circular(16.0)),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.only(left: 14.0, right: 14.0, top: 10.0),
                padding:
                    const EdgeInsets.only(left: 14.0, right: 14.0, top: 6, bottom: 6),
                child: Text(
                  'اختر النشاطات التجارية التى ترغب أو انت متخصص فى الاعلان لها عادة',
                  style: TextStyle(
                      color:
                          AppColors.editProfileTextColorOpa.withOpacity(0.42)),
                ),
              ),
              Container(
                height: 42,
                margin: const EdgeInsets.only(top: 10, left: 22.0, right: 22.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: AppColors.activitiesSheetRounded, width: 0.5),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
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
                        margin: const EdgeInsets.only(
                            top: 0.0, left: 16.0, right: 20.0, bottom: 0.0),
                        height: 45.0,
                        child: Obx(()=>advertiserSettingPageController.isLoading.value?Container(
                          child:const SpinKitThreeBounce(color: Colors.blue, size: 25,) ,
                        ):DropdownSearch<CategoryModel>(
                          mode: Mode.MENU,
                          loadingBuilder: (BuildContext context,s){
                            return const SpinKitThreeBounce(color: Colors.blue, size: 40,);
                          },
                          dropDownButton: Container(
                              margin: const EdgeInsets.only(left: 0.0),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black.withOpacity(0.32),
                              )
                          ),
                          /*dropdownButtonBuilder: (BuildContext context){
                               return Text('mm');
                            },*/
                          dropdownBuilder: (BuildContext context,s){
                            return Text('${s!=null?s.name:''}',style: TextStyle(color: AppColors.activitiesDropDown.withOpacity(0.73),decoration: TextDecoration.underline,decorationThickness: 2,fontSize: 16.0),textAlign: TextAlign.center,);
                          },
                          dropdownSearchDecoration: InputDecoration(
                            // filled: true,
                            //fillColor: Color(0xFFF2F2F2),
                            contentPadding: const EdgeInsets.only(
                                right: 20.0, top: 0.0, bottom: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          itemAsString: (CategoryModel? u) => u?.itemAsStringByName()??'',
                          items:advertiserSettingPageController.generalCategories.value,
                          // label: "Menu mode",
                          hint: "كل النشاطات",
                          // popupItemDisabled: (String s) => s.startsWith('I'),
                          onChanged:  (CategoryModel? s) => advertiserSettingPageController.addItem(s!),
                          selectedItem: advertiserSettingPageController.generalCategories.value[0]
                        )),

                      ),
                    ),
                  ],
                ),
              ),
              Obx(()=>Container(
                margin: const EdgeInsets.only(right: 10.0,left: 10.0,top: 18),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: advertiserSettingPageController.selectedCategories.isNotEmpty
                      ? Wrap(
                    direction: Axis.horizontal,
                    children: advertiserSettingPageController.selectedCategories
                        .map((value) => Stack(
                          children: [
                            Container(
                      height: 35,
                      margin: const EdgeInsets.only(left: 18.0,top: 8,bottom: 3),
                              child:
                              Chip(
                                elevation: 3.0,
                                shape: const StadiumBorder(side: BorderSide(
                                    color: AppColors.activitiesSheetRounded,
                                    width: 0.5
                                )),
                                labelPadding: const EdgeInsets.only(bottom: 4,left: 6,right: 6),
                                label: Container(
                                  //margin: EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    value.name??'',
                                    style: const TextStyle(color: AppColors.activitiesDropDown,fontSize: 16.0,),
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
                                  advertiserSettingPageController.removeItem(value.id!);
                                },
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle
                                        ,color: AppColors.bottomSheetTabColorRounded
                                    ),
                                    child: const Icon(Icons.clear,color: AppColors.white,size: 18,)),
                              ),
                            )
                          ],
                        ))
                        .toList(),
                  )
                      : advertiserSettingPageController.isLoading.value?Container(
                      alignment: Alignment.topCenter,
                      child:const CircularProgressIndicator(color: AppColors.tabColor,)
                  ):Container(
                      alignment: Alignment.center,
                      child:const Text('لا يوجد عناصر')
                  ),
                ),
              ),),

              InkWell(
                onTap: (){
                  advertiserSettingPageController.onUpdateUserCategories(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 135,
                        height: 35,
                        margin: const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.grey[200],
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: AppColors.saveButtonBottomSheet,
                          child: Container(
                            /*margin: EdgeInsets.only(
                                  left: 12.0, bottom: 4.0, right: 20),*/
                            alignment: Alignment.center,
                            child: Text(
                              'save'.tr,
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.tabColor,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 135,
                          height: 35,
                          margin: const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                          child: Material(
                            elevation: 6.0,
                            shadowColor: Colors.grey[200],
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            color: AppColors.tabColor,
                            child: Container(
                              /*margin: EdgeInsets.only(
                                    left: 12.0, bottom: 4.0, right: 20),*/
                              alignment: Alignment.center,
                              child: Text(
                                'cancel'.tr,
                                style: const TextStyle(
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
