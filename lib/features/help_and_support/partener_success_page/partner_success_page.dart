import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PartnerSuccessPage extends StatelessWidget {
  const PartnerSuccessPage({Key? key}) : super(key: key);

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
            child: ListView(
              children:List.generate(10, (index) => const PartnerSuccessCard(image: 'images/sucess.svg', title: 'وزارة الاعلام المرئي والمسموع', text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث')) ,
            ),
          )
        ],
      ),
    ),
    );
  }
}
