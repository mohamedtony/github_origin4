import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddingItemsWidget extends StatelessWidget {
  const AddingItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return     GetBuilder<AdvertiserInvoiceInputsController>(
        init: AdvertiserInvoiceInputsController(),
        builder: (controller) => Container(
          padding:const EdgeInsets.only(top: 20,bottom: 20),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                    onTap: (){
                      controller.clickCostDiscount(isCost: false);
                      showAlertDialog(context,false);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 25,width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color:const Color(0xff6dde89)),
                          child:const Icon(Icons.add,size: 20,color: Colors.white,),
                        ),

                        const SizedBox(
                          width: 15,
                        ),
                        Text("إضافة خصم",style: TextStyle(color: Colors.white,fontSize: 15.sp,decoration: TextDecoration.underline),)
                      ],
                    ),
                  )),
              InkWell(
                onTap: (){
                  controller.clickCostDiscount(isCost: true);
                  showAlertDialog(context,true);
                },
                child: Row(
                  children: [
                    Container(
                      height: 25,width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color:const Color(0xff6dde89)),
                      child: const Icon(Icons.add,size: 20,color: Colors.white,),
                    ),

                    const SizedBox(
                      width: 15,
                    ),
                    Text("إضافة عنصر تكلفة",style: TextStyle(color: Colors.white,fontSize: 15.sp,decoration: TextDecoration.underline),)
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}


showAlertDialog(BuildContext context,bool isCost) {
  final AdvertiserInvoiceInputsController _advertiserInvoiceInputsController = Get.put(AdvertiserInvoiceInputsController());


  // set up the button
  // Widget okButton = TextButton(
  //   child:const Text("حفظ"),
  //   onPressed: () {
  //     _advertiserInvoiceInputsController.onDialogOkButtonClick(isCost: isCost);
  //     Navigator.pop(context);
  //   },
  // );

  // set up the AlertDialog





  AlertDialog alert = AlertDialog(
    // title: Text("My title"),


    insetPadding:const EdgeInsets.symmetric(horizontal: 10),
    content: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<AdvertiserInvoiceInputsController>(
              init: AdvertiserInvoiceInputsController(),
              builder: (controller) => Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("${controller.dialogStrings.dialogName}",style: TextStyle(color: Color(0xff041D67),fontSize: 16.sp),),

                  const SizedBox(
                    height: 15,
                  ),



                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                      child: TextFormField(
                        controller: controller.name,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: '${controller.dialogStrings.title}',
                            contentPadding: const
                            EdgeInsets.all(0),
                            hintStyle: TextStyle(fontSize: 14.sp,color: Colors.grey)),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                      child: TextFormField(
                        controller: controller.inputValue,
                        cursorColor: Colors.black,
                        keyboardType:const TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false),
                        decoration:  InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: '${controller.dialogStrings.value}',
                            contentPadding: const
                            EdgeInsets.all(0),
                            hintStyle: TextStyle(fontSize: 14.sp,color: Colors.grey)),
                      ),
                    ),
                  ),
                ],
              )
          ),
         const SizedBox(
           height: 35,
         ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  _advertiserInvoiceInputsController.onDialogOkButtonClick(isCost: isCost);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  height: 40,
                  child: Center(
                    child: Text("حفظ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff4391D4),
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  height: 40,
                  child: Center(
                    child: Text("الغاء",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:const Color(0xff4391D4),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    // actions: [
    //   okButton,
    // ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}