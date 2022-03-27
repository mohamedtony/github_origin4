import 'package:advertisers/features/customer_order_invoice/controller/customer_order_invoice_controller.dart';

import 'package:advertisers/features/customer_order_invoice/view/widgets/customer_order_invoice_app_bar.dart';
import 'package:advertisers/features/customer_order_invoice/view/widgets/staticts_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/view/usedWidgets/advertisers_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerOrderInvoicePage extends StatelessWidget {
  CustomerOrderInvoicePage({Key? key}) : super(key: key);
  CustomerOrderInvoiceController customerOrderInvoiceOutputsController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomerOrderInvoiceBarWidget(),
        preferredSize: Size(MediaQuery.of(context).size.width, 95.h),
      ),
      body: Obx(()=>Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6cc9db),
                Color(0xff60abd6),
                Color(0xff538bce),
                Color(0xff496ec7),
                // Colors.white
              ]),
        ),
        padding: EdgeInsets.only(right: 15,left: 15,bottom: 5),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80.h,
                  color:Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(customerOrderInvoiceOutputsController.showBillModel.value.ads_type?.name??' ',style: TextStyle(fontSize: 15.sp),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("من 11-3-2022 الى 21-3-2022 ",style: TextStyle(fontSize: 15.sp),),
                          ],
                        ),

                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height:5,
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),),
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                  child: Text(customerOrderInvoiceOutputsController.showBillModel.value.id.toString()??" ",style: TextStyle(color: Color(0xffD37A47),fontSize: 14.sp),),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                  children: customerOrderInvoiceOutputsController.showBillModel.value.items!=null?List.generate(customerOrderInvoiceOutputsController.showBillModel.value.items!.length, (index) =>
                      StaticsWidget(
                        title: customerOrderInvoiceOutputsController.showBillModel.value.items![index].text??'',
                        price:customerOrderInvoiceOutputsController.showBillModel.value.items![index].price?.toStringAsFixed(2)??'',
                        currency: customerOrderInvoiceOutputsController.showBillModel.value.payment?.currency??'',
                      ),
                    //   StaticsWidget(
                    //     title: "تكلفة إقامة لمدة يومين",
                    //     price: "1000",
                    //     currency: "ر.س",
                    //   ),
                    //   StaticsWidget(
                    //     title: "تكلفة طيران",
                    //     price: "1200",
                    //     currency: "ر.س",
                    //   ),
                    // ],
                  ) :[const SizedBox()]),
            ),
            const  SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7),
              color: Colors.white,
              child: Column(
                  children: customerOrderInvoiceOutputsController.showBillModel.value.discounts!=null?List.generate(customerOrderInvoiceOutputsController.showBillModel.value.discounts!.length, (index) =>


                      StaticsWidget(
                        isPoint: false,
                        title: customerOrderInvoiceOutputsController.showBillModel.value.discounts![index].text??'',
                        price: customerOrderInvoiceOutputsController.showBillModel.value.discounts![index].text??'',
                        currency:  customerOrderInvoiceOutputsController.showBillModel.value.payment?.currency??'',
                        percent:customerOrderInvoiceOutputsController.showBillModel.value.payment?.commissionModel?.percentage.toString()??' ',
                      ),



                  ) :[const SizedBox()]),
            ),
            const  SizedBox(
              height: 15,
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [

                        SizedBox(
                          width:  15,
                        ),
                        Expanded(child: Text("اجمالي الفاتورة",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp,fontWeight: FontWeight.bold),)),

                        Row(
                          children: [
                            Text(customerOrderInvoiceOutputsController.showBillModel.value.payment?.subtotal?.toStringAsFixed(2)??'', style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            const SizedBox(
                              width: 5,
                            ),
                            // Spacer(),
                            Text(customerOrderInvoiceOutputsController.showBillModel.value.payment?.currency??'',style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                          ],
                        )

                      ],
                    ),
                  ),
      // appBar: PreferredSize(
      //   child: CustomerOrderInvoiceBarWidget(),
      //   preferredSize: Size(MediaQuery.of(context).size.width, 110.h),
      // ),
      // body: Container(
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topRight,
      //         end: Alignment.bottomRight,
      //         colors: [
      //           Color(0xff6cc9db),
      //           Color(0xff60abd6),
      //           Color(0xff538bce),
      //           Color(0xff496ec7),
      //           // Colors.white
      //         ]),
      //   ),
      //   padding: EdgeInsets.only(right: 15,left: 15,bottom: 15),
      //   child: ListView(
      //     children: [
      //       Text("نوع الإعلان / تغطية مع الحضور ....(1)",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
      //      const SizedBox(
      //         height: 15,
      //       ),
      //       Row(
      //         children: [
      //           Container(
      //             decoration: const BoxDecoration(
      //               color: Colors.white,
      //               border: Border(
      //                 bottom: BorderSide(width: 1.0, color: Colors.grey),
      //               ),),
      //             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      //             child: Text("#569851",style: TextStyle(color: Color(0xffD37A47),fontSize: 14.sp),),
      //           ),
      //         ],
      //       ),
      //       Container(
      //         color: Colors.white,
      //         child: Column(
      //           children: [
      //             StaticsWidget(
      //               title: "إعلان تغطية خاصة بموقع التاجر",
      //               price: "17500",
      //               currency: "ر.س",
      //             ),
      //             StaticsWidget(
      //               title: "تكلفة إقامة لمدة يومين",
      //               price: "1000",
      //               currency: "ر.س",
      //             ),
      //             StaticsWidget(
      //               title: "تكلفة طيران",
      //               price: "1200",
      //               currency: "ر.س",
      //             ),
      //             StaticsWidget(
      //               title: "اضافة الخصم الخاص",
      //               price: "-120",
      //               currency: "ر.س",
      //             ),
      //           ],
      //         ),
      //       ),
      //     const  SizedBox(
      //         height: 15,
      //       ),
      //       Container(
      //         color: Colors.white,
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 7,
      //             ),
      //             StaticsWidget(
      //               isPoint: false,
      //               title: "عمولة المنصة",
      //               price: "17500",
      //               currency: "ر.س",
      //               percent: "7 %",
      //             ),
      //             StaticsWidget(
      //               isPoint: false,
      //               title: "ضريبة القيمة المضافة",
      //               price: "1000",
      //               currency: "ر.س",
      //               percent: "15 %",
      //             ),
      //             SizedBox(
      //               height: 7,
      //             ),
      //           ],
      //         ),
      //       ),
      //     const  SizedBox(
      //       height: 15,
      //     ),
      //
      //       Container(
      //         color: Colors.white,
      //         padding: EdgeInsets.all(15),
      //         child: Column(
      //           children: [
      //             Container(
      //               padding: EdgeInsets.only(bottom: 8),
      //               child: Row(
      //                 children: [
      //
      //                   SizedBox(
      //                     width:  15,
      //                   ),
      //                   Expanded(child: Text("اجمالي الفاتورة",style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),)),
      //
      //                   Row(
      //                     children: [
      //                       Text("19306", style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
      //                       const SizedBox(
      //                         width: 5,
      //                       ),
      //                       // Spacer(),
      //                       Text("ر.س",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),
      //
      //                     ],
      //                   )
      //
      //                 ],
      //               ),
      //             ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text("أضف كود الخصم",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),)),
                      ),

                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.only(right: 35),
                          // color: Colors.black54,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp,height: 0),
                            cursorColor: Color(0xff244094),
                            // keyboardType: inputType,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              isDense: true,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xff244094),
                                ),
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 5, right: 5,bottom: 10,top: 30),
                              hintText: customerOrderInvoiceOutputsController.showBillModel.value.payment?.copon??' ',),
                            // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),

            ),

           const SizedBox(
              height: 15,
            ),

            Container(
              padding: EdgeInsets.only(top:5,bottom:5,right: 15),
              decoration: BoxDecoration(
               // borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text("صافي قيمة الفاتورة",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp,fontWeight: FontWeight.bold),),
                 SizedBox(
                   width: 60,
                 ),
                  Text(customerOrderInvoiceOutputsController.showBillModel.value.payment?.total?.toStringAsFixed(2)??'', style: TextStyle(color: Color(0xffD37A47),fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    width: 15,
                  ),
                  Text("ر.س",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Color(0xff60abd6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("عند دفع الفاتورة ستكسب ${customerOrderInvoiceOutputsController.showBillModel.value.earned_points} نقطة = ${customerOrderInvoiceOutputsController.showBillModel.value.earned_points?.toStringAsFixed(2)??''} "
                      "${customerOrderInvoiceOutputsController.showBillModel.value.payment?.currency??''}",style: TextStyle(color: Color(0xffffffff),fontSize: 13.sp),),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(customerOrderInvoiceOutputsController.showBillModel.value.earned_points?.toStringAsFixed(2)??'', style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     // Spacer(),
                  //     Text(customerOrderInvoiceOutputsController.showBillModel.value.payment?.currency??'',style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),
                  //
                  //   ],
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: [
                AdvertisersButton(text: 'دفع',width: 120.w, onPressed: (){
                  Get.toNamed("/ClientPaymentModelPage?advertiser=${Get.parameters['advertiser']}"
                      "&requestId=${customerOrderInvoiceOutputsController.showBillModel.value.id.toString()}"
                      "&total=${customerOrderInvoiceOutputsController.showBillModel.value.payment?.total.toString()??''}");
                },backgroundColor: AppColors.verifyButtonColor,textColor: AppColors.blueColor),
                AdvertisersButton(text: 'رجوع',width: 120.w, onPressed: (){
                 Get.back();
                },textColor: AppColors.blueColor,backgroundColor: AppColors.verifyButtonColor,),
              ],
            ),

            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
