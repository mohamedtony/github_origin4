import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_channels_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_date_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_desc_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/discount_coupon_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/notice_sheet.dart';
import 'package:advertisers/features/advertiser_details/sheets/urls_bottom_sheet.dart';
import 'package:advertisers/features/advertiser_details/widgets/channel_single_item.dart';
import 'package:advertisers/features/advertiser_details/widgets/item.dart';
import 'package:advertisers/features/advertiser_details/widgets/title.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AdvertiserDetailsPage extends StatefulWidget {
  const AdvertiserDetailsPage({Key? key}) : super(key: key);

  @override
  _AdvertiserDetailsPageState createState() => _AdvertiserDetailsPageState();
}

class _AdvertiserDetailsPageState extends State<AdvertiserDetailsPage> {

  final AdvertisingDetailsController controller =
  Get.put(AdvertisingDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    controller.descController = TextEditingController(
        text: "- تغطية افتتاح الفرع الثالث من فروعنا");

    controller.noticsController = TextEditingController(
        text: "------------------------------------------- -");
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
      body:

      GetBuilder<AdvertisingDetailsController>(
        init: AdvertisingDetailsController(),
        builder: (controller) => Container(
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
                          child: DropdownButton<String>(
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
                          ),
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
                          child: DropdownButton<String>(
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
                          ),
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
                      showModalBottomSheet(
                          context: context,
                          builder: (builder){
                            return AdvertisingDatePage();
                          }
                      );

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
                                 Expanded(child: Text('${controller.dateRange!.fromDate} : ${controller.dateRange!.toDate}', style: TextStyle(color: Color(0xff041D67)),),),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                  height: 30,
                                  width: 2,
                                  color: Colors.grey[400],
                                ),
                                 Text('${controller.selectedTimeCounter}', style: TextStyle(color: Color(0xff041D67)),),
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
                            void _modalBottomSheetMenu(){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder){
                                    return AdvertisingChannelsPage();
                                  }
                              );
                            }
                            _modalBottomSheetMenu();
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
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: advertisingItems!.length,
                                itemBuilder: (context, index) {
                                  return controller.checkList!.contains(advertisingItems![index].id)?
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: ChannelSingleItem(
                                        onTap: (){
                                          controller.addRemoveCheckList(advertisingItems![index].id);
                                        },
                                        imgUrl: "${advertisingItems![index].imgUrl}",
                                      ),
                                    ):const SizedBox();
                                }),
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
                      child: Text('${controller.descController.text}',style: TextStyle(color: Color(0xff041D67)),),
                    ),
                  ],
                ),
              ),
              Item(
                onTap: (){

                },
                title: 'المرفقات',
                child: Container(
                  height: 100.w,
                  child: ListView(
                    padding: const EdgeInsets.all(4.0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Image.asset(
                                'images/snapshat_icon.png',
                                height: 80.w,
                                width: 80.w,
                              ),
                            ),
                          ),
                          Positioned(
                              left: 0,
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
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Image.asset(
                                'images/youtube.png',
                                height: 80.w,
                                width: 80.w,
                              ),
                            ),
                          ),
                          Positioned(
                              left: 0,
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
                              ))
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Image.asset(
                                'images/whatsup.png',
                                height: 80.w,
                                width: 80.w,
                              ),
                            ),
                          ),
                          Positioned(
                              left: 0,
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
                              ))
                        ],
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
                        return UrlsPage();
                        // return AdvertisingNoticsPage();
                      }
                  );
                },
                title: 'الروابط',
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller!.urlList!.length,
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
                                           Text('${controller.urlList![index]!.urlName}',style: TextStyle(color: Color(0xff041D67)),),
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  left: 0,
                                  child: InkWell(
                                    onTap: (){
                                      controller.removeFromUrlList(controller.urlList![index]);
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
                            child: Text('${controller.urlList![index]!.urlTitle}',style: TextStyle(color: Color(0xff041D67)),),
                          ),
                        ),
                      ],
                    );
                  },
                ),

              ),
              Item(
                onTap: (){

                },
                title: 'العنوان',
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              child: Row(
                                children: const [
                                  Icon(Icons.add_location),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('شارع الملز الرياض بجوار مدينة السلام',style: TextStyle(color:Color(0xff041D67)),),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          left: 0,
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
                          ))
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
                        return DiscountCouponSheet();
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
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'images/whatsup.png',
                                    height: 60.w,
                                    width: 60.w,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('خصم منتجات رمضان',style: TextStyle(color:Color(0xff041D67))),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('الانتهاء في 1/5/2021',style: TextStyle(color:Color(0xff041D67))),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('www.namshi.com',style: TextStyle(color:Color(0xff041D67))),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              color: Colors.transparent,
                                              child: Text('51469')),
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
                                              child: Text('% 15')),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '400 كوبون',
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
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
                                    child: Text('${controller.noticsController.text}',style: TextStyle(color: Color(0xff041D67)),),
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
        ),
      )
      ,
    );
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
