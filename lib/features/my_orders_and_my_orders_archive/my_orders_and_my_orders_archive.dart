import 'package:advertisers/features/my_orders_archive/view/my_orders_archive_page.dart';
import 'package:advertisers/features/my_orders_archive/view/myorders_archive_sheets.dart';
import 'package:flutter/material.dart';
import 'package:advertisers/features/my_orders/view/my_orders_page.dart';
import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersAndMyOrdersArchive extends StatelessWidget {
   MyOrdersAndMyOrdersArchive({Key? key}) : super(key: key);

  MyOrdersArchiveController myOrdersArchiveController = Get.put(MyOrdersArchiveController());
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
            if(myOrdersArchiveController.tabId==1) {
              showBottomSheetForRequest(context, "archive");
            }else{
              showBottomSheetForRequest(context, "orders");
            }
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

            GetBuilder<MyOrdersArchiveController>(
                init: myOrdersArchiveController,
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
              child: GetBuilder<MyOrdersArchiveController>(
                init: MyOrdersArchiveController(),
                builder: (controller) => AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: Container(
                    key: Key('${controller.tabId}'),
                    child: TabsWidgets[controller.tabId],
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     child:
            //     ListView(
            //       children: [
            //
            //         GetBuilder<MyOrdersArchiveController>(
            //           init: MyOrdersArchiveController(),
            //           builder: (controller) => Container(
            //             child: ListView.builder(
            //                 physics: const NeverScrollableScrollPhysics(),
            //                 shrinkWrap: true,
            //                 itemCount: orders!.length,
            //                 itemBuilder: (context, index) {
            //                   return  Padding(
            //                     padding: const EdgeInsets.only(bottom: 10),
            //                     child: Stack(
            //                       children: [
            //                         Card(
            //                           elevation: 5,
            //                           shape:  RoundedRectangleBorder(
            //                             borderRadius: BorderRadius.circular(15.0),
            //                           ),
            //                           child:  Column(
            //                             children: [
            //                               Container(
            //                                 padding: const EdgeInsets.all(8),
            //                                 child:  Column(
            //                                   children: [
            //                                     Row(
            //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                       children: [
            //                                         Text("${orders![index].orderId}",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
            //                                         Text("${orders![index].orderDate}",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
            //                                         InkWell(
            //                                           onTap: (){
            //                                             controller.addAndRemoveOtherFromCheckList(orders![index].id);
            //                                             print("controller.checkList == > ${controller.checkList} ${controller.checkList!.contains(orders![index].id)}");
            //                                           },
            //                                           child: Row(
            //                                             children: [
            //                                               Container(
            //                                                 height: 10,
            //                                                 width: 10,
            //                                                 decoration: BoxDecoration(
            //                                                   borderRadius: BorderRadius.circular(50),
            //                                                   color: Colors.black54,
            //
            //                                                 ),
            //                                               ),
            //                                               const   SizedBox(
            //                                                 width: 8,
            //                                               ),
            //                                               Container(
            //                                                 height: 10,
            //                                                 width: 10,
            //                                                 decoration: BoxDecoration(
            //                                                   borderRadius: BorderRadius.circular(50),
            //                                                   color: Colors.black54,
            //
            //                                                 ),
            //                                               ),
            //                                               const   SizedBox(
            //                                                 width: 8,
            //                                               ),
            //                                               Container(
            //                                                 height: 10,
            //                                                 width: 10,
            //                                                 decoration: BoxDecoration(
            //                                                   borderRadius: BorderRadius.circular(50),
            //                                                   color: Colors.black54,
            //
            //                                                 ),
            //                                               ),
            //
            //                                             ],
            //                                           ),
            //                                         )
            //                                         // Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
            //
            //                                       ],
            //                                     ),
            //                                     const  SizedBox(
            //                                       height: 12,
            //                                     ),
            //                                     Row(
            //                                       crossAxisAlignment: CrossAxisAlignment.start,
            //                                       children: [
            //                                         ClipRRect(
            //                                             borderRadius: BorderRadius.circular(10),
            //                                             child: Image.network("${orders![index].ownerImage}",height: 120,)
            //                                         ),
            //                                         const  SizedBox(
            //                                           width: 15,
            //                                         ),
            //                                         Expanded(
            //                                           child: Column(
            //                                             mainAxisAlignment: MainAxisAlignment.start,
            //                                             crossAxisAlignment: CrossAxisAlignment.start,
            //                                             children: [
            //                                               Row(
            //                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                                 children: [
            //                                                   Expanded(child: Text("${orders![index].ownerName
            //                                                   }",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
            //                                                   Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
            //                                                 ],
            //                                               ),
            //                                               const SizedBox(
            //                                                 height: 7,
            //                                               ),
            //                                               Text("${orders![index].orderTitle}",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
            //                                               Text("${orders![index].orderDesc}",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),),
            //
            //                                             ],
            //                                           ),
            //                                         )
            //                                       ],
            //                                     )
            //
            //                                   ],
            //                                 ),
            //                               ),
            //                               Container(
            //                                 width: double.infinity,
            //                                 height: 1,
            //                                 color: Color(0xffBBBBBB66),
            //                               ),
            //                               Container(
            //                                 width: double.infinity,
            //                                 decoration:const  BoxDecoration(
            //                                   borderRadius:  BorderRadius.only(
            //                                     bottomLeft:  Radius.circular(15.0),
            //                                     bottomRight:  Radius.circular(15.0),
            //                                   ),
            //                                   color: Color(0xffF5F5F5),
            //                                 ),
            //                                 padding:const EdgeInsets.only(right: 8,left: 8,bottom: 0,top: 8),
            //                                 child: Row(
            //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                   children: [
            //                                     Row(
            //                                       crossAxisAlignment: CrossAxisAlignment.center,
            //                                       mainAxisAlignment: MainAxisAlignment.center,
            //                                       children: [
            //                                         Text("العرض موقوف",style: TextStyle(fontSize: 14.sp,color: Color(0xffFF9F10),height: 0),),
            //                                         SizedBox(
            //                                           width: 6,
            //                                         ),
            //
            //                                         SvgPicture.asset(
            //                                           "images/md-hand.svg",
            //                                         ),
            //                                       ],
            //                                     ),
            //                                     Row(
            //
            //                                       crossAxisAlignment: CrossAxisAlignment.center,
            //                                       mainAxisAlignment: MainAxisAlignment.start,
            //                                       children: [
            //                                         SvgPicture.asset(
            //                                           "images/comments-o.svg",
            //                                         ),
            //
            //                                         Text("${orders![index].orderComments}",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
            //                                       ],
            //                                     ),
            //
            //                                     Row(
            //                                       crossAxisAlignment: CrossAxisAlignment.center,
            //                                       mainAxisAlignment: MainAxisAlignment.start,
            //                                       children: [
            //                                         SvgPicture.asset(
            //                                           "images/eye-open.svg",
            //                                           height: 50,
            //                                         ),
            //                                         Text("${orders![index].orderViews}",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
            //                                       ],
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //
            //                             ],
            //                           ),
            //                         ),
            //                         Positioned(
            //                           top: 45,
            //                           right: MediaQuery.of(context).size.width * .73,
            //                           left: 10,
            //                           bottom: controller.checkList!.contains(orders![index].id)? 15 : double.infinity,
            //                           child : controller.checkList!.contains(orders![index].id)?
            //                           // AnimatedContainer(
            //                           //   duration: const Duration(milliseconds: 500),
            //                           Container(
            //                             child: Column(
            //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                               crossAxisAlignment: CrossAxisAlignment.center,
            //                               children: [
            //                                 InkWell(
            //                                   onTap: (){
            //
            //                                   },
            //                                   child: Row(
            //                                     mainAxisAlignment: MainAxisAlignment.center,
            //
            //                                     children: [
            //                                       Container(
            //                                         padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            //                                         decoration: const BoxDecoration(
            //                                           color: Colors.white54,
            //                                           borderRadius: BorderRadius.all(
            //                                             Radius.circular(10.0),
            //                                           ),
            //                                         ),
            //                                         child: Center(
            //                                           child: FaIcon(FontAwesomeIcons.whatsapp,color: Color(0xff148253),size: 35.sp,),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ), InkWell(
            //                                   onTap: (){
            //
            //                                   },
            //                                   child: Row(
            //                                     mainAxisAlignment: MainAxisAlignment.center,
            //
            //                                     children: [
            //                                       Container(
            //                                         padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
            //                                         decoration: const BoxDecoration(
            //                                           color: Colors.white54,
            //                                           borderRadius: BorderRadius.all(
            //                                             Radius.circular(10.0),
            //                                           ),
            //                                         ),
            //                                         child: Center(
            //                                           child: FaIcon(FontAwesomeIcons.commentDots,color: Colors.white,size: 35.sp,),
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             // color: Colors.black45,
            //                             decoration: const BoxDecoration(
            //                               gradient:   LinearGradient(
            //                                   begin: Alignment.topRight,
            //                                   end: Alignment.bottomRight,
            //                                   colors: [
            //                                     Color(0xff6fd3de),
            //                                     Color(0xff486ac7),
            //                                   ]
            //                               ),        borderRadius: BorderRadius.all(
            //                               Radius.circular(10.0),
            //                             ),
            //                             ),
            //                           ):Container(),
            //                         )
            //
            //                       ],
            //                     ),
            //                   );
            //                 }),
            //           ),
            //         ),
            //
            //       ],
            //     ),
            //   ),
            // ),

            // controller.tabId

            // const ProcessesWidget()
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
            return MyOrdersArchiveSheets(
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
  MyOrdersPage(),
  MyOrdersArchivePage(),
  // PullsWidget(),
  // PointsWidget()

];