import 'package:advertisers/features/my_orders/view/my_orders_page.dart';
import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersArchivePage extends StatelessWidget {
   MyOrdersArchivePage({Key? key}) : super(key: key);
  // final MyOrdersArchiveController _myOrdersArchiveController = Get.put(MyOrdersArchiveController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar:  PreferredSize(
      //   child:  AppBarWidget(
      //     isSideMenu: false,
      //     isSearchBar: true,
      //     isNotification: false,
      //     isBack: true,
      //     searchBarBigRight: false,
      //   ),
      //   preferredSize:  Size(
      //       MediaQuery.of(context).size.width,
      //       90.0
      //   ),
      // ),
      body:  Container(
        color: Color(0xffF5F5F5),
        child: Column(
          children: [

      //       GetBuilder<MyOrdersArchiveController>(
      //         init: MyOrdersArchiveController(),
      //         builder: (controller) => Container(
      //           height: 50,
      //           child:   Padding(
      //             padding: const EdgeInsets.only(top: 12),
      //             child: Center(
      //               child: ListView.builder(
      //                   scrollDirection: Axis.horizontal,
      //                   shrinkWrap: true,
      //                   itemCount: upperTabItems!.length,
      //                   itemBuilder: (context, index) {
      //                     return InkWell(
      //                         onTap: (){
      //                           controller.passIndex(upperTabItems![index].id);
      //                           print("myOrdersArchiveController.tabId ${controller.tabId}");
      //                         },
      //                         child:  Padding(
      //                           padding: const EdgeInsets.symmetric(horizontal: 5),
      //                           child: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(7),
      //       color:upperTabItems![index].id! != controller.tabId? Colors.transparent :  Color(0xff4184CE)
      //   ),
      //   child: Text("${upperTabItems![index].title}",style: TextStyle(color:upperTabItems![index].id! != controller.tabId? Color(0xff4184CE) : Colors.white,fontSize: 16.sp),),
      // )
      //                           // SelectedTab(title: upperTabItems![index].title, id: upperTabItems![index].id,),
      //                         )
      //                     ) ;
      //                   }),
      //             ),
      //           ),
      //         )
      //       ),
      //
      //
      //       const SizedBox(
      //         height: 12,
      //       ),
      //
      //       Container(
      //         color: Colors.grey.withOpacity(.5),
      //         height: 1,
      //         width: double.infinity,
      //       ),


           Expanded(
             child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [

                  GetBuilder<MyOrdersArchiveController>(
                    init: MyOrdersArchiveController(),
                    builder: (controller) => Container(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orders!.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Stack(
                                children: [
                                  Card(
                                    elevation: 5,
                                    shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child:  Column(
                                      children: [
                                        Container(
                                          // height: 190.h,
                                          padding: const EdgeInsets.all(8),
                                          child:  Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("${orders![index].orderId}",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                                  Text("${orders![index].orderDate}",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
                                                  InkWell(
                                                    onTap: (){
                                                      controller.addAndRemoveOtherFromCheckList(orders![index].id);
                                                      print("controller.checkList == > ${controller.checkList} ${controller.checkList!.contains(orders![index].id)}");
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 6,
                                                          width: 6,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                              gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)

                                                          ),
                                                        ),
                                                        const   SizedBox(
                                                          width: 8,
                                                        ),
                                                        Container(
                                                          height: 6,
                                                          width: 6,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                              gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)

                                                          ),
                                                        ),
                                                        const   SizedBox(
                                                          width: 8,
                                                        ),
                                                        Container(
                                                          height: 6,
                                                          width: 6,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                              gradient: LinearGradient(colors: [Color(0xff427AD0),Color(0xff48DBE1)],begin: Alignment.bottomCenter,end: Alignment.topCenter,)

                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                  // Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),

                                                ],
                                              ),
                                              const  SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network("${orders![index].ownerImage}",height: 75,)
                                                  ),
                                                  const  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(child: Text("${orders![index].ownerName
                                                            }",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
                                                            InkWell(
                                                                onTap: (){
                                                                  Get.toNamed('/AdvertiserDetailsPage');
                                                                },
                                                                child: Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),)),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 7,
                                                        ),
                                                        Text("${orders![index].orderTitle}",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
                                                        Text("${orders![index].orderDesc}",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888),overflow: TextOverflow.ellipsis),maxLines: 1,),

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )

                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 1,
                                          color: Color(0xffBBBBBB66),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration:const  BoxDecoration(
                                            borderRadius:  BorderRadius.only(
                                              bottomLeft:  Radius.circular(15.0),
                                              bottomRight:  Radius.circular(15.0),
                                            ),
                                            color: Color(0xffF5F5F5),
                                          ),
                                          padding:const EdgeInsets.only(right: 8,left: 8,bottom: 0,top: 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("العرض موقوف",style: TextStyle(fontSize: 14.sp,color: Color(0xffFF9F10),height: 0),),
                                                  SizedBox(
                                                    width: 6,
                                                  ),

                                                  SvgPicture.asset(
                                                    "images/md-hand.svg",
                                                  ),
                                                ],
                                              ),
                                              Row(

                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    "images/comments-o.svg",
                                                  ),

                                                  Text("${orders![index].orderComments}",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                                ],
                                              ),

                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    "images/eye-open.svg",
                                                    height: 50,
                                                  ),
                                                  Text("${orders![index].orderViews}",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    right: MediaQuery.of(context).size.width * .73,
                                    left: 10,
                                    bottom: controller.checkList!.contains(orders![index].id)? 15 : double.infinity,
                                    child : controller.checkList!.contains(orders![index].id)?
                                    // AnimatedContainer(
                                    //   duration: const Duration(milliseconds: 500),
                                    FadeInDown(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: (){

                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,

                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white54,
                                                      borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    ),
                                                    child: Center(
                                                      child: FaIcon(FontAwesomeIcons.whatsapp,color: Color(0xff148253),size: 35.sp,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ), InkWell(
                                              onTap: (){

                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,

                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white54,
                                                      borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    ),
                                                    child: Center(
                                                      child: FaIcon(FontAwesomeIcons.commentDots,color: Colors.white,size: 35.sp,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // color: Colors.black45,
                                        decoration: const BoxDecoration(
                                          gradient:   LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xff6fd3de),
                                                Color(0xff486ac7),
                                              ]
                                          ),        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        ),
                                      ),
                                    ):Container(),
                                  )

                                ],
                              ),
                            );
                          }),
                    ),
                  ),

                ],
              ),
          ),
           ),

            // controller.tabId

            // const ProcessesWidget()
          ],
        ),
      ),
    );
  }
}








class Orders {
  int? id;
  String? orderId,
      orderDate,
      ownerName,
      ownerImage,
      orderTitle,
      orderDesc,
      orderStatus,
      orderComments,
      orderViews;
  Orders({
    this.id,
    this.orderId,
    this.orderComments,
    this.orderDate,
    this.orderDesc,
    this.orderStatus,
    this.orderTitle,
    this.orderViews,
    this.ownerName,
    this.ownerImage
});
}

List <Orders> orders = [
  Orders(
    id: 1,
    orderStatus: "active",
    orderId: "523621#",
    orderComments: "69580",
    orderDate: "12/02/2021",
    orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
    orderTitle: "منتجات غذائية",
    orderViews: "65324",
    ownerName: "حمدي الفريدي",
    ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"

  ),
  Orders(
    id: 2,
    orderStatus: "active",
    orderId: "523621#",
    orderComments: "69580",
    orderDate: "12/02/2021",
    orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
    orderTitle: "منتجات غذائية",
    orderViews: "65324",
    ownerName: "حمدي الفريدي",
      ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
  ),
  Orders(
    id: 3,
    orderStatus: "active",
    orderId: "523621#",
    orderComments: "69580",
    orderDate: "12/02/2021",
    orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
    orderTitle: "منتجات غذائية",
    orderViews: "65324",
    ownerName: "حمدي الفريدي",
      ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
  ),
  Orders(
    id: 4,
    orderStatus: "active",
    orderId: "523621#",
    orderComments: "69580",
    orderDate: "12/02/2021",
    orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
    orderTitle: "منتجات غذائية",
    orderViews: "65324",
    ownerName: "حمدي الفريدي",
      ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
  ),
  Orders(
    id: 5,
    orderStatus: "active",
    orderId: "523621#",
    orderComments: "69580",
    orderDate: "12/02/2021",
    orderDesc: "تغطية كاملة مع الحضور لافتتاح الفرع لجديد",
    orderTitle: "منتجات غذائية",
    orderViews: "65324",
    ownerName: "حمدي الفريدي",
      ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
  ),
];

