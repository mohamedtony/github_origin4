import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/redundancy_questions_controller.dart';

class RedudndancyQuestionsPage extends StatelessWidget {
  RedudndancyQuestionsPage({Key? key}) : super(key: key);
  final RedundancyQuestionsController _redundancyQuestionsController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(isFilter: true,isSideMenu: false,isSearchBar: true),
            const TitleSupportWidget(title: "الأسئلة المتكررة", image: 'images/lamba.svg'),
            SizedBox(height:33.h),
            Expanded(
              child: Obx(()=>_redundancyQuestionsController.questions.isNotEmpty?ListView(
                children:List.generate(_redundancyQuestionsController.questions.length, (index) => PartnerSuccessCard(image: 'images/person2.svg', title: _redundancyQuestionsController.questions[index].question??' ', text: _redundancyQuestionsController.questions[index].answer??' ')) ,
              ):const Center(child:  SizedBox())),
            )
          ],
        ),
      ),
    );
  }
}
