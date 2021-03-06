import 'package:advertisers/features/help_and_support/guides_videos/controller/guides_videos_controller.dart';
import 'package:advertisers/features/help_and_support/guides_videos/guides_videos_card.dart';
import 'package:advertisers/features/help_and_support/partener_success_page/partner_success_card.dart';
import 'package:advertisers/features/help_and_support/title_support_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GuidesVideosPage extends StatelessWidget {
   GuidesVideosPage({Key? key}) : super(key: key);
  final GuidesVideosController _guidesVideosController=Get.find();
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
              child: Obx(()=>_guidesVideosController.videos.isNotEmpty?ListView(
                children:List.generate(_guidesVideosController.videos.length, (index) => GuidesVideosCard(text:_guidesVideosController.videos[index].name??' ', url: _guidesVideosController.videos[index].url??' ', )) ,
              ):const Center(child:  SizedBox(child:Text('لا يوجد بيانات')))),
            )
          ],
        ),
      ),
    );
  }
}
