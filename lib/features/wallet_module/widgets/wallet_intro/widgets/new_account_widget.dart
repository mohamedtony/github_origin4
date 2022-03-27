import 'package:advertisers/features/wallet_module/widgets/wallet_intro/controller/wallet_intro_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/widgets/account_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/wallet_intro/widgets/bank_widget.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewAccountWidget extends StatelessWidget {
  const NewAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<WalletIntroController>(
        init: WalletIntroController(),
        builder: (controller) => controller.addNewAccount == true ?  FadeIn(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("نوع الحساب ",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.black54),),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: accountType.map((e) => Expanded(child: InkWell(
                  onTap: (){
                    controller.passAccountId(e.id);
                    controller.resetWalletIntro(withUpdate: true);
                  },
                  child: Row(
                    children: [
                      e.id == controller.accountId ? selectedRadio() : unSelectedRadio(),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("${e.title}",style:const TextStyle(color: Color(0xff3a3b73)),)
                    ],
                  ),
                ))).toList(),
              ),

              // AnimatedSwitcher(
              //   duration:const Duration(seconds: 1),
              //   child: Container(
              //     key: Key('${controller.tabId}'),
              //     child: TabsWidgets[controller.tabId],
              //   ),
              // ),

              controller.accountId == "0" ? FadeIn(child: BankWidget()) : FadeIn(child: AccountWidget())

            ],
          ),
        ):Container()
    );
  }
}

// List <Widget> TabsWidgets = [
//   BankWidget(),
//   AccountWidget()
// ];