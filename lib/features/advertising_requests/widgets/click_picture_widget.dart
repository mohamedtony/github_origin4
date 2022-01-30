import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/view/advertising_requests_page.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClickPictureWidget extends StatelessWidget {
  final Orders? orderData;
   ClickPictureWidget({Key? key,this.orderData}) : super(key: key);
  final AdvertisingRequestsController _advertisingRequestsController =Get.put(AdvertisingRequestsController());

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: InkWell(
        onTap: (){
          _advertisingRequestsController.addAndRemoveOtherFromCheckProfile(orderData!.id);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration:  BoxDecoration(
              gradient:   LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff6fd3de),
                  Color(0xff486ac7),
                ],
              ),
              borderRadius:  BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg",height: 65.h,)
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text("أحمد محمد سالم",style: TextStyle( fontSize: 13.sp,color: Colors.white,),),

                            Text("شركة الفصول الأربعة",style: TextStyle( fontSize: 12.sp,color: Colors.white,),)

                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    Row(
                      children: [
                        SingleStatisticsItemWidget(
                          upperTitle: "4.5",
                          desc: "تقييم المعلنين",
                        ),
                        const  SizedBox(
                          width: 8,
                        ),
                        SingleStatisticsItemWidget(
                          upperTitle: "4.5",
                          desc: "تقييم المعلنين",
                        ),

                      ],
                    ),
                    const   SizedBox(
                      height: 6,
                    ),

                    Row(
                      children: [
                        SingleStatisticsItemWidget(
                          desc: "حساب التاجر منذ 12 شهر",
                        ),
                      ],
                    ),



                  ],
                ),
              ),
              const  SizedBox(
                width: 6,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Row(
                        children: [
                          SingleStatisticsItemWidget(
                            isCenterMainAxisAlignment: false,
                            sideTitle: "9",
                            desc: "طلبات صحيحة منتهية",
                          )
                        ],
                      ),
                      const  SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SingleStatisticsItemWidget(
                            isCenterMainAxisAlignment: false,
                            sideTitle: "9",
                            desc: "طلبات غير مكتملة",
                          )
                        ],
                      ),
                      const  SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SingleStatisticsItemWidget(
                            isCenterMainAxisAlignment: false,
                            sideTitle: "9",
                            desc: "طلبات مرفوضة",
                          )
                        ],
                      ),
                      const  SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SingleStatisticsItemWidget(
                            isCenterMainAxisAlignment: false,
                            sideTitle: "6",
                            desc: "طلبات مرفوضة",
                          )
                        ],
                      ),
                      const  SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          SingleStatisticsItemWidget(
                            isCenterMainAxisAlignment: false,
                            desc: "متوسط تأخر الدفع 17 ساعة",
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
