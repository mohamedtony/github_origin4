import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
class PaymentTypeWidget extends StatelessWidget {
  const PaymentTypeWidget({Key? key}) : super(key: key);

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



            InkWell(
              onTap: (){},
              child: Center(child: Container(
                width: MediaQuery.of(context).size.width * .8,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0xff71d7de),

                ),
                padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset("images/money_confirm.png",height: 30,),

                          const SizedBox(
                            width: 15,
                          ),
                          Text("تأكيد مدخلات الفاتورة",style: TextStyle(color: Color(0xff427AD0),fontSize: 16.sp,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ),



            const SizedBox(
              height: 25,
            ),

            InkWell(
              onTap: (){},
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
