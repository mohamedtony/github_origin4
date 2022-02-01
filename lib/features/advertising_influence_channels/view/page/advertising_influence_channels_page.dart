import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/widgets/advertising_influence_channels_list_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisingInfluenceChannelsPage extends StatelessWidget {
  const AdvertisingInfluenceChannelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
      InkWell(
        onTap: (){

          Get.offAndToNamed('/AddAdvertiserChannel');
        },
        child: Image.asset("images/AdvertisingInfluenceChannelsButton.png")
    ),
      appBar: PreferredSize(
        child: AppBarWidget(
          isBack: true,
          isNotification: false,
          isSearchBar: false,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
      ),
      body: ListView(
        children: [
          WidgetAndTitle(
            title: "قنوات الإعلان والتأثير",
            iconWidget: SvgPicture.asset(
              "images/tv-alt-play.svg",
              height: 23,
              color: Color(0xc44184ce),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child:  GetBuilder<AdvertisingInfluenceChannelsController>(
              init: AdvertisingInfluenceChannelsController(),
              builder: (controller) => InkWell(
                onTap: (){
                  controller.changeChecked();
                  print("${controller.isChecked}");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Expanded(child:
                    // ),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,),
            child: Container(
              decoration:const BoxDecoration(
                color: Color(0xffFBD098),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Text("دقة البينات تساعد التاجر على الوصول إليك وتعطيك مصداقية أكبر لدى عملائك",style: TextStyle(fontSize: 14.sp,color: Colors.black54),),),
            ),
          ),
         const SizedBox(
            height: 15,
          ),
          AdvertisingInfluenceChannelsPageListWidget(),

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
