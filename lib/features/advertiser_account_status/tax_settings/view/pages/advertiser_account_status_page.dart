import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/controller/advertiser_account_status_controller.dart';
import 'package:advertisers/features/advertiser_account_status/tax_settings/view/widgets/advertiser_account_status_app_bar_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiserAccountStatusPage extends StatefulWidget {
  final AdvertiserAccountStatusController _advertiserAccountStatusController=Get.put(AdvertiserAccountStatusController());
 late ScrollController scrollController;
 AdvertiserAccountStatusPage({required this.scrollController,Key? key}) : super(key: key);

  @override
  State<AdvertiserAccountStatusPage> createState() => _AdvertiserAccountStatusPageState();
}

class _AdvertiserAccountStatusPageState extends State<AdvertiserAccountStatusPage> {
  @override
  dispose(){
    widget._advertiserAccountStatusController.isChecked.value=false;
    Get.delete<AdvertiserAccountStatusController>();
    super.dispose();
  }

 //Get.put(AdvertiserAccountStatusController());
  String? _selectedFromDate;
  String? _selectedToDate;

  // final List<String> _ranges = [
  //   '100 - 1000',
  //   '1000 - 10000',
  //   '10000 - 100000',
  //   '100000 - 1000000'
  // ];
  int? _selectedRange ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   child: AdvertiserAccountStatusAppBarWidget(
      //     isSearchBar: false,
      //     isNotification: false,
      //     isBack: true,
      //     isSideMenu: false,
      //   ),
      //   preferredSize: Size(MediaQuery.of(context).size.width, 300.h),
      // ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        controller: widget.scrollController,
        children: [
          WidgetAndTitle(
            containerColor: Color(0xffF5F5F5),
            title: "???????? ????????????",
            iconWidget: Image.asset("images/md-key.png",height: 15,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  GetBuilder<AdvertiserAccountStatusController>(
              init: AdvertiserAccountStatusController(),
              builder: (controller) => InkWell(
                onTap: (){
                  controller.changeChecked();
                  print("${controller.isChecked.value}");
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
                              color: controller.status=='0'?AppColors.whiteColor:Color(0xc6244094),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("?????????? ???????? ????????????",style: TextStyle(color:controller.status.value=='1'?Color(0xff041D67):AppColors.whiteColor ,fontSize: 16.sp),),
                      ],
                    )),
                    controller.isChecked.value == true ? selectedRadio() : unSelectedRadio(),
                    SizedBox(
                      width:10,
                    ),
                    Text("??????????",style: TextStyle(fontSize: 16,color:Color(0xff244094)),)
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
                        enabled: controller.isChecked.value == true ?true:false,
                        //initialValue: "???????? ????????????",
                        style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),
                        // cursorColor: Colors.black,
                        // keyboardType: inputType,
                        controller: controller.caseController,
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
                          hintText: "?????? ????????????",),
                      ),
                    )),
                    Expanded(
                        flex: 7,
                        child:  DropdownButton(
                          underline: const SizedBox.shrink(),
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                          ),

                          hint: _selectedRange!=null
                              ? Center(child: Text(controller.ranges[_selectedRange??1-1].reason.toString(),style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),))
                              :  Center(child: Text(controller.reasonId.value>0?controller.ranges[controller.reasonId.value-1].reason.toString():'????????',style: TextStyle(color:Color(0xff041D67) ,fontSize: 16),)),
                          items: controller.ranges.map((value) {
                            if(value!=null) {
                             // controller.id.value = value.id.toString();
                            }else if(controller.reasonId.value>0){
                              value=controller.ranges[controller.reasonId.value-1];
                            }
                            print(value.id);
                            return DropdownMenuItem(
                              value: value.id,
                              child: Text(value.reason),enabled: controller.isChecked.value == true ?true:false,
                            );
                          }).toList(),
                          // value: _selectedLocation,
                          // isDense: true,
                          isExpanded: true,
                          onChanged: (newVal) {
                            if(newVal!=null) {
                              setState(() {
                                controller.id.value = newVal.toString();
                                _selectedRange = newVal as int?;
                              });
                            }},
                        )),
                  ],
                ),
              ),
            ),
          ),


          Container(
              padding: EdgeInsets.only(top: 5,right: 30),
              child: Text("???????? ?????????? ???????? ????????????",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),)),

          Container(

            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: SizedBox(
                height: 100,
                child: TextFormField(
                  maxLines: 10,
                  //initialValue: "...............................................",
                  style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),
                  // cursorColor: Colors.black,
                  // keyboardType: inputType,
                  enabled: Get.find<AdvertiserAccountStatusController>().isChecked .value== true ?true:false,
                  controller: Get.find<AdvertiserAccountStatusController>().messageController,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "...............................................",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp)),
                  // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 5,right: 30),
              child: Text("???????? ?????? ???????? ????????????",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),)),

          Container(
              padding: EdgeInsets.all(15),
              child: Obx(()=>Row(
                children: [

                  Expanded(child: InkWell(
                    onTap:Get.find<AdvertiserAccountStatusController>().isChecked.value == true ? (){
                      Future<void> _showDatePicker() async {
                        final DateTime? result =
                        await showDatePicker(context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                            initialDate:DateTime.now());
                        if (result != null) {
                          Get.find<AdvertiserAccountStatusController>().fromDate.value=result;
                          setState(() {

                            _selectedFromDate = result.toString();
                          });
                          Get.find<AdvertiserAccountStatusController>().from.value=result.toString();
                        }
                      }
                      _showDatePicker();
                      print("_selectedFromDate${_selectedFromDate}");
                    }:null,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("????",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("images/calender.png",height: 25,)
                          ],
                        ),
Text("${Get.find<AdvertiserAccountStatusController>().to.value.isNotEmpty?Get.find<AdvertiserAccountStatusController>().from.value.substring(0,10):" "}")
                      ],
                    ),
                  )),
                  Expanded(child: InkWell(
                    onTap:Get.find<AdvertiserAccountStatusController>().isChecked.value == true ? (){
                      Get.find<AdvertiserAccountStatusController>().flagDate.value=false;
                      if(_selectedFromDate != null){
                        Future<void> _showDatePicker() async {
                          final DateTime? result =
                          await showDatePicker(context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                              initialDate:DateTime.now());
                          if (result != null) {

    Get.find<AdvertiserAccountStatusController>().toDate.value=result;
                            if(Get.find<AdvertiserAccountStatusController>().fromDate.value.isAfter(result)){
    Get.snackbar(
    "??????",
    "?????????????? ?????? ?????? ???? ???????? ???????? ???? ?????????????? ????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
    Get.find<AdvertiserAccountStatusController>().flagDate.value=true;
                            }
                            setState(() {
                              _selectedToDate = result.toString();

                            });
                            Get.find<AdvertiserAccountStatusController>().to.value=result.toString();
                          }
                        }
                        _showDatePicker();
                      }

                      print("_selectedToDate${_selectedToDate}");
                    }:null,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("??????",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset("images/calender.png",height: 25,)
                          ],
                        ),
                        Text("${Get.find<AdvertiserAccountStatusController>().to.value.isNotEmpty?Get.find<AdvertiserAccountStatusController>().to.value.substring(0,10):' '}")
                      ],
                    ),
                  )),

                ],
              ))),

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
    if(Get.find<AdvertiserAccountStatusController>().fromDate.value.isAfter(Get.find<AdvertiserAccountStatusController>().toDate.value)){
    Get.snackbar(
    "??????",
    "?????????????? ?????? ?????? ???? ???????? ???????? ???? ?????????????? ????",
    icon: const Icon(Icons.person, color: Colors.red),
    backgroundColor: Colors.yellow,
    snackPosition: SnackPosition.BOTTOM,);
    Get.find<AdvertiserAccountStatusController>().flagDate.value=true;
    //if(Get.find<AdvertiserAccountStatusController>().flagDate.value==false) {
    }else{ Get.find<AdvertiserAccountStatusController>()
                        .postStopProfile();
                    // Get.find<AdvertiserAccountStatusController>().isChecked.value=false;
                    //Get.delete<AdvertiserAccountStatusController>();
                    Get.back();
                //  }
                }},
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("??????",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
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
                  Get.delete<AdvertiserAccountStatusController>();
                  Get.back();
                },
                  child: Container(
                    height: 40,
                    child: Center(
                      child: Text("??????????",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
