import 'package:advertisers/features/help_and_support/guides_videos/guides_videos_card.dart';
import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidesVideosPage extends StatelessWidget {
  const GuidesVideosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(isFilter: true,isSideMenu: false,isSearchBar: true),
            const TitleSupportWidget(title: "فيديوهات تعريفية", image: 'images/lamba.svg'),
            SizedBox(height:33.h),
            Expanded(
              child: ListView(
                children:List.generate(10, (index) => const GuidesVideosCard(text: 'كيف أقوم بإنشاء حالة مرضية قابلة للزيارة', url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', )) ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
