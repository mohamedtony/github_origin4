import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/advertisers_copons/widgets/copons_filter_sheet.dart';
import 'package:advertisers/features/advertisers_copons/widgets/myorders_copons_page.dart';
import 'package:advertisers/features/advertisers_copons/widgets/shops_copons.dart';
import 'package:advertisers/features/my_orders_archive/view/my_orders_archive_page.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AdvertisersCopons extends StatelessWidget {
   AdvertisersCopons({Key? key}) : super(key: key);

  AdvertisersCoponsController  advertisersCoponsController = Get.put(AdvertisersCoponsController());

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
          filterPressed: (){
            showBottomSheetForRequest(context, "shops");
                       /* if(advertisersCoponsController.tabId==1) {
                          showBottomSheetForRequest(context, "shops");
                        }else{
                          showBottomSheetForRequest(context, "app");
                        }*/
          },
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

            GetBuilder<AdvertisersCoponsController>(
                init: advertisersCoponsController,
                builder: (controller) => Container(
                  height: 50,
                  child:   Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: upperTabItems!.length,
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
                                          child: Text("${upperTabItems![index].title}",style: TextStyle(color:upperTabItems![index].id! != controller.tabId? Color(0xff4184CE) : Colors.white,fontSize: 16.sp),),
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
              child: GetBuilder<AdvertisersCoponsController>(
                init: AdvertisersCoponsController(),
                builder: (controller) => AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: Container(
                    key: Key('${controller.tabId}'),
                    child: TabsWidgets[controller.tabId],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showBottomSheetForRequest(BuildContext context,String type)  async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //maxChildSize: 0.8,
          //minChildSize: 100.0,
          //maxChildSize: 0.9,
          initialChildSize: 0.67,
          expand: false,
          builder: (context, scrollController) {
            return CoponsFilterSheet(
              scrollController: scrollController,type: type,);
          },
        );
      },
    );


    /*showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
       // expand: true,
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
       // clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return AttatchementPage(
                  scrollController: scrollController);
            },
          )
        ),
      );*/

/*      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        //barrierColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) =>  BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,
            initialChildSize: 0.67,
           // expand: true,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          )),
      );*/

    /* showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            //maxChildSize: 0.8,
            //minChildSize: 100.0,

            initialChildSize: 0.67,
            expand: false,
            builder: (context, scrollController) {
              return ActivitiesBottomSheet(
                  scrollController: scrollController);
            },
          );
        },
      );*/
  }
}


List <Widget> TabsWidgets = [

  MyOrdersCoponsPage(),
  ShopsPage(),
];


