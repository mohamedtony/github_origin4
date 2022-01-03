import 'package:advertisers/features/advanced_options/controller/advanced_options_controller.dart';
import 'package:advertisers/features/advanced_options/view/widgets/advanced_options_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedOptionsPage extends StatelessWidget {
  const AdvancedOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isBack: true,
          isNotification: false,
          isSearchBar: false,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
      ),
      body: Column(
        children: [
          WidgetAndTitle(
            title: "الاعدادات المتقدمة",
            iconWidget: SvgPicture.asset(
              "images/command.svg",
              height: 26,
              color: Color(0xc44184ce),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  GetBuilder<AdvancedOptionsController>(
              init: AdvancedOptionsController(),
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
                        Text("خيارات الإعدادات المتقدمة",style: TextStyle(color:Color(0xff041D67) ,fontSize: 16.sp),),
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
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: AdvancedOptionsData.advancedOptions.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (_, index) => AdvancedOptionsWidget(
                    advancedOptionsData: AdvancedOptionsData.advancedOptions[index],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 15,
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
                      child: Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
