import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/view/advertising_requests_page.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClickPictureWidget extends StatelessWidget {
  final ParentRequests? parentRequests;
   ClickPictureWidget({Key? key,this.parentRequests}) : super(key: key);
  final AdvertisingRequestsController _advertisingRequestsController =Get.put(AdvertisingRequestsController());

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: InkWell(
        onTap: (){
          _advertisingRequestsController.addAndRemoveOtherFromCheckProfile(parentRequests!.id);
        },
        child: Container(
          padding:const EdgeInsets.all(10),
          decoration:  BoxDecoration(
              gradient:  const LinearGradient(
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
                            child: Image.network("${parentRequests!.advertiser!.image}",height: 65.h,)
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text("${parentRequests!.advertiser!.username}",style: TextStyle( fontSize: 13.sp,color: Colors.white,),),

                            Text("${parentRequests!.advertiser!.companyName}",style: TextStyle( fontSize: 12.sp,color: Colors.white,),)

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
                          upperTitle: "${parentRequests!.advertiser!.rate}",
                          desc: "?????????? ????????????????",
                        ),
                        const  SizedBox(
                          width: 8,
                        ),
                        SingleStatisticsItemWidget(
                          upperTitle: "${parentRequests!.advertiser!.payments}",
                          desc: "?????????????? ????????????",
                        ),

                      ],
                    ),
                    const   SizedBox(
                      height: 6,
                    ),

                    Row(
                      children: [
                        SingleStatisticsItemWidget(
                          desc: "???????? ???????????? ?????? 12 ??????",
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
                            sideTitle: "${parentRequests!.advertiser!.requests!.finished}",
                            desc: "?????????? ?????????? ????????????",
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
                            sideTitle: "${parentRequests!.advertiser!.requests!.notFinished}",
                            desc: "?????????? ?????? ????????????",
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
                            sideTitle: "${parentRequests!.advertiser!.requests!.rejected}",
                            desc: "?????????? ????????????",
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
                            sideTitle: "${parentRequests!.advertiser!.requests!.cancelled}",
                            desc: "?????????? ??????????",
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
                            desc: "?????????? ???????? ??????????  ${parentRequests!.advertiser!.requests!.lateTime}",
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
