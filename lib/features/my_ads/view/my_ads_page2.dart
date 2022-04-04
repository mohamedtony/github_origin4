import 'package:advertisers/features/my_ads/view/my_ads_page.dart';
import 'package:advertisers/features/my_orders_archive/view/my_orders_archive_page.dart';
import 'package:flutter/material.dart';
import 'package:advertisers/features/my_orders/view/my_orders_page.dart';
import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAdsPage2 extends StatelessWidget {
  const MyAdsPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        child:  AppBarWidget(
          isSideMenu: false,
          isSearchBar: true,
          isNotification: false,
          isBack: true,
          searchBarBigRight: false,
        ),
        preferredSize:  Size(
            MediaQuery.of(context).size.width,
            90.0
        ),
      ),
      body:  Container(
        color: Color(0xffF5F5F5),
        child: Column(
          children: [

            GetBuilder<MyOrdersArchiveController>(
                init: MyOrdersArchiveController(),
                builder: (controller) => Container(
                  height: 50,
                  child:   Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: /*upperTabItems!.length*/1,
                          itemBuilder: (context, index) {
                            return Container(
                              // color: Colors.brown,
                              width: MediaQuery.of(context).size.width * .51,
                              child: Center(
                                child: InkWell(
                                    onTap: (){
                                      controller.passIndex(upperTabItems![index].id);
                                      print("myOrdersArchiveController.tabId ${controller.tabId}");
                                    },
                                    child:  Container(
                                        // padding: const EdgeInsets.symmetric(horizontal: 25),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color:upperTabItems![index].id! != controller.tabId? Colors.transparent :  Color(0xff4184CE)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal:15.0),
                                            child: Text("اعلاناتى",//${upperTabItems![index].title}
                                              style: TextStyle(color:upperTabItems![index].id! != controller.tabId? Color(0xff4184CE) : Colors.white,fontSize: 16.sp),),
                                          ),
                                        )
                                      // SelectedTab(title: upperTabItems![index].title, id: upperTabItems![index].id,),
                                    )
                                ),
                              ),
                            ) ;
                          }),
                    ),
                  ),
                )
            ),


            const SizedBox(
              height: 12,
            ),

            Container(
              color: Colors.grey.withOpacity(.5),
              height: 1,
              width: double.infinity,
            ),

            Expanded(
              child: GetBuilder<MyOrdersArchiveController>(
                init: MyOrdersArchiveController(),
                builder: (controller) => AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: Container(
                    key: Key('${controller.tabId}'),
                    child: TabsWidgets[0],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


List <Widget> TabsWidgets = [
  MyAdsPage(),

];