import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/advertiser_details/sheets/advertising_channels_sheet.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'date_picker.dart' as DateRangePicker;
// import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;


DateFormat dateFormat = DateFormat("yyyy-MM-dd");
class AdvertisingDatePage extends StatefulWidget {
  ScrollController? scrollController;
  AdvertisingDatePage({Key? key, this.scrollController}) : super(key: key);
  @override
  State<AdvertisingDatePage> createState() => _AdvertisingDatePageState();
}

class _AdvertisingDatePageState extends State<AdvertisingDatePage> {
  RequestAdvertiseController requestAdvertiseController=Get.find();

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

    return  Container(
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
                        style:  const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Image.asset("images/calender.png",height: 20,),
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
                    onTap: (){
                      if(requestAdvertiseController.isFlixble.isFalse){
                        requestAdvertiseController.isFixed.value = false;
                        requestAdvertiseController.isFlixble.value = true;
                      }
                    },
                    child: Row(children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 20.0),
                        child: Obx(()=>Image.asset(
                          requestAdvertiseController.isFlixble.isTrue?"images/radio_clicked.png":"images/not_radio_clicked.png",height: 50,width: 50,)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0,left: 30.0),
                        child: const   Text(
                          'مرن',
                          style: TextStyle(
                              color: AppColors.adVertiserPageDataColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],),
                  ),
                  InkWell(
    onTap: (){
    if(requestAdvertiseController.isFixed.isFalse){
    requestAdvertiseController.isFixed.value = true;
    requestAdvertiseController.isFlixble.value = false;
    }
    },
                    child: Row(children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 20.0),
                        child: Obx(()=>Image.asset(
                          requestAdvertiseController.isFixed.isTrue?"images/radio_clicked.png":"images/not_radio_clicked.png",height: 50,width: 50,)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: const   Text(
                          'محدد',
                          style: TextStyle(
                              color: AppColors.adVertiserPageDataColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],),
                  )
                ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await DateRangePicker.showDateRangePicker(
                              initialEntryMode:DatePickerEntryMode.calendarOnly,
                            locale : const Locale('ar', 'EG'),
                            context: context,
                            firstDate:(new DateTime.now()).add(new Duration(days: 1)),
                            lastDate: (new DateTime.now()).add(new Duration(days: 600)),
                          );
                          if (picked != null && picked != null) {
                            print(picked);
                            requestAdvertiseController.addDateRange("  " "${dateFormat.format(picked.start)}" "   ","  " "${dateFormat.format(picked.end)}" "   ");
                            // setState(() {
                            // });
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const   Text(
                              'من',
                              style: TextStyle(
                                  color: AppColors.adVertiserPageDataColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 20,right: 20),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(const Radius.circular(16),),
                                border: Border.all(width: 0.4,
                                    color: AppColors.borderDropDownColor)
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: Text(
                                  '22-10-2202',
                                  textAlign: TextAlign.center,
                                  style:TextStyle(fontSize: 18,color: AppColors.editProfileTextColorOpa.withOpacity(0.51)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(()=>requestAdvertiseController.isFlixble.isTrue?Expanded(
                      child: InkWell(
                        onTap: () async {
                          final picked = await showDateRangePicker(


                            locale : const Locale('ar', 'EG'),
                            context: context,
                            firstDate:(new DateTime.now()).add(new Duration(days: 1)),
                            lastDate: (new DateTime.now()).add(new Duration(days: 600)),
                          );
                          if (picked != null && picked != null) {
                            print(picked);
                            requestAdvertiseController.addDateRange("  " "${dateFormat.format(picked.start)}" "   ","  " "${dateFormat.format(picked.end)}" "   ");
                            // setState(() {
                            // });
                          }
                        },
                        child: Column(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const   Text(
                              'الى',
                              style: TextStyle(
                                  color: AppColors.adVertiserPageDataColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 20,right: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(16),),
                                  border: Border.all(width: 0.4,
                                      color: AppColors.borderDropDownColor)
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 3),
                                child: Text(
                                  '22-10-2202',
                                  textAlign: TextAlign.center,
                                  style:TextStyle(fontSize: 18,color: AppColors.editProfileTextColorOpa.withOpacity(0.51)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ):const SizedBox())
                  ],
                ),
              Container(
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
                          requestAdvertiseController.addDateRange("  " "${dateFormat.format(picked.start)}" "   ","  " "${dateFormat.format(picked.end)}" "   ");
                          // setState(() {
                          // });
                        }
                      },
                      child: Obx(()=>Text(
                        '${requestAdvertiseController.dateRange.value.fromDate}${requestAdvertiseController.dateRange.value.toDate}',
                        style: const TextStyle(
                            color: AppColors.adVertiserPageDataColor,
                            fontWeight: FontWeight.w600,decoration: TextDecoration.underline),
                      )),
                    ),
                  ],
                ),
              ),
              const  SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  elevation: 8,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    // color: Colors.white,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 170.w,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 11,
                            ),
                            color: const Color(0xfff5f5f5),
                            child: Text(
                              "عدد مرات الإعلان",
                              style: TextStyle(fontSize: 14.sp,color: const Color(0xff041D67)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: DropdownButton<String>(
                              underline: const SizedBox.shrink(),
                              icon: SvgPicture.asset('images/dropdown_icon.svg'),
                              hint: Obx(()=>requestAdvertiseController.selectedTimeCounter.isNotEmpty
                                  ? Center(
                                  child: Text(
                                    requestAdvertiseController.selectedTimeCounter.value,
                                    style: TextStyle(fontSize: 12.sp),
                                  ))
                                  : const Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(color: Color(0xff041D67),fontSize: 13),
                                ),
                              )),
                              items: _counterType.map((String value) {
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
                                requestAdvertiseController.selectCounter(newVal);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: (){
                    DateTime selectedDate = DateTime.now();

                    Future<void> _selectDate(BuildContext context) async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: ( DateTime.now()).add( const Duration(days: 1)),
                          firstDate:( DateTime.now()),
                          lastDate: ( DateTime.now()).add( const Duration(days: 600)));
                      // if (picked != null && picked != selectedDate)
                      if (picked != null && picked != selectedDate)
                      {
                        requestAdvertiseController.addendAdvertisingDate(dateFormat.format(picked));
                        // controller.endAdvertisingDate = dateFormat.format(picked);
                      }
                      // selectedDate = picked;

                    }

                    _selectDate(context);



                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Image.asset("images/calender.png",height: 20,),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'إضافة تاريخ انتهاء الإعلان',
                        style:  TextStyle(
                            color: AppColors.adVertiserPageDataColor,
                            fontWeight: FontWeight.w600,decoration: TextDecoration.underline),
                      ),

                      const SizedBox(
                        width: 15,
                      ),
                     Obx(()=> requestAdvertiseController.endAdvertisingDate.value.isNotEmpty?  Text("${requestAdvertiseController.endAdvertisingDate}",style: const TextStyle(
    color: AppColors.adVertiserPageDataColor,
    fontWeight: FontWeight.w600,),):const SizedBox(
                     ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()=>requestAdvertiseController.onDateClickedSaved(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      height: 40,
                      child: const Center(
                        child: const Text("حفظ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff4391D4),
                      ),
                    ),
                  )
                ],
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
    if(requestAdvertiseController.isDateSaveClicked.isFalse){
      requestAdvertiseController.endAdvertisingDate.value = '';
      requestAdvertiseController.selectedTimeCounter.value = '';
      requestAdvertiseController.dateRange.value = DateRange(fromDate: "اختر نطاق زمني",toDate: ".........");
    }
    super.dispose();
  }
}


