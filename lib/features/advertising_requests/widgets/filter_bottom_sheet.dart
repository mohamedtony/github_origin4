/*
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item_separation.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_items_wraper.dart';
import 'package:advertisers/features/advertising_requests/widgets/click_picture_widget.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  List<Areas>? areas;
  List<Sorts>? sorts;
   FilterBottomSheetWidget({Key? key,this.sorts,this.areas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");


    final List<String> _cities = [
      'الرياض',
      'الدمام',
      'جدة',
      'مكة'
    ];

    return GetBuilder<AdvertisingRequestsController>(
      init: AdvertisingRequestsController(),
      builder: (controller) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250.h,
            decoration: const BoxDecoration(
              gradient:   LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff6dccdc),
                    Color(0xff5ca2d3),
                  ]
              ),
              //   borderRadius: BorderRadius.all(
              //   Radius.circular(10.0),
              // ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:const EdgeInsets.only(right: 15,left: 15,top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset('images/arrow_back.svg',
                            // matchTextDirection: true,
                            height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 7,right: 15,left: 15,bottom: 7),
                        decoration: const BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Text("فرز وترتيب الطلبات",style: TextStyle(fontSize: 20.sp,color:const Color(0xff2566AF)),),
                      ),
                      Container(
                        height: 5,
                        width: double.infinity,
                        color:const Color(0xffce815c),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
          Expanded(
              child:  Container(
                padding: EdgeInsets.all(12),
                // height: double.infinity,
                width: double.infinity,
                decoration:const  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff6fd3de),
                        Color(0xff486ac7),
                      ]
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("عرض الطلبات بحسب",style: TextStyle(color: Colors.white,fontSize: 16.sp),),

                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if(sorts!.isNotEmpty)   Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      // direction: Axis.horizontal,
                      children: sorts!.map((e) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                              onTap: (){
                                controller.addRemoveSortTypes(e.key);
                              },
                              child: selectedUnSelectedSort(title:e.value ,isSelected: controller.sortTypesIds!.contains(e.key))),
                        ],
                      )).toList(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("عرض الطلبات بحسب",style: TextStyle(color: Colors.white,fontSize: 16.sp),),

                      ],
                    ),


                    const SizedBox(
                      height: 15,
                    ),

                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child:  Container(
                                padding:const EdgeInsets.symmetric(vertical: 15),
                                height: MediaQuery.of(context).size.height / 2,
                                child: ListView.builder(
                                    primary: true,
                                    itemCount: areas!.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: (){
                                          controller.addRemoveCity(area: areas![index]);
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(areas![index].name!,style: TextStyle(fontSize: 15.sp),),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            );
                          },
                        );

                      },
                      child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(child:
                              controller.areas!.isNotEmpty
                                  ? Container(
                                height: 55,
                                width: double.infinity,
                                child: ListView.builder(
                                  // physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    primary: true,
                                    itemCount: controller.areas!.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child:  selectedUnSelectedSort(title: controller.areas![index].name,isSelected: true),
                                      );
                                    }),
                              )
                                  : const Text('من فضلك اختر النطاق'),),
                              const  Icon(Icons.arrow_drop_down,color:const Color(0xff887FCE),)
                            ],
                          )
                      ),
                    ),

                    // Text(controller.areasCities!.join(",")),

                    const SizedBox(
                      height: 35,
                    ),

                    SizedBox(
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: TextFormField(
                                controller: controller.searchCustomerController,
                                style: TextStyle(fontSize: 15.sp),
                                // textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  isDense: true,
                                  // contentPadding:  EdgeInsets.symmetric(vertical: 10),
                                  hintText: "اختر / اكتب اسم العميل",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          "images/bx-search-alt.svg",
                                          height: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                    color: const Color(
                                      0xff182A5E,
                                    ),
                                    fontSize: 15.sp,),
                                ),
                              ),
                            ),)
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    InkWell(
                      onTap: (){
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text(
                                    'تاريخ محدد'),
                                onPressed: () async {

                                  DateTime selectedDate = DateTime.now();

                                  Future<void> _selectDate(BuildContext context) async {
                                    final DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: ( DateTime.now()).add( Duration(days: 1)),
                                        firstDate:( DateTime.now()),
                                        lastDate: ( DateTime.now()).add( Duration(days: 600)));
                                    // if (picked != null && picked != selectedDate)
                                    if (picked != null && picked != selectedDate)
                                    {
                                      controller.addendAdvertisingDate(dateFormat.format(picked));
                                      controller.dateStringTitle.value =   dateFormat.format(picked);
                                      Navigator.of(context).pop();
                                    }
                                    // selectedDate = picked;

                                  }

                                  _selectDate(context);


                                },
                              ),
                              CupertinoActionSheetAction(
                                child: Text(
                                    'نطاق زمني'),
                                onPressed: () async {
                                  final picked = await showDateRangePicker(


                                    locale : const Locale('ar', 'EG'),
                                    context: context,
                                    firstDate:(new DateTime.now()).add(new Duration(days: 1)),
                                    lastDate: (new DateTime.now()).add(new Duration(days: 600)),
                                  );
                                  if (picked != null && picked != null) {
                                    print(picked);
                                    controller.addDateRange("  " "${dateFormat.format(picked.start)}" "   ","  " "${dateFormat.format(picked.end)}" "   ");
                                    controller.dateStringTitle.value = "${dateFormat.format(picked.start)}  ${dateFormat.format(picked.end)}";
                                    // setState(() {
                                    // });
                                  }
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(()=> Text(  '${controller.dateStringTitle.value}',style: TextStyle(
                                color: const Color(
                                  0xff182A5E,
                                ),
                                fontSize: 15.sp,),),),
                              Image.asset("images/calender.png",height: 25,)
                            ],
                          )
                      ),
                    ),

                    const SizedBox(
                      height: 45,
                    ),

                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              controller.parentRequests.clear();
                              controller.parentRequestsIds.clear();
                              controller.fetchAdvertisingRequests(pageZero: true);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 140.w,
                              padding:const EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color:const Color(0xffE8E8E8)
                              ),
                              child: Center(
                                child: Text("حفظ",style: TextStyle(color: Color(0xff427AD0),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),



                          InkWell(
                            onTap: (){
                              controller.restAll();
                              controller.update();
                            },
                            child: Container(
                              width: 140.w,
                              padding:const EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color:const Color(0xffF9F9F9)
                              ),
                              child: Center(
                                child: Text("استعادة",style: TextStyle(color: Color(0xff427AD0),fontSize: 16.sp,decoration: TextDecoration.underline),),
                              ),
                            ),
                          ),
                        ],


                      ),
                    ),

                    const SizedBox(
                      height: 45,
                    ),

                  ],
                ),
              )),






        ],
      ),
    );
  }
}

Widget selectedUnSelectedSort({String? title,bool?isSelected}){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected == true ? const Color(0xff4e90bf) : Colors.white
    ),
    child: Center(
      child: Text("$title",style: TextStyle(fontSize: 16.sp,color: isSelected == true ? Colors.white: const Color(0xff4e90bf)),),
    ),
  );
}


*/
