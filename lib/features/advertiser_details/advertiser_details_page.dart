import 'dart:io';

import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_details/sheets/address_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_channels_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_desc_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/attatchements_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/discount_coupon_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/discount_coupon_sheet_advertising_details.dart';
import 'package:advertisers/features/advertiser_details/sheets/notice_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_details/widgets/channel_single_item.dart';
import 'package:advertisers/features/advertiser_details/widgets/item.dart';
import 'package:advertisers/features/advertiser_details/widgets/title.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertiserDetailsPage extends StatefulWidget {
  const AdvertiserDetailsPage({Key? key}) : super(key: key);

  @override
  _AdvertiserDetailsPageState createState() => _AdvertiserDetailsPageState();
}

class _AdvertiserDetailsPageState extends State<AdvertiserDetailsPage> {

  final AdvertisingDetailsController controller =
  Get.put(AdvertisingDetailsController());
  // final AddressBottomSheetAdvertiserDetailsPageController addressBottomSheetAdvertiserDetailsPageController =
  // Get.put(AddressBottomSheetAdvertiserDetailsPageController());

  launchURL(urlLink) async {
    var url = urlLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
/*    // TODO: implement initState
    controller.descController = TextEditingController(
        text: "- تغطية افتتاح الفرع الثالث من فروعنا");

    controller.placeAddressController = TextEditingController(
        text: "شارع الملز الرياض بجوار مدينة السلام");

    controller.noticsController = TextEditingController(
        text: "------------------------------------------- -");*/
    super.initState();
  }
  final List<String> _productType = [
    'منتجات مواد غذائية - حلويات وشكولاتة',
    'منتجات مواد غذائية - حلويات وشكولاتة',
    'منتجات مواد غذائية - حلويات وشكولاتة',
    'منتجات مواد غذائية - حلويات وشكولاتة'
  ];
  String _selectedProductTyp = '';

  final List<String> _percentages = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100',
  ];
  String _selectedMenPercentage = '';
  String _selectedWomenPercentage = '';
  String _selectedBoysPercentage = '';
  String _selectedGirlsPercentage = '';

  Country? _selectedCountry;
  City? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
      ),
      body:Container(
        child: ListView(
          children: [
            const AddAdvertiserDetailsTitle(),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                color: const Color(0xff4184CE),
                strokeCap: StrokeCap.butt,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 102.w,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 11,
                        ),
                        color: const Color(0xfff5f5f5),
                        child: Text(
                          "نوع المنتج",
                          style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Obx(()=> controller.isLoadingTypes.value?Container(
                          child: const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 25,
                          ),
                        )
                            :controller.categories.isNotEmpty?DropdownSearch<CategoryModel>(
                            mode: Mode.MENU,
                            dropDownButton: Container(
                              margin: EdgeInsets.only(left: 0.0),
                              child: SvgPicture.asset(
                                'images/dropdown_icon.svg',
                                fit: BoxFit.fill,
                                height: 8.0,
                                width: 8.0,
                              ),
                            ),

                            dropdownSearchDecoration: InputDecoration(
                              // filled: true,
                              //fillColor: Color(0xFFF2F2F2),
                              contentPadding:
                              EdgeInsets.only(right: 20.0, top: 0.0, bottom: 0.0),
                              border: InputBorder.none,
                            ),
                            items: controller.categories.value,
                            dropdownBuilder: (BuildContext context, s) {
                              return Text(
                                '${(s?.name ?? '')}',
                                style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                                textAlign: TextAlign.start,
                              );
                            },
                            // label: "Menu mode",
                            itemAsString: (CategoryModel? u) =>
                            u?.itemAsStringByName() ?? '',
                            onChanged: (categoryModel){
                              if(categoryModel!.id!=-1) {
                                controller.categoryId =
                                categoryModel.id!;
                              }
                            },
                            selectedItem: controller.selectedCategory.value.id!=null?controller.selectedCategory.value:controller.categories.value[0]
                        ): Container(
                            alignment: Alignment.centerRight,
                            child: const Text("لا يوجد منتجات")))/*DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            icon: SvgPicture.asset('images/dropdown_icon.svg'),
                            hint: _selectedProductTyp.isNotEmpty
                                ? Center(
                                child: Text(
                                  _selectedProductTyp,
                                  style: TextStyle(fontSize: 12.sp),
                                ))
                                : const Center(
                              child: Text(
                                'منتجات مواد غذائية - حلويات وشكولاتة',
                                style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                              ),
                            ),
                            items: _productType.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              );
                            }).toList(),
                            // value: _selectedLocation,
                            // isDense: true,
                            isExpanded: true,
                            onChanged: (newVal) {
                              setState(() {
                                _selectedProductTyp = newVal!;
                              });
                            },
                          )*/,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                color: const Color(0xff4184CE),
                strokeCap: StrokeCap.butt,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 102.w,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 11,
                        ),
                        color: const Color(0xfff5f5f5),
                        child: Text(
                          "نوع الاعلان",
                          style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Obx(()=>controller.isLoadingTypes.value?Container(
                          child: const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 25,
                          ),
                        )
                            :controller.ads_types.isNotEmpty?DropdownSearch<AdTypeModel>(
                          mode: Mode.MENU,
                          //showSelectedItem: true,
                          dropDownButton: Container(
                            margin: EdgeInsets.only(left: 0.0),
                            child: SvgPicture.asset(
                              'images/dropdown_icon.svg',
                              fit: BoxFit.fill,
                              height: 8.0,
                              width: 8.0,
                            ),
                          ),
                          dropdownSearchDecoration: InputDecoration(
                            labelStyle: TextStyle(color: Color(0xff041D67),fontSize: 13),
                            // filled: true,
                            //fillColor: Color(0xFFF2F2F2),
                            contentPadding:
                            EdgeInsets.only(right: 20.0, top: 0.0, bottom: 0.0),
                            border: InputBorder.none,
                            /*focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.borderDropDownColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColors.borderDropDownColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),*/
                          ),
                          items: controller.ads_types.value,
                          dropdownBuilder: (BuildContext context, s) {
                            return Text(
                              '${(s?.name ?? '')}',
                              style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                              textAlign: TextAlign.start,
                            );
                          },
                          // label: "Menu mode",
                          itemAsString: (AdTypeModel? u) =>
                          u?.itemAsStringByName() ?? '',
                          onChanged: (adTypeModel){
                            if(adTypeModel!.id!=-1) {
                              controller.adTypeId = adTypeModel.id!;
                            }
                          },
                          selectedItem: controller.selectedAdType.value.id!=null?controller.selectedAdType.value:controller.ads_types.value[0],

                        ): Container(
                            alignment: Alignment.centerRight,
                            child: const Text("لا يوجد اعلانات")))/*DropdownButton<String>(
                            underline: const SizedBox.shrink(),
                            icon: SvgPicture.asset('images/dropdown_icon.svg'),
                            hint: _selectedProductTyp.isNotEmpty
                                ? Container(
                                child: Text(
                                  _selectedProductTyp,
                                  style: TextStyle(fontSize: 12.sp),
                                ))
                                :  Container(
                              child: Text(
                                'تغطية افتتاح مع الحضور',
                                style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                              ),
                            ),
                            items: _productType.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              );
                            }).toList(),
                            // value: _selectedLocation,
                            // isDense: true,
                            isExpanded: true,
                            onChanged: (newVal) {
                              setState(() {
                                _selectedProductTyp = newVal!;
                              });
                            },
                          )*/,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                color: const Color(0xff4184CE),
                strokeCap: StrokeCap.butt,
                child: InkWell(
                  onTap: (){
                    showBottomSheetForRequest(context,1);

                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 110.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 11,
                          ),
                          color: const Color(0xfff5f5f5),
                          child: Text(
                            'تاريخ الاعلان',
                            style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(child: Obx(()=>Text('${controller.dateRange.value.fromDate!=null && controller.dateRange.value.fromDate!.isNotEmpty?controller.dateRange.value.fromDate:controller.requestDetailsModel.value.started_at??''} : ${controller.dateRange.value.toDate!=null && controller.dateRange.value.toDate!.isNotEmpty?controller.dateRange.value.toDate:controller.requestDetailsModel.value.ended_at??''}', style: TextStyle(color: Color(0xff041D67)),),
                              )
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                height: 30,
                                width: 2,
                                color: Colors.grey[400],
                              ),
                              Obx(()=>Text('${controller.selectedTimeCounter}', style: TextStyle(color: Color(0xff041D67)),),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(15),
                color: const Color(0xff4184CE),
                strokeCap: StrokeCap.butt,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: InkWell(
                        onTap: (){

                          showBottomSheetForRequest(context,2);
                          /*void _modalBottomSheetMenu(){
                              showModalBottomSheet(

                                // isScrollControlled: true,
                                  context: context,
                                  builder: (builder,){
                                    return AdvertisingChannelsPage(
                                     // scrollController: ,
                                    );
                                  }
                              );
                            }
                            _modalBottomSheetMenu();*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 110.w,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 11,
                          ),
                          color: const Color(0xfff5f5f5),
                          child: Text(
                            'قنوات الاعلان',
                            style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     ChannelSingleItem(
                      //       onTap: (){},
                      //       imgUrl: 'images/snapshat_icon.png',
                      //     ),
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //     ChannelSingleItem(
                      //       onTap: (){},
                      //       imgUrl: 'images/youtube.png',
                      //     ),
                      //
                      //     const SizedBox(
                      //       width: 15,
                      //     ),
                      //
                      //     ChannelSingleItem(
                      //       onTap: (){},
                      //       imgUrl:   'images/whatsup.png',
                      //     ),
                      //
                      //   ],
                      // ),
                      Container(
                        height: 50,
                        child: Center(
                          child: Obx(()=>ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.channelsForList.value.length??0,
                              itemBuilder: (context, index) {
                                return /*controller.checkList!.contains( controller.requestDetailsModel.value.channels![index].id)?*/
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: ChannelSingleItem(
                                      onTap: (){
                                        controller.addRemoveCheckList( controller.channelsForList[index].id);
                                      },
                                      imgUrl: "${ controller.channelsForList.value[index].image}",
                                    ),
                                  )/*:const SizedBox()*/;
                              })),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Item(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (builder){
                      return AdvertisingDescriptionPage();
                      // return AdvertisingNoticsPage();
                    }
                );
              },
              title: 'وصف الاعلان',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(()=>Text('${controller.decriptionText.value??''}',style: TextStyle(color: Color(0xff041D67)),)),
                  ),
                ],
              ),
            ),
            Item(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    // isScrollControlled: true,
                    builder: (builder){
                      return AttatchementPage();
                      // return AdvertisingNoticsPage();
                    }
                );
              },
              title: 'المرفقات',
              child: Container(
                height: 100.w,

                child: controller.attachedImagesList.isNotEmpty ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(4.0),
                  // physics: const BouncingScrollPhysics(),
                  itemCount: controller.attachedImagesList.length,
                  itemBuilder: (_, index) => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: controller.attachedImagesList[index].isVideo == 0 ? Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Image.file(
                            File(controller.attachedImagesList[index].file!.path),
                            width: 80.w,
                            height: 80.w,
                            fit: BoxFit.fill,
                          ),
                        ):VideoApp(
                          file: File(controller.attachedImagesList[index].file!.path),
                        ),
                      ),
                      Positioned(
                          left: 0,
                          child: InkWell(
                            onTap: (){
                              controller.deleteFromAttachedImagesList(controller.attachedImagesList[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.red,
                                ),
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 12.sp,
                              ),
                            ),
                          ))
                    ],
                  ),
                ):const Center(
                  child:  Text("لا توجد مرفقات"),
                ),
              ),
            ),
            Item(
              onTap: (){
                showBottomSheetForRequest(context,3);
              },
              title: 'الروابط',
              child: Obx(()=>controller.urlList.value.length>0?ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.urlList.value.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  margin: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 4),
                                    child: Row(
                                      children: [
                                        Text('${index + 1}'),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          height: 30,
                                          width: 2,
                                          color: Colors.grey[300],
                                        ),
                                        Text('${controller.urlList.value[index].name}',style: TextStyle(color: Color(0xff041D67)),),
                                      ],
                                    ),
                                  ),
                                )),
                            Positioned(
                                left: 0,
                                child: InkWell(
                                  onTap: (){
                                    controller.removeFromUrlList(controller.urlList.value[index]);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 12.sp,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          top: 1,
                          bottom: 10,
                          left: 12,
                          right: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child:  Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
                          child: Text('${controller.urlList.value[index].link}',style: TextStyle(color: Color(0xff041D67)),),
                        ),
                      ),
                    ],
                  );
                },
              ):Container(
                height: 100.w,
                child: const Center(
                  child:  Text("لا توجد روابط"),
                ),
              ),

            )),
            Item(
              onTap: (){
                showBottomSheetForRequest(context,4);
                /*showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (builder){
                      return AddressBottomSheetAdvertiserDetailsPage();
                    }
                );*/
              },
              title: 'العنوان',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>controller.locationModel.value.address!=null && controller.locationModel.value.address!.isNotEmpty?Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 4),
                            child: Row(
                              children:  [
                                const  Icon(Icons.add_location),
                                const  SizedBox(
                                  width: 15,
                                ),
                                Text('${controller.placeAddressController.text}',style: TextStyle(color:Color(0xff041D67)),),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: (){
                            controller.locationModel.value = LocationModel();
                            //controller.placeAddressController.clear();
                            //controller.setStateBehavior();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.red,
                              ),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 12.sp,
                            ),
                          ),
                        ))
                  ],
                ):Container(
                  //height: 100.w,
                  child: const Center(
                    child:  Text("اختر عنوان"),
                  ),
                )),
              ),
            ),
            Item(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (builder){
                      return DiscountCouponSheetAdvertisingDetails();
                    }
                );

              },
              title: 'كوبون المعلن',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(1),
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: controller.hasSelectedImage ?
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(controller.selectedImage.path),
                                      fit: BoxFit.fill,
                                      height: 60.h,
                                      width: 60.h,
                                    )):Container(),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('${controller.couponNameController.text}',style: TextStyle(color:Color(0xff041D67))),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    controller.endAdvertisingDateCoupon != null ? Text('الانتهاء في ${controller.endAdvertisingDateCoupon}',style: TextStyle(color:Color(0xff041D67))):Container(),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                        onTap: (){
                                          launchURL("${controller.storeUrlController.text}");
                                        },
                                        child: Text('${controller.storeUrlController.text}',style: TextStyle(color:Color(0xff041D67)))),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  controller.couponNumberController.text != "" ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: (){

                                        Clipboard.setData(new ClipboardData(text: controller.couponNumberController.text)).then((_){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم نسخ الكود")));
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              color: Colors.transparent,
                                              child: Text('${controller.couponNumberController.text}')),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.brown[200],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Colors.brown[200]!,
                                                ),
                                              ),
                                              child: Text('${controller.selectedDiscountPercentage}')),
                                        ],
                                      ),
                                    ),
                                  ):Container(),
                                  controller.numberOfUseController.text != "" ? Row(
                                    children: [
                                      Text(
                                        '${controller.numberOfUseController.text} كوبون',
                                        style: TextStyle(fontSize: 10.sp,color: Color(0xff041D67)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          border: Border.all(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          child: Image.network(
                                            'https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg',
                                            height: 30.w,
                                            width: 30.w,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ):Container(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: InkWell(
                        onTap: (){
                          controller.deleteCoupon();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Item(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (builder){
                      return AdvertisingNoticsPage();
                    }
                );
              },
              title: 'ملحوظة',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(
                            //   color: Colors.blue,
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${/*controller.noticsController.text??*/''}',style: TextStyle(color: Color(0xff041D67)),),
                                ),
                              ],
                            ),
                          ),
                        )),
                    // Positioned(
                    //     left: 0,
                    //     child: Container(
                    //       padding: const EdgeInsets.all(1),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(100),
                    //         border: Border.all(
                    //           color: Colors.red,
                    //         ),
                    //       ),
                    //       child: Icon(
                    //         Icons.close,
                    //         color: Colors.red,
                    //         size: 12.sp,
                    //       ),
                    //     ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 45,
                  left: 35,
                  right: 35,
                  top: 5
              ),
              child: Row(
                children: [
                  Expanded(child: InkWell(onTap: (){

                  },
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffE8E8E8),
                      ),
                    ),)),

                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: InkWell(onTap: (){
                          controller.resetClicked(context);
                  },
                    child: Container(
                      height: 40,
                      child: Center(
                        child: Text("استعاده",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff4391D4),

                      ),
                    ),)) ,
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )

      /*GetBuilder<AdvertisingDetailsController>(
        init: AdvertisingDetailsController(),
        builder: (controller) => ,
      )*/
      ,
    );
  }

  void showBottomSheetForRequest(BuildContext context,int bottomNumber){
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
          //maxChildSize: 0.9,
          initialChildSize: bottomNumber==6?0.84:0.67,
          expand: false,
          builder: (context, scrollController) {
            if(bottomNumber==1){
              return AdvertisingDatePage(
                  scrollController: scrollController
              );
            }
            else if(bottomNumber==2) {
              return AdvertisingChannelsPage(
                  scrollController: scrollController
              );
              /* return LocationRangeBottomSheet(
                    scrollController: scrollController);
*/
            } else if(bottomNumber==3) {
              return UrlsPage(
                  scrollController: scrollController
              );
              /* return LocationRangeBottomSheet(
                    scrollController: scrollController);
*/
            } /*else if(bottomNumber==3)*/ {
              return AddressBottomSheet(
                  scrollController: scrollController
              );
              /* return LocationRangeBottomSheet(
                    scrollController: scrollController);
*/
            }/*else if(bottomNumber==3){
              return AttatchementPage(
                  scrollController: scrollController);
            }else if(bottomNumber==4){
              return UrlsPage(
                  scrollController: scrollController);
            }else if(bottomNumber==5){
              return AddressBottomSheet(
                  scrollController: scrollController);
            }else if(bottomNumber==6){
              return DiscountCouponSheet(
                  scrollController: scrollController);
            }else if(bottomNumber==7){
              return NoticeSheet(
                  scrollController: scrollController);
            }else{
              return FilterOrderAdvertisersSheet(
                  scrollController: scrollController
              );
            }*/
          },
        );
      },
    );
    /*showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
       // expand: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
       // clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return AttatchementPage(
                  scrollController: scrollController);
            },
          )
        ),
      );*/

/*      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        //barrierColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) =>  BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,
            initialChildSize: 0.67,
           // expand: true,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          )),
      );*/

    /* showModalBottomSheet(
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
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          );
        },
      );*/
  }
}

class Country {
  final int id;
  final String name;
  final List<City> cities;

  Country(this.id, this.name, this.cities);

  static final List<Country> countries = [
    Country(
      1,
      'مصر',
      [
        City(1, 'المنصورة'),
        City(2, 'القاهرة'),
        City(3, 'اﻷسكندرية'),
      ],
    ),
    Country(
      2,
      'السعودية',
      [
        City(1, 'مكة'),
        City(2, 'الرياض'),
        City(3, 'المدينة'),
      ],
    ),
  ];
}

class City {
  final int id;
  final String name;

  City(this.id, this.name);
}
