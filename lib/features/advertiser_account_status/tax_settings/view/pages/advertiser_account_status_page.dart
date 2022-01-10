import 'package:advertisers/features/advertiser_account_status/tax_settings/controller/advertiser_account_status_controller.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/view/widgets/advertiser_account_status_app_bar_widget.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiserAccountStatusPage extends StatefulWidget {
  const AdvertiserAccountStatusPage({Key? key}) : super(key: key);

  @override
  State<AdvertiserAccountStatusPage> createState() => _AdvertiserAccountStatusPageState();
}

class _AdvertiserAccountStatusPageState extends State<AdvertiserAccountStatusPage> {

  String? _selectedFromDate;
  String? _selectedToDate;

  final List<String> _ranges = [
    '100 - 1000',
    '1000 - 10000',
    '10000 - 100000',
    '100000 - 1000000'
  ];
  String _selectedRange = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AdvertiserAccountStatusAppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 300.h),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetAndTitle(
            containerColor: Color(0xffF5F5F5),
            title: "حالة الحساب",
            iconWidget: Image.asset("images/md-key.png",height: 15,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  GetBuilder<AdvertiserAccountStatusController>(
              init: AdvertiserAccountStatusController(),
              builder: (controller) => InkWell(
                onTap: (){
                  controller.changeChecked();
                  print("${controller.isChecked}");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Row(
                      children: [
                        Container(
                          height: 25.h,
                          width: 25.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Color(0xc6244094),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("تعليق حالة الحساب",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
                      ],
                    )),
                    controller.isChecked == true ? selectedRadio() : unSelectedRadio(),
                    SizedBox(
                      width:10,
                    ),
                    Text("تعديل",style: TextStyle(fontSize: 16,color:Color(0xff244094)),)
                  ],
                ),
              ),
            ),




          ),
          GetBuilder<AdvertiserAccountStatusController>(
            init: AdvertiserAccountStatusController(),
            builder: (controller) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: const EdgeInsets.all(15.0),
                // padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffC3CFE2))
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: TextFormField(
                        enabled: false,
                        initialValue: "اختر الحالة",
                        style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),
                        // cursorColor: Colors.black,
                        // keyboardType: inputType,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          fillColor: Color(0xffE8E8E8),
                          filled: true,
                          isDense: true,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "اسم الضريبة",),
                      ),
                    )),
                    Expanded(
                        flex: 7,
                        child:  DropdownButton<String>(
                          underline: const SizedBox.shrink(),
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                          ),
                          hint: _selectedRange.isNotEmpty
                              ? Center(child: Text(_selectedRange,style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),))
                              : const Center(child: Text('إجازة عيد الأضحى المبارك',style: TextStyle(color:Color(0xff041D67) ,fontSize: 16),)),
                          items: _ranges.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            setState(() {
                              _selectedRange = newVal!;
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),


          Container(
              padding: EdgeInsets.only(top: 5,right: 30),
              child: Text("اكتب رسالة نصية ملائمة",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),)),

          Container(
            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: TextFormField(
                maxLines: 2,
                initialValue: "...............................................",
                style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),
                // cursorColor: Colors.black,
                // keyboardType: inputType,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "رقم الضريبة",),
                // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5,right: 30),
              child: Text("اختر مدة حالة الحساب",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),)),

          Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [

                  Expanded(child: InkWell(
                    onTap: (){
                      Future<void> _showDatePicker() async {
                        final DateTime? result =
                        await showDatePicker(context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                            initialDate:DateTime.now());
                        if (result != null) {
                          setState(() {
                            _selectedFromDate = result.toString();
                          });
                        }
                      }
                      _showDatePicker();
                      print("_selectedFromDate${_selectedFromDate}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("من",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset("images/calender.png",height: 25,)
                      ],
                    ),
                  )),
                  Expanded(child: InkWell(
                    onTap: (){
                      if(_selectedFromDate != null){
                        Future<void> _showDatePicker() async {
                          final DateTime? result =
                          await showDatePicker(context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                              initialDate:DateTime.now());
                          if (result != null) {
                            setState(() {
                              _selectedToDate = result.toString();
                            });
                          }
                        }
                        _showDatePicker();
                      }

                      print("_selectedToDate${_selectedToDate}");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الى",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset("images/calender.png",height: 25,)
                      ],
                    ),
                  )),

                ],
              )),

          SizedBox(
            height: 25,
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
                      child: Text("الغاء",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4391D4),

                    ),
                  ),)) ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
