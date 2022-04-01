import 'package:advertisers/features/wallet_module/widgets/wallet_intro/add_account_request/add_account_request.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BankWidget extends StatelessWidget {
   BankWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return GetBuilder<WalletIntroController>(
        init: WalletIntroController(),
        builder: (controller) =>  Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Text("اسم قناه الدفع",style:TextStyle(color: Color(0xff3a3b73)),)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 7,
                  child: Card(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3,
                    child: DropdownButton<AccountType>(
                      underline: const SizedBox.shrink(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(controller
                            .paymentChannelName!.title!),
                      ),
                      items: banks.map((AccountType value) {
                        return DropdownMenuItem<AccountType>(
                          value: value,
                          child: Text(value.title!),alignment: Alignment.center,
                        );
                      }).toList(),
                      // value: _selectedLocation,
                      // isDense: true,
                      isExpanded: true,
                      onChanged: (newVal) {
                        controller.passToDropDown(newVal!);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                    flex: 3,

                    child: Text("رقم البطاقة",style: TextStyle(color: Color(0xff3a3b73)),)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 7,

                  child: Card(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3,
                    child:  TextField(
                      controller: controller.cardNumberController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      textAlignVertical:
                      TextAlignVertical.center,
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(right: 40.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(70.0),
                            borderSide:const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.grey[350]),
                          // hintText: 'عنوان الرابط',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const   Expanded(
                    flex: 3,

                    child: Text("الاسم",style: TextStyle(color: Color(0xff3a3b73)),)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 7,

                  child: Card(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3,
                    child:  TextField(
                      controller:controller.nameController,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      textAlignVertical:
                      TextAlignVertical.center,
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.only(right: 40.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(70.0),
                            borderSide:const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Colors.grey[350]),
                          // hintText: 'عنوان الرابط',
                          fillColor: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const   Expanded(
                    flex: 3,

                    child: Text("التاريخ والكود",style: TextStyle(color: Color(0xff3a3b73)),)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: (){
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context).copyWith().size.height*0.3,
                              color: Colors.white,
                              child:  Container(
                                padding:const EdgeInsets.symmetric(vertical: 15),
                                child: ListView.builder(
                                  // padding: const EdgeInsets.only(bottom: 16),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: months.length,
                                  itemBuilder: (_, index) => InkWell(
                                    onTap: (){
                                      controller.month = months[index];
                                      controller.update();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        padding:const EdgeInsets.symmetric(vertical: 7),
                                        child: Center(child: Text("${months[index]}",style:const TextStyle(fontSize: 18),))),
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    },
                    child: Card(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 3,
                      child:   Center(
                        child: Padding(
                          padding:const EdgeInsets.symmetric(vertical: 12),
                          child:  Text(controller.month == -1 ?"شهر" : "${controller.month}" ,style: TextStyle(color: controller.month == -1 ? Colors.black26:Colors.black),),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: (){
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context).copyWith().size.height*0.3,
                              color: Colors.white,
                              child:  Container(
                                padding:const EdgeInsets.symmetric(vertical: 15),
                                child: ListView.builder(
                                  // padding: const EdgeInsets.only(bottom: 16),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: years.length,
                                  itemBuilder: (_, index) => InkWell(
                                    onTap: (){
                                      controller.year = years[index];
                                      controller.update();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        padding:const EdgeInsets.symmetric(vertical: 7),
                                        child: Center(child:Text("${years[index]}" ,style:const TextStyle(fontSize: 18),))),
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    },
                    child: Card(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 3,
                      child:   Center(
                        child:Padding(
                          padding:const  EdgeInsets.symmetric(vertical: 12),
                         child: Text(controller.year == -1 ?"سنة" : "${controller.year}",style: TextStyle(color: controller.year == -1 ? Colors.black26:Colors.black),),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3,
                    child:   Center(
                      child:Padding(
                        padding:const  EdgeInsets.symmetric(vertical: 9),
                        child: TextField(
                          controller: controller.cvvController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          textAlignVertical:
                          TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.only(right: 10.0),
                              isCollapsed: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(70.0),
                                borderSide:const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey[350]),
                              hintText: 'الكود',
                              fillColor: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const  SizedBox(
              height: 60,
            ),

            Row(
              children: [
                Expanded(
                    child: InkWell(
                      onTap: (){
                        if( controller.paymentChannelName!.id == "-1"){
                          Get.snackbar(
                            "برجاء تحديد قناه الدفع",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(controller.cardNumberController.text.isEmpty){
                          Get.snackbar(
                            "برجاء كتابة رقم البطاقة",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }

                        if(controller.nameController.text.isEmpty){
                          Get.snackbar(
                            "برجاء كتابة الاسم",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(controller.year == -1 || controller.month == -1){
                          Get.snackbar(
                            "برجاء تحديد تاريخ الصلاحية",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(controller.cvvController.text.isEmpty){
                          Get.snackbar(
                            "برجاء كتابة الكود",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(!controller.cardNumberController.text!.isNumericOnly){
                          Get.snackbar(
                            "رقم البطاقة يجب ان يكون ارقام فقط",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(!controller.cvvController.text!.isNumericOnly){
                          Get.snackbar(
                            "الكود يجب ان يكون ارقام فقط",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(!controller.nameController.text!.isAlphabetOnly){
                          Get.snackbar(
                            "الاسم يجب ان يكون حروف فقط",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }

                        Info info = Info(
                          expirationYear: "${controller.year}",
                          expirationMonth: "${controller.month}",
                          cvv: controller.cvvController.text,
                          cardUsername: controller.nameController.text,
                          cardNumber: controller.cardNumberController.text,
                        );
                        controller.addAccountService(
                            request: AddAccountRequest(
                              type: controller.paymentChannelName!.id,
                              info: info,
                            )
                        );
                },
                  child: Container(
                    height: 40,
                    child: const Center(
                      child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffE8E8E8),
                    ),
                  ),)),

                const  SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        controller.addNewAccount = false;
                        controller.resetWalletIntro(withUpdate: true);
                },
                  child: Container(
                    height: 40,
                    child: const Center(
                      child:  Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff4391D4),

                    ),
                  ),)) ,
              ],
            ),
            const  SizedBox(
              height: 15,
            ),
          ],
        )
    );
  }
}
