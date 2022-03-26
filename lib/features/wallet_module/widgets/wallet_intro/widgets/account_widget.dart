import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                      items: percentages.map((AccountType value) {
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

                    child: Text("رقم رقم الجوال",style: TextStyle(color: Color(0xff3a3b73)),)),
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

                    child: Text("اسم العرض",style: TextStyle(color: Color(0xff3a3b73)),)),
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

          ],
        )
    );
  }
}
