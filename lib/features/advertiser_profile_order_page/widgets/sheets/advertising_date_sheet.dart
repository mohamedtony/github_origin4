import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_channels_sheet.dart';
import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:advertisers/features/request_advertise_module/view/widgets/date_picker.dart' as DateRangePicker;
//import 'date_picker.dart' as DateRangePicker;
// import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

DateFormat dateFormat = DateFormat("yyyy-MM-dd");

class AdvertisingDatePage extends StatefulWidget {
  ScrollController? scrollController;

  AdvertisingDatePage({Key? key, this.scrollController}) : super(key: key);

  @override
  State<AdvertisingDatePage> createState() => _AdvertisingDatePageState();
}

class _AdvertisingDatePageState extends State<AdvertisingDatePage> {
  AdvertiserProfileOrderController advertiserProfileController = Get.find();

  final List<String> _counterType = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
  ];

  // ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: widget.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                //margin: EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(8.0),
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
                        'تاريخ الاعلان',
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        "images/calender.png",
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (advertiserProfileController.isFlixble.isFalse) {
                        advertiserProfileController.isFixed.value = false;
                        advertiserProfileController.isFlixble.value = true;
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(left: 20.0),
                          child: Obx(() => Image.asset(
                                advertiserProfileController.isFlixble.isTrue
                                    ? "images/radio_clicked.png"
                                    : "images/not_radio_clicked.png",
                                height: 50,
                                width: 50,
                              )),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(bottom: 8.0, left: 30.0),
                          child: const Text(
                            'مرن',
                            style: TextStyle(
                                color: AppColors.adVertiserPageDataColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (advertiserProfileController.isFixed.isFalse) {
                        advertiserProfileController.isFixed.value = true;
                        advertiserProfileController.isFlixble.value = false;
                        advertiserProfileController.fromDate.value = "";
                        advertiserProfileController.fromAdvertisingDate.value = '2022-2-10';
                        advertiserProfileController.dateRange.value = DateRange();
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(left: 20.0),
                          child: Obx(() => Image.asset(
                                advertiserProfileController.isFixed.isTrue
                                    ? "images/radio_clicked.png"
                                    : "images/not_radio_clicked.png",
                                height: 50,
                                width: 50,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: const Text(
                            'محدد',
                            style: TextStyle(
                                color: AppColors.adVertiserPageDataColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Obx(() => InkWell(
                            onTap: advertiserProfileController.isFixed.isTrue
                                ? () {
                              DateTime selectedDate;
                              if(advertiserProfileController.fromDate.isNotEmpty){
                                print("myDate"+advertiserProfileController.fromDate.value);
                                DateTime endAdvertisingDateCouponDate = DateTime.parse(advertiserProfileController.fromDate.value);
                                selectedDate = endAdvertisingDateCouponDate;
                              }else{
                                selectedDate = (DateTime.now()).add( Duration(days: 1));
                              }

                                    Future<void> _selectDate(
                                        BuildContext context) async {
                                      final DateTime?
                                          picked = await showDatePicker(
                                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                                              context: context,
                                              initialDate:selectedDate,
                                              firstDate: (DateTime.now()),
                                              lastDate: (DateTime.now()).add(
                                                  const Duration(days: 600)));
                                      // if (picked != null && picked != selectedDate)
                                      if (picked != null &&
                                          picked != selectedDate) {
                                        advertiserProfileController
                                            .addAdvertisingFromDate(
                                                dateFormat.format(picked));
                                        // controller.endAdvertisingDate = dateFormat.format(picked);
                                      }
                                      // selectedDate = picked;
                                    }

                                    _selectDate(context);
                                  }
                                : () async {
                                    final picked = await DateRangePicker
                                        .showDateRangePicker(
                                      initialEntryMode:
                                          DatePickerEntryMode.calendarOnly,
                                      locale: const Locale('ar', 'EG'),
                                      context: context,
                                      firstDate: (new DateTime.now())
                                          .add(new Duration(days: 1)),
                                      lastDate: (new DateTime.now())
                                          .add(new Duration(days: 600)),
                                    );
                                    if (picked != null && picked != null) {
                                      print(picked);
                                      advertiserProfileController.addDateRange(
                                          "  "
                                              "${dateFormat.format(picked.start)}"
                                              "   ",
                                          "  "
                                              "${dateFormat.format(picked.end)}"
                                              "   ");
                                      // setState(() {
                                      // });
                                    }
                                  },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'من',
                                  style: TextStyle(
                                      color: AppColors.adVertiserPageDataColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 38,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(16),
                                      ),
                                      border: Border.all(
                                          width: 0.4,
                                          color:
                                              AppColors.borderDropDownColor)),
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    child: Obx(() => Text(
                                          advertiserProfileController
                                                  .isFlixble.isTrue
                                              ? '${(advertiserProfileController.dateRange.value.fromDate) ?? '2022-2-10'}'
                                              : advertiserProfileController
                                                  .fromAdvertisingDate.value,
                                          textAlign: TextAlign.center,
                                          style: advertiserProfileController
                                                      .isFlixble.isTrue &&
                                                  advertiserProfileController
                                                          .dateRange
                                                          .value
                                                          .fromDate !=
                                                      null
                                              ? const TextStyle(
                                                  color: AppColors
                                                      .adVertiserPageDataColor,
                                                  //fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                )
                                              : advertiserProfileController
                                                          .isFixed.isTrue &&
                                                      advertiserProfileController
                                                              .fromAdvertisingDate
                                                              .value !=
                                                          '2022-2-10'
                                                  ? const TextStyle(
                                                      color: AppColors
                                                          .adVertiserPageDataColor,
                                                      //fontWeight: FontWeight.w600,
                                                      fontSize: 18,
                                                    )
                                                  : TextStyle(
                                                      fontSize: 18,
                                                      color: AppColors
                                                          .editProfileTextColorOpa
                                                          .withOpacity(0.51)),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Obx(() => advertiserProfileController.isFlixble.isTrue
                        ? Expanded(
                            child: InkWell(
                              onTap: () async {
                                final picked = await DateRangePicker
                                    .showDateRangePicker(
                                  initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                                  locale: const Locale('ar', 'EG'),
                                  context: context,
                                  firstDate: (new DateTime.now())
                                      .add(new Duration(days: 1)),
                                  lastDate: (new DateTime.now())
                                      .add(new Duration(days: 600)),
                                );
                                if (picked != null && picked != null) {
                                  print(picked);
                                  advertiserProfileController.addDateRange(
                                      "  "
                                          "${dateFormat.format(picked.start)}"
                                          "   ",
                                      "  "
                                          "${dateFormat.format(picked.end)}"
                                          "   ");
                                  // setState(() {
                                  // });
                                }
                              },
                              child: Column(
                                //mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'الى',
                                    style: TextStyle(
                                        color:
                                            AppColors.adVertiserPageDataColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    height: 38,
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 4),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                        border: Border.all(
                                            width: 0.4,
                                            color:
                                                AppColors.borderDropDownColor)),
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        '${(advertiserProfileController.dateRange.value.toDate) ?? '2022-2-10'}',
                                        textAlign: TextAlign.center,
                                        style: advertiserProfileController
                                                    .isFlixble.isTrue &&
                                                advertiserProfileController
                                                        .dateRange
                                                        .value
                                                        .toDate !=
                                                    null
                                            ? const TextStyle(
                                                color: AppColors
                                                    .adVertiserPageDataColor,
                                                //fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )
                                            : TextStyle(
                                            fontSize: 18,
                                            color: AppColors
                                                .editProfileTextColorOpa
                                                .withOpacity(0.51)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox())
                  ],
                ),
              ),
              /*Container(
                height: 30.0,
                // width: 140.0,
                //padding: EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(18.0),
                child: Row(
                  children:  [
                    const   Text(
                      'تاريخ الاعلان',
                      style: TextStyle(
                          color: AppColors.adVertiserPageDataColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const  SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () async{
                        final picked = await showDateRangePicker(


                          locale : const Locale('ar', 'EG'),
                          context: context,
                          firstDate:(new DateTime.now()).add(new Duration(days: 1)),
                          lastDate: (new DateTime.now()).add(new Duration(days: 600)),
                        );
                        if (picked != null && picked != null) {
                          print(picked);
                          advertiserProfileController.addDateRange("  " "${dateFormat.format(picked.start)}" "   ","  " "${dateFormat.format(picked.end)}" "   ");
                          // setState(() {
                          // });
                        }
                      },
                      child: Obx(()=>Text(
                        '${advertiserProfileController.dateRange.value.fromDate}${advertiserProfileController.dateRange.value.toDate}',
                        style: const TextStyle(
                            color: AppColors.adVertiserPageDataColor,
                            fontWeight: FontWeight.w600,decoration: TextDecoration.underline),
                      )),
                    ),
                  ],
                ),
              ),*/
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    // color: Colors.white,
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12),
                        ),
                        border: Border.all(
                            width: 0.6, color: AppColors.borderDropDownColor)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 170.w,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 4
                                //vertical: 11,
                                ),
                            color: const Color(0xfff5f5f5),
                            child: Text(
                              "عدد مرات الإعلان",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff041D67)),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: Obx(()=>advertiserProfileController.isFlixble.isTrue ? TextField(
                              textAlign: TextAlign.center,
                              // enabled: false,
                              keyboardType: TextInputType.number,
                              textAlignVertical: TextAlignVertical.center,
                              controller: advertiserProfileController.selectedCounterController,
                              style: TextStyle(
                                  color: Color(0xff041D67),
                                  fontSize: 18),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 10.0, right: 14.0, bottom: 12.0),
                                  // isCollapsed: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[350]),
                                  hintText: 'عدد مرات الإعلان',
                                  fillColor: Colors.white70),
                            ):const Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xff041D67),
                                    fontSize: 18),
                              ),)
                            ),
                            /*DropdownButton<String>(
                              underline: const SizedBox.shrink(),
                              icon:
                                  SvgPicture.asset('images/dropdown_icon.svg'),
                              hint: Obx(() => advertiserProfileController
                                      .selectedTimeCounter.isNotEmpty
                                  ? Center(
                                      child: Text(
                                      advertiserProfileController
                                          .selectedTimeCounter.value,
                                      style: const TextStyle(
                                          color: Color(0xff041D67),
                                          fontSize: 18),
                                    ))
                                  : const Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                            color: Color(0xff041D67),
                                            fontSize: 18),
                                      ),
                                    )),
                              items: _counterType.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: Color(0xff041D67), fontSize: 18),
                                  ),
                                );
                              }).toList(),
                              // value: _selectedLocation,
                              // isDense: true,
                              isExpanded: true,
                              onChanged: (newVal) {
                                advertiserProfileController
                                    .selectCounter(newVal);
                              },
                            ),*/
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              advertiserProfileController.showInPlatform.isTrue?Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    advertiserProfileController.onSelectedDateEndedAtPlateform(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 5.0, right: 20.0),
                              child: Image.asset(
                                "images/calender.png",
                                height: 25,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: Text(
                                'إضافة تاريخ انتهاء مدة العرض فى المنصة ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.adVertiserPageDataColor,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /*const SizedBox(
                        width: 15,
                      ),*/
                      Obx(
                        () => advertiserProfileController.showInPlatform.isTrue?advertiserProfileController
                                .endAdvertisingDate.value.isNotEmpty
                            ? Container(
                                margin: EdgeInsets.only(top: 6.0, left: 5),
                                child: Text(
                                  "${advertiserProfileController.endAdvertisingDate}",
                                  style: const TextStyle(
                                    color: AppColors.adVertiserPageDataColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ):SizedBox():SizedBox()
                            /*: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: const Text(
                                  'إختيارى',
                                  style: TextStyle(
                                      color: AppColors.selectableColor,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline),
                                ),
                              ),*/
                      )
                    ],
                  ),
                ),
              ):const SizedBox(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                    child: InkWell(
                      onTap: () {
                        advertiserProfileController
                            .onDateClickedSaved(context);
                      },
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
                      margin:
                          EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                      child: InkWell(
                        onTap: () {
                          advertiserProfileController.isDateSaveClicked.value =
                              false;
                          Get.back();
                        },
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
                              'إستعادة',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (advertiserProfileController.isDateSaveClicked.isFalse) {
      advertiserProfileController.endAdvertisingDate.value = '';
      advertiserProfileController.selectedTimeCounter.value = '';
      advertiserProfileController.fromDate.value = '';
      advertiserProfileController.toDate.value = '';
      advertiserProfileController.fromAdvertisingDate.value = '2022-2-10';
      advertiserProfileController.dateRange.value = DateRange();
    }
    super.dispose();
  }
}
