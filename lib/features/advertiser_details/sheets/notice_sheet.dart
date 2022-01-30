import 'package:advertisers/features/advertiser_details/controller/advertiser_details_controller.dart';
import 'package:advertisers/features/request_advertise_module/controller/adertising_channels_controller.dart';
import 'package:advertisers/features/request_advertise_module/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:advertisers/features/home_page/view/widgets/advertise_item_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:advertisers/features/home_page/app_colors.dart';

class AdvertisingNoticsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {




    return GetBuilder<AdvertisingDetailsController>(
      init: AdvertisingDetailsController(),
      builder: (controller) {




        return Container(
          child: ListView(
            // controller: this.scrollController,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(8.0),
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
                            'الوصف',
                            style:  const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: AppColors.tabColor),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'images/chat-right-text@3x.png',
                            height: 20.w,
                            width: 20.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.dividerBottom,
                    thickness: 4.0,
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                        child: TextFormField(
                          // initialValue: "تغطية افتتاح الفرع الثالث من فروعنا",
                          controller: controller.noticsController,
                          textInputAction: TextInputAction.newline,
                          maxLines: 6,
                          // minLines: 5,
                          cursorColor: Colors.black,
                          // textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'إضافة وصف',
                              contentPadding: const
                              EdgeInsets.all(0),

                              hintStyle: TextStyle(fontSize: 14.sp,color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setStateBehavior();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 75),
                          height: 40,
                          child: Center(
                            child: Text("حفظ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff4391D4),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


