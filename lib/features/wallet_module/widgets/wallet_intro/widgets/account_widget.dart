import 'package:advertisers/features/wallet_module/Response/charge_response.dart' hide Info;
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/add_account_request/add_account_request.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

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
                      items: accounts.map((AccountType value) {
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

                    child: Text("رقم الجوال",style: TextStyle(color: Color(0xff3a3b73)),)),
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
                      controller: controller.mobileController,
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
            // Row(
            //   children: [
            //     const   Expanded(
            //         flex: 3,
            //
            //         child: Text("اسم العرض",style: TextStyle(color: Color(0xff3a3b73)),)),
            //     const SizedBox(
            //       width: 15,
            //     ),
            //     Expanded(
            //       flex: 7,
            //
            //       child: Card(
            //         shape:  RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //         ),
            //         elevation: 3,
            //         child:  TextField(
            //           textAlign: TextAlign.start,
            //           textAlignVertical:
            //           TextAlignVertical.center,
            //           decoration: InputDecoration(
            //               contentPadding:
            //               const EdgeInsets.only(right: 40.0),
            //               // isCollapsed: true,
            //               border: OutlineInputBorder(
            //                 borderRadius:
            //                 BorderRadius.circular(70.0),
            //                 borderSide:const BorderSide(
            //                   width: 0,
            //                   style: BorderStyle.none,
            //                 ),
            //               ),
            //               filled: true,
            //               hintStyle: TextStyle(
            //                   color: Colors.grey[350]),
            //               // hintText: 'عنوان الرابط',
            //               fillColor: Colors.white70),
            //         ),
            //       ),
            //     ),
            //
            //     const  SizedBox(
            //       height: 60,
            //     ),
            //
            //     Row(
            //       children: [
            //         Expanded(child: InkWell(onTap: (){
            //
            //         },
            //           child: Container(
            //             height: 40,
            //             child: const Center(
            //               child: Text("حفظ",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
            //             ),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               color: const Color(0xffE8E8E8),
            //             ),
            //           ),)),
            //
            //         const  SizedBox(
            //           width: 20,
            //         ),
            //         Expanded(child: InkWell(onTap: (){
            //         },
            //           child: Container(
            //             height: 40,
            //             child: const Center(
            //               child:  Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
            //             ),
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               color: const Color(0xff4391D4),
            //
            //             ),
            //           ),)) ,
            //       ],
            //     ),
            //     const  SizedBox(
            //       height: 15,
            //     ),
            //
            //   ],
            // ),


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
                        if(controller.mobileController.text.isEmpty){
                          Get.snackbar(
                            "برجاء كتابة رقم الجوال",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(!controller.mobileController.text.isNumericOnly){
                          Get.snackbar(
                            "رقم الجوال يجب ان يكون ارقام فقط",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }
                        if(controller.mobileController.text.length < 7){
                          Get.snackbar(
                            "برجاء ادخال رقم جوال صحيح",
                            "",
                            snackPosition: SnackPosition.BOTTOM,);
                          return;
                        }

                        Info info = Info(
                          mobile: controller.mobileController.text
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
