import 'package:advertisers/features/help_and_support/partener_success_page/controller/partener_success_controller.dart';
import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PartnerSuccessPage extends StatelessWidget {
   PartnerSuccessPage({Key? key}) : super(key: key);
  final PartnerSuccessController _partnerSuccessController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          AppBarWidget(isFilter: true,isSideMenu: false,isSearchBar: true),
          const TitleSupportWidget(title: "شركاء النجاح", image: 'images/lamba.svg'),
          SizedBox(height:33.h),
          Expanded(
            child: Obx(()=>_partnerSuccessController.partners.isNotEmpty?ListView(
              children:List.generate(_partnerSuccessController.partners.length, (index) =>  PartnerSuccessCard(image: 'images/sucess.svg', title: _partnerSuccessController.partners[index].name??' ', text:_partnerSuccessController.partners[index].content??' ' )) ,
            ):const Center(child:  SizedBox())),
          )
        ],
      ),
    ),
    );
  }
}
