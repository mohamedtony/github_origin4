import 'package:advertisers/features/wallet_module/controllers/points_controller.dart';
import 'package:advertisers/features/wallet_module/request/points_request.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:advertisers/features/wallet_module/widgets/pulls_widgets/pulls_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PointsWidget extends GetWidget<PointsController> {
  PointsWidget({Key? key}) : super(key: key);
  final _pointsController = Get.put(PointsController());


  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List<PointsItem>? pointsItems = [
           PointsItem(
              title: "عدد النقاط", name: "نقطة", value: state?.data?.points),
            PointsItem(
              title: "رصيد المحفظة", name: "ريال", value: state?.data?.wallet),
          PointsItem(
              title: "رصيد النقاط",
              name: "ريال",
              value: state?.data?.pointsBalance),
        ];


        return Container(
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: 125.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: pointsItems!.length,
                        itemBuilder: (context, index) {
                          return PointsChartWidget(
                              value: "${pointsItems![index].value}",
                              name: "${pointsItems![index].name}",
                              title: "${pointsItems![index].title}",
                              // isExtended: _walletController.userData!.role == "advertiser" ? false:true,
                          );
                        }),
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            "ادخل عدد النقاط التي تريد تحويلها إلى رصيد نقدي",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff486ac7)),
                                          ))),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/income@3x.png",
                                    width: 40,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 3),
                                            child: TextFormField(
                                              controller: controller.amountController,
                                              cursorColor: Colors.black,
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  hintText: '0.0',
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  hintStyle: TextStyle(
                                                      fontSize: 21,
                                                      color: Color(0XffC8714B))),
                                            ),
                                            // Text(
                                            //   '0.0',
                                            //   style: TextStyle(fontSize: 24,color: Color(0XffC8714B)),
                                            //   textScaleFactor: 1.2,
                                            // ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text(
                                          "نقطة",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff486ac7)),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      // margin: const EdgeInsets.symmetric(horizontal: 5),
                                      width: 105.w,
                                      // height: 75.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xff6fd3de),
                                                Color(0xff486ac7),
                                              ]),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300]!,
                                              blurRadius: 20.0,
                                              spreadRadius: 1.0,
                                            )
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          Image.asset(
                                            "images/making-money@3x.png",
                                            width: 50,
                                          ),
                                          const SizedBox(
                                            height: 1,
                                          ),
                                          const Text("حول",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     itemCount: items!.length,
                              //     itemBuilder: (context, index) {
                              //       return Padding(
                              //         padding: const EdgeInsets.only(bottom: 15),
                              //         child: Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.start,
                              //           crossAxisAlignment:
                              //               CrossAxisAlignment.start,
                              //           children: [
                              //             Container(
                              //               padding:
                              //                   const EdgeInsets.only(top: 8),
                              //               height: 12,
                              //               width: 12,
                              //               decoration: const BoxDecoration(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(
                              //                           100.0) //                 <--- border radius here
                              //                       ),
                              //                   color: Color(0xff636363)),
                              //             ),
                              //             const SizedBox(
                              //               width: 12,
                              //             ),
                              //             Expanded(
                              //                 child: Text(
                              //               "${items![index].desc}",
                              //               style: TextStyle(
                              //                   fontSize: 14.sp,
                              //                   color: const Color(0xff636363),
                              //                   height: 1.6),
                              //             ))
                              //           ],
                              //         ),
                              //       );
                              //     }),
                              // const SizedBox(
                              //   height: 60,
                              // ),
                              if(state?.data?.pendingPoint > 0 )   Column(
                                  children: [
                                    Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                      100.0) //                 <--- border radius here
                          ),
                          color: Color(0xff636363)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Text(
                          "لديك رصيد نقاط ( ${state?.data?.pendingPoint} نقطة ) معلق بانتظار انتهاء الطلبات المرتبطه بها .",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff636363),
                              height: 1.6),
                        ))
                  ],
                ),
              ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),

                              Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      if (controller.amountController.text.isNotEmpty) {
                                        controller.addPoints(
                                            request: PointsRequest(
                                                points: controller.amountController.text));
                                      } else {
                                        Get.snackbar(
                                          "مطلوب",
                                          "ادخل عدد النقاط التي تريد تحويلها إلى رصيد نقدي",
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      child: const Center(
                                        child: Text(
                                          "تأكيد",
                                          style: TextStyle(
                                              color: Color(0xff4391D4),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffE8E8E8),
                                      ),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      controller.amountController.clear();
                                    },
                                    child: Container(
                                      height: 40,
                                      child: const Center(
                                        child: Text(
                                          "رجوع",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xff4391D4),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
              const SizedBox(
                height: 40,
              ),
                              const SizedBox(
                                height: 45,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
