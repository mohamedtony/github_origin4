import 'package:advertisers/features/advanced_options/controller/advanced_options_controller.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdvancedOptionsWidget extends StatelessWidget {
  final AdvancedOptionsData advancedOptionsData;

  const AdvancedOptionsWidget({
    Key? key,
    required this.advancedOptionsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      GetBuilder<AdvancedOptionsController>(
        init: AdvancedOptionsController(),
        builder: (controller) => Container(
          // color: Colors.black54,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Row(children: [
                    Container(
                      height: 20.h,
                      width: 20.h,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        gradient:  const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xff6fd3de),
                              Color(0xff486ac7),
                            ]
                        ),        borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text( "${advancedOptionsData.title}",style: TextStyle(fontSize: 16,color:Color(0xff4184CE)),))
                  ],)),


                  InkWell(
                    onTap: (){
                      if(controller.isChecked == true){
                        controller.addRemoveCheckList(advancedOptionsData.id);
                        print("${controller.checkList!}");
                      }

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        controller.checkList!.contains(advancedOptionsData.id) ? selectedBigCheckBox() : unSelectedBigCheckBox(),
                        SizedBox(
                          width: 15,
                        ),

                      ],),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),

              Container(
                margin: EdgeInsets.only(right: 15,left: 25),
                height: 1,
                child: Divider(
                  color: Color(0xff4277D0),
                ),
                width: MediaQuery.of(context).size.width,
                // color: Color(0xff4277D0),
              ),
            ],
          ),
        ),
      );


  }
}

class AdvancedOptionsData {
  final int?id;
  final String title;
  // final VoidCallback?  onPressed;

  AdvancedOptionsData({
    this.id,
    required this.title,
    // this.onPressed
  });

  // static List<AdvancedOptionsData> advancedOptions = [
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 1,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 2,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 3,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 4,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 5,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 6,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 7,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 8,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 9,
  //   ),
  //   AdvancedOptionsData(
  //     title: "استقبل رسائل الشات داخل الطلبات النشطة",
  //     id: 10,
  //   ),
  // ];
}
