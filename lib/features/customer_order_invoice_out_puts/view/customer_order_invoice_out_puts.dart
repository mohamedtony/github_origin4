import 'package:advertisers/features/customer_order_invoice/view/widgets/staticts_widget.dart';
import 'package:advertisers/features/customer_order_invoice_out_puts/order_invoice_controller.dart';
import 'package:advertisers/features/customer_order_invoice_out_puts/view/widgets/customer_order_invoice_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerOrderInvoiceOutPutsPage extends GetWidget<OrderInvoiceController>  {
  const CustomerOrderInvoiceOutPutsPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) => Scaffold(
      appBar: PreferredSize(
        child: CustomerOrderInvoiceBarWidget(
          user: controller.user,
        ),
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
            Text("نوع الإعلان / ${state!.data!.adsType!.name}",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
           const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                // border: Border(
                //   bottom: BorderSide(width: 1.0, color: Colors.grey),
                // ),
                ),

              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                      child: Text("#${state!.data!.id}",style: TextStyle(color: Color(0xffD37A47),fontSize: 14.sp),)),

              const SizedBox(
                width: 15,
              ),
                  Expanded(child: Container(
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                            width: 2.0, color: Color(0xff60abd6)),
                        right: BorderSide(
                            width: 2.0, color: Color(0xff60abd6)),
                      ),
                    ),
                    child:     Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
                        child: Text("تنفيذ الاعلان يوم ${state!.data!.executionDate}",style: TextStyle(color: const Color(0xff60abd6),fontSize: 14.sp),)),
                  ))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state!.data!.items!.length,
                      itemBuilder: (context, index) {
                        return StaticsWidget(
                          title: "${state!.data!.items![index].text}",
                          price: "${state!.data!.items![index].price}",
                          currency: "${state!.data!.payment!.currency}",
                        );
                      }),
                  ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state!.data!.discounts!.length,
                      itemBuilder: (context, index) {
                        return StaticsWidget(
                          title: "${state!.data!.discounts![index].text}",
                          price: "${state!.data!.discounts![index].price}",
                          currency: "${state!.data!.payment!.currency}",
                        );
                      }),
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
                const  SizedBox(
                    height: 7,
                  ),



                  StaticsWidget(
                    isPoint: false,
                    title: "ضريبة القيمة المضافة",
                    price: "${state!.data!.payment!.addedTax!.value}",
                    currency: "${state!.data!.payment!.currency}",
                    percent: "%${state!.data!.payment!.addedTax!.percentage}",
                  ),

                  StaticsWidget(
                    isPoint: false,
                    title: "نقاطي ${state!.data!.payment!.mypoints!.percentage} نقطة",
                    price: "${state!.data!.payment!.mypoints!.value}",
                    currency: "${state!.data!.payment!.currency}",
                    // percent: "${state!.data!.payment!.addedTax!.percentage}",
                  ),
                  StaticsWidget(
                    isPoint: false,
                    title: "ضريبة القيمة المضافة",
                    price: "${state!.data!.payment!.commission!.value}",
                    currency: "${state!.data!.payment!.currency}",
                    percent: "%${state!.data!.payment!.commission!.percentage}",
                  ),
               const   SizedBox(
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
              padding:const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [

                       const SizedBox(
                          width:  15,
                        ),
                        Expanded(child: Text("اجمالي الفاتورة",style: TextStyle(color:const Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),)),

                        Row(
                          children: [
                            Text("${state!.data!.payment!.total}", style: TextStyle(color:const Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            const SizedBox(
                              width: 5,
                            ),
                            // Spacer(),
                            Text("${state!.data!.payment!.currency}",style: TextStyle(color:const Color(0xff2B334D),fontSize: 15.sp),),

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

                 if(state!.data!.payment!.discount != 0) StaticsWidget(
                   // percent: "% 15",
                   title: "${state!.data!.payment!.copon}",
                   price: "${state!.data!.payment!.discount}",
                   currency: "${state!.data!.payment!.currency}",
                   isPoint: false,
                 ),
                ],
              ),

            ),

           const SizedBox(
              height: 15,
            ),

            Container(
              padding:const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text("صافي الفاتورة",style: TextStyle(color: Color(0xff2B334D),fontSize: 17.sp,fontWeight: FontWeight.bold),),
               const  SizedBox(
                   width: 60,
                 ),
                  Text("${state!.data!.payment!.subtotal}", style: TextStyle(color: Color(0xffD37A47),fontSize: 23.sp,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    width: 15,
                  ),
                  Text("${state!.data!.payment!.currency}",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
         if(state!.data!.payment!.mypoints!.value != 0)   Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("عند دفع الفاتورة ستكسب ${state!.data!.payment!.mypoints!.percentage} نقطة",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${state!.data!.payment!.mypoints!.value}", style: TextStyle(color: Color(0xffD37A47),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                      const SizedBox(
                        width: 5,
                      ),
                      // Spacer(),
                      Text("${state!.data!.payment!.currency}",style: TextStyle(color: Color(0xff2B334D),fontSize: 15.sp),),

                    ],
                  )
                ],
              ),
            ),

           const SizedBox(
              height: 45,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 7),
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:const Color(0xffE8E8E8),
                    ),
                    child: Center(
                      child: Text("تعديل",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp,color:const Color(0xff427AD0)),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding:const EdgeInsets.symmetric(vertical: 7),
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:const Color(0xffF9F9F9),
                    ),
                    child: Center(
                      child: Text("رجوع",style: TextStyle(fontSize: 14.sp,color:const Color(0xff427AD0)),),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}
