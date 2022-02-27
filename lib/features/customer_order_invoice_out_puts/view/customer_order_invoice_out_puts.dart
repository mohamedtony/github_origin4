import 'package:advertisers/features/customer_order_invoice/view/widgets/customer_order_invoice_app_bar.dart';
import 'package:advertisers/features/customer_order_invoice/view/widgets/staticts_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerOrderInvoiceOutPutsPage extends StatelessWidget {
   CustomerOrderInvoiceOutPutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomerOrderInvoiceBarWidget(),
        preferredSize: Size(MediaQuery.of(context).size.width, 110.h),
      ),
      body: Container(
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
        padding: EdgeInsets.only(right: 15,left: 15,bottom: 15),
        child: ListView(
          children: [
            Text("نوع الإعلان / تغطية مع الحضور ....(1)",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
           const SizedBox(
              height: 15,
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
                  child: Text("#569851",style: TextStyle(color: Color(0xffD37A47),fontSize: 14.sp),),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  StaticsWidget(
                    title: "إعلان تغطية خاصة بموقع التاجر",
                    price: "17500",
                    currency: "ر.س",
                  ),
                  StaticsWidget(
                    title: "تكلفة إقامة لمدة يومين",
                    price: "1000",
                    currency: "ر.س",
                  ),
                  StaticsWidget(
                    title: "تكلفة طيران",
                    price: "1200",
                    currency: "ر.س",
                  ),
              ],
              ),
            ),
          const  SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  StaticsWidget(
                    isPoint: false,
                    title: "عمولة المنصة",
                    price: "17500",
                    currency: "ر.س",
                    percent: "7 %",
                  ),
                  StaticsWidget(
                    isPoint: false,
                    title: "ضريبة القيمة المضافة",
                    price: "1000",
                    currency: "ر.س",
                    percent: "15 %",
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
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
                        Expanded(child: Text("اجمالي الفاتورة",style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),)),

                        Row(
                          children: [
                            Text("19306", style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            const SizedBox(
                              width: 5,
                            ),
                            // Spacer(),
                            Text("ر.س",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                          ],
                        )

                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       flex: 6,
                  //       child: Container(
                  //           padding: EdgeInsets.only(right: 10),
                  //           child: Text("كود الخصم",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),)),
                  //     ),
                  //
                  //     Expanded(
                  //       flex: 4,
                  //       child: Container(
                  //         padding: EdgeInsets.only(right: 35),
                  //         // color: Colors.black54,
                  //         child: TextFormField(
                  //           textAlign: TextAlign.center,
                  //           maxLines: 1,
                  //           style: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp,height: 0),
                  //           cursorColor: Color(0xff244094),
                  //           // keyboardType: inputType,
                  //           decoration: new InputDecoration(
                  //             fillColor: Colors.white,
                  //             isDense: true,
                  //             filled: true,
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(6.0),
                  //               ),
                  //               borderSide: BorderSide(
                  //                 color: Color(0xff244094),
                  //               ),
                  //             ),
                  //             contentPadding:
                  //             EdgeInsets.only(left: 5, right: 5,bottom: 10,top: 30),
                  //             hintText: "............",),
                  //           // hintText: "1236532897120",hintStyle: TextStyle(color:Color(0xff041D67) ,fontSize: 14.sp),),
                  //         ),
                  //       ),
                  //     ),
                  //
                  //   ],
                  // )
                  StaticsWidget(
                    percent: "% 15",
                    title: "رقم كود الخصم",
                    price: "6582",
                    currency: "",
                    isPoint: false,
                  ),
                ],
              ),

            ),

           const SizedBox(
              height: 15,
            ),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text("صافي الفاتورة",style: TextStyle(color: Color(0xff2B334D),fontSize: 17.sp,fontWeight: FontWeight.bold),),
                 SizedBox(
                   width: 60,
                 ),
                  Text("19306", style: TextStyle(color: Color(0xffD37A47),fontSize: 23.sp,fontWeight: FontWeight.bold),),
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
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("عند دفع الفاتورة ستكسب 19306 نقطة",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("19306", style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                      const SizedBox(
                        width: 5,
                      ),
                      // Spacer(),
                      Text("ر.س",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
