import 'package:advertisers/features/advertiser_invoice_input/advertiser_invoice_inputs_request.dart';
import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';


class PaymentTypeWidget extends StatelessWidget {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  AdvertisingRequestsController _advertisingRequestsController=Get.put(AdvertisingRequestsController());

  @override
  Widget build(BuildContext context) {

    PaymentType paymentTypeInside = PaymentType(
        id: 1,
        title: "الدفع خارج المنصة"
    );
    PaymentType paymentTypeOutSide = PaymentType(
        id: 2,
        title: "الدفع داخل المنصة"
    );

    return GetBuilder<AdvertiserInvoiceInputsController>(
      init: AdvertiserInvoiceInputsController(),
      builder: (controller) =>  Container(
        padding:const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,

                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("اختر نوع دفع العميل :",style: TextStyle(fontSize: 16.sp,color: Colors.white),),

                const SizedBox(
                  width: 45,
                ),

                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color:  Colors.white.withOpacity(.4)),
                  child: Center(
                    child:Text("السعر يشمل الضريبة",style: TextStyle(fontSize: 14.sp,color: Colors.white),),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),

            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(child: InkWell(
                  onTap: (){
                    controller.selectPaymentTypeRadioCheck(paymentTypeId: paymentTypeInside.id!);
                  },
                  child: Row(
                    children: [
                      controller.paymentTypeRadioCheck == paymentTypeInside.id! ? selectedRadioWhite() : unSelectedRadioWhite(),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("${paymentTypeInside.title}",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                    ],),
                )),
                Expanded(child: InkWell(
                  onTap: (){
                    controller.selectPaymentTypeRadioCheck(paymentTypeId: paymentTypeOutSide.id!);
                  },
                  child: Row(
                    children: [
                      controller.paymentTypeRadioCheck == paymentTypeOutSide.id! ? selectedRadioWhite() : unSelectedRadioWhite(),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("${paymentTypeOutSide.title}",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                    ],),
                )),
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,

                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("اضف تاريخ محدد لتنفيذ الاعلان",style: TextStyle(fontSize: 14.sp,color: Colors.white,decoration: TextDecoration.underline),),

                const SizedBox(
                  width: 20,
                ),

                Expanded(
                  child: InkWell(
                    onTap: (){

                      DateTime selectedDate = DateTime.now();

                      Future<void> _selectDate(BuildContext context) async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: ( DateTime.now()).add( Duration(days: 1)),
                            firstDate:( DateTime.now()),
                            lastDate: ( DateTime.now()).add( Duration(days: 600)));
                        // if (picked != null && picked != selectedDate)
                        if (picked != null && picked != selectedDate)
                        {
                          controller.addendAdvertisingDate(dateFormat.format(picked));
                          // controller.endAdvertisingDate = dateFormat.format(picked);
                        }
                        // selectedDate = picked;

                      }

                      _selectDate(context);
                    },
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color:const Color(0xffc7d8ef)),
                      child: controller.endAdvertisingDate.value == "" ? Center(child: Text("اختياري",style: TextStyle(fontSize: 14.sp,color:const Color(0xffaf8976),fontWeight: FontWeight.bold),)) : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.endAdvertisingDate.value,style: TextStyle(fontSize: 14.sp,color:const Color(0xffaf8976),fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 6,
                          ),
                          SvgPicture.asset("images/edit_pen.svg",
                              height: 35,
                              fit: BoxFit.fitHeight,
                              color:const Color(0xffaf8976)
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 75,
            ),

            //
            //
            // InkWell(
            //   onTap: (){},
            //   child: Center(child: Container(
            //     width: MediaQuery.of(context).size.width * .8,
            //     decoration:  BoxDecoration(
            //       borderRadius: BorderRadius.circular(7),
            //       color: Color(0xff71d7de),
            //
            //     ),
            //     padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            //     child: Center(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Row(
            //             children: [
            //               Image.asset("images/money_confirm.png",height: 30,),
            //
            //               const SizedBox(
            //                 width: 15,
            //               ),
            //               Text("تأكيد مدخلات الفاتورة",style: TextStyle(color: Color(0xff427AD0),fontSize: 16.sp,fontWeight: FontWeight.bold),),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   )),
            // ),
            //
            //
            //
            // const SizedBox(
            //   height: 25,
            // ),

            InkWell(
              onTap: (){
                showDialog(context: context,builder: (BuildContext context){

                  return AlertDialog(
                    title: Text("هل تريد ارسال التسعير الى صاحب الطلب",style: TextStyle(fontSize: 16.sp,color: Colors.black),),
                    content: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                print("_advertisingRequestsController.isRepricing==> ${_advertisingRequestsController.isRepricing}");

                                print("id===> ${controller.requestId}");
                                if(controller.billItemsCoastList.isEmpty){
                                  return;
                                }
                                if(controller.billItemsDiscountList.isEmpty){
                                  return;
                                }
                                if(controller.paymentTypeRadioCheck == 0){
                                  return;
                                }
                                if(controller.selectedAdvertisingType.id == 0){
                                  return;
                                }

                                print("_advertisingRequestsController.isRepricing==> ${_advertisingRequestsController.isRepricing}");

                                if(_advertisingRequestsController.isRepricing = false){
                                  controller.addRequestBillPost(
                                      requestId: controller.requestId,
                                      request: AdvertiserInvoiceInputsRequest(
                                        adsTypeId: 1,
                                        billItems: controller.billItemsCoastList ,
                                        discounts: controller.billItemsDiscountList,
                                        executionDate: controller.endAdvertisingDate.value,
                                        paymentMethod:controller.paymentTypeRadioCheck == paymentTypeInside.id! ?"in":"out",
                                      )
                                  );
                                }else{
                                  controller.editRequestBillPut(
                                      requestId: controller.requestId,
                                      request: AdvertiserInvoiceInputsRequest(
                                        method: "put",
                                        adsTypeId: controller.selectedAdvertisingType.id,
                                        billItems: controller.billItemsCoastList ,
                                        discounts: controller.billItemsDiscountList,
                                        executionDate: controller.endAdvertisingDate.value,
                                        paymentMethod:controller.paymentTypeRadioCheck == paymentTypeInside.id! ?"in":"out",
                                      )
                                  );
                                }

                                Navigator.pop(context);
                              },
                              child: Container(
                                // width: 115.w,
                                // padding: EdgeInsets.symmetric(horizontal: 25),
                                height: 40,
                                child: Center(
                                  child: Text(" ارسل الان",style: TextStyle(color: Color(0xff4391D4) ,fontSize: 14.sp,fontWeight: FontWeight.bold),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(.2),

                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                // width: 115.w,
                                height: 40,
                                child: Center(
                                  child: Text("رجوع",style: TextStyle(color:Colors.white,fontSize: 14.sp,),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff4391D4),
                                ),
                              ),
                            ),
                          ),

                        ],

                      ),
                    ),);
                });

              },
              child: Center(child: Container(
                width: MediaQuery.of(context).size.width * .8,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0xffe8e8e8),

                ),
                padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: Center(
                  child: Text("أرسل التسعير الآن",style: TextStyle(color: Color(0xff427AD0),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                ),
              )),
            )



          ],
        ),
      ),
    );
  }
}

