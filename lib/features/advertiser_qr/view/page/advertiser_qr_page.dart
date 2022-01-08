import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:advertisers/features/tax_settings/controller/tax_settings_controller.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiserQrPage extends StatelessWidget {
  const AdvertiserQrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: TaxSettingsAppBarWidget(
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
            title: "اعدادات الضريبة",
            iconWidget: Image.asset("images/text-strike.png",height: 25,),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  GetBuilder<TaxSettingsController>(
              init: TaxSettingsController(),
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
                        Text("كل المدفوعات خاضعة للضريبة",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
            child: Text("الرقم الضريبي",style: TextStyle(color:Color(0xff041D67) ,fontSize: 17.sp),),
          ),
          GetBuilder<TaxSettingsController>(
            init: TaxSettingsController(),
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
                    Expanded(child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: TextFormField(
                        enabled: controller.isChecked,
                        initialValue: "ضريبة القيمة المضافة",
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
                    Expanded(child: TextFormField(
                      enabled: controller.isChecked,
                      initialValue: "1236532897120",
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
                    )),
                  ],
                ),
              ),
            ),
          ),



          Padding(padding: const EdgeInsets.only(
              bottom: 15,
              left: 35,
              right: 35,
              top: 5
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.add,
                  size: 20.h,),
                SizedBox(
                  width: 3,
                ),
                Text("الرقم الضريبي",style: TextStyle(color:Color(0xff636363) ,fontSize: 16.sp,decoration: TextDecoration.underline),),
              ],
            ),
          ),

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
