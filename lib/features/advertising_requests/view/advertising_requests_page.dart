import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item_separation.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_items_wraper.dart';
import 'package:advertisers/features/advertising_requests/widgets/click_picture_widget.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisingRequestsPage extends StatefulWidget {
  AdvertisingRequestsPage({Key? key}) : super(key: key);

  @override
  State<AdvertisingRequestsPage> createState() => _AdvertisingRequestsPageState();
}

class _AdvertisingRequestsPageState extends State<AdvertisingRequestsPage>  with SingleTickerProviderStateMixin {
  // final AdvertisingRequestsController _AdvertisingRequestsController = Get.put(AdvertisingRequestsController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  PreferredSize(
        child:  AppBarWidget(
          isSideMenu: false,
          isSearchBar: true,
          isNotification: false,
          isBack: true,
          searchBarBigRight: true,
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
            Card(
              color: Colors.grey[200],
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xff4184CE)),
                        child: const Text(
                          "طلبات الاعلان",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [

                    GetBuilder<AdvertisingRequestsController>(
                      init: AdvertisingRequestsController(),
                      builder: (controller) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orders!.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: (){
                                  controller.closeSingleItemFromCheckListFunctions(orders![index].id);
                                },
                                onPanUpdate: (details) {
                                  // Swiping in right direction.
                                  if (details.delta.dx > 0) {
                                    controller.closeSingleItemFromCheckListFunctions(orders![index].id);
                                    print("Dragging in +X direction");
                                  }

                                  // Swiping in left direction.
                                  if (details.delta.dx < 0) {
                                    print("Dragging in -X direction");
                                    controller.openSingleItemFromCheckListFunctions(orders![index].id);
                                  }

                                },

                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child:  Padding(
                                        padding: const EdgeInsets.only(right: 18),
                                        child: Column(
                                          children: [
                                            Container(
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
                                                          controller.addAndRemoveOtherFromCheckListShare(orders![index].id);
                                                          print("controller.checkList == > ${controller.checkListShare} ${controller.checkListShare!.contains(orders![index].id)}");
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 10,
                                                              width: 10,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(50),
                                                                color: Colors.black54,

                                                              ),
                                                            ),
                                                            const   SizedBox(
                                                              width: 8,
                                                            ),
                                                            Container(
                                                              height: 10,
                                                              width: 10,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(50),
                                                                color: Colors.black54,

                                                              ),
                                                            ),
                                                            const   SizedBox(
                                                              width: 8,
                                                            ),
                                                            Container(
                                                              height: 10,
                                                              width: 10,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(50),
                                                                color: Colors.black54,

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
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // SizedBox(
                                                      //   width: 200,
                                                      // ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              controller.addAndRemoveOtherFromCheckProfile(orders![index].id);
                                                              print("person");
                                                            },
                                                            child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(10),
                                                                child: Image.network("${orders![index].ownerImage}",height: 80,)
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:  controller.checkListFunctions!.contains(orders![index].id) ? 25.h + 8 : 8,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              InkWell(
                                                                onTap: (){

                                                                },
                                                                child: Image.asset("images/fb.png",width: 25,),
                                                              ),
                                                            const  SizedBox(
                                                                width: 8,
                                                              ),
                                                              InkWell(
                                                                onTap: (){

                                                                },
                                                                child: Image.asset("images/snapchat.png",width: 25,),
                                                              ),
                                                              const  SizedBox(
                                                                width: 8,
                                                              ),
                                                              InkWell(
                                                                onTap: (){

                                                                },
                                                                child: Image.asset("images/insta.png",width: 25,),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const  SizedBox(
                                                        width: 15,
                                                      ),
                                                      controller.checkListFunctions!.contains(orders![index].id) ?  Container() : Expanded(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Expanded(child: Text("${orders![index].ownerName
                                                                }",style: TextStyle(fontSize: 17.sp,color: Color(0xffD37A47),height: 1.4),)),

                                                              ],
                                                            ),
                                                            Text("${orders![index].orderTitle}",style: TextStyle(fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                                            Text("الرياض - حي الياسمين",style: TextStyle(fontSize: 13.sp,color: Color(0xff4B4B95),height: 1.3),),
                                                            Text("${orders![index].orderDesc}",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),maxLines: 1,overflow: TextOverflow.ellipsis,),


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
                                              padding:const EdgeInsets.only(right: 8,left: 8,bottom: 5,top: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Card(
                                                        elevation: 5,
                                                        color: Colors.white,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(12.0),
                                                          child: SvgPicture.asset(
                                                            "images/sheet.svg",
                                                          ),
                                                        ),
                                                      ),
                                                      Text("تحت المعالجة",style: TextStyle( fontSize: 15.sp,color: Color(0xffD37A47),height: 1.5),),
                                                      const SizedBox(
                                                        width: 1,
                                                      ),
                                                    ],
                                                  )),

                                                  Container(
                                                    height: 40,
                                                    width: 1,
                                                    color: Colors.black54,
                                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                                  ),

                                                  InkWell(
                                                    onTap: (){
                                                      Get.toNamed('/CustomerOrderInvoiceOutPutsPage');
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                                      child: Text("تفاصيل الطلب",style: TextStyle(decoration: TextDecoration.underline, fontSize: 15.sp,color: Color(0xff244094),height: 1.5),),
                                                    ),
                                                  )
                                                  ,
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 45,
                                      right: MediaQuery.of(context).size.width * .73,
                                      left: 10,
                                      bottom: controller.checkListShare!.contains(orders![index].id)? 15 : double.infinity,
                                      child : controller.checkListShare!.contains(orders![index].id)?
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
                                    ),


                                    Positioned(
                                      top: 3,
                                      right: 0,
                                      bottom: 3,
                                      // left: controller.checkListFunctions!.contains(orders![index].id) ? MediaQuery.of(context).size.width * .3 :double.infinity ,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 400),
                                        width:  controller.checkListFunctions!.contains(orders![index].id) ? MediaQuery.of(context).size.width * .7 : 0,
                                        curve: Curves.fastOutSlowIn,
                                        decoration: const BoxDecoration(
                                          borderRadius:  BorderRadius.only(
                                            bottomRight:  Radius.circular(10.0),
                                            topRight:  Radius.circular(10.0),
                                          ),
                                          gradient:   LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xff6fd3de),
                                                Color(0xff486ac7),
                                              ]
                                          ),
                                        ),
                                        child: Container(

                                          padding: EdgeInsets.all(15),
                                          child: controller.checkListFunctions!.contains(orders![index].id) ? Row(
                                            children: [
                                              Expanded(
                                                child:

                                                AdvertisingRequestsSlideRightItemsWraper(
                                                  firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                    isSvg: true,
                                                    title: "دفع",
                                                    onPress: (){
                                                      print("money");
                                                    },
                                                    icon: "images/dollar-bill-line.svg",
                                                    widgetOpacity: .4,
                                                    checkOpacity: 0,
                                                  ),
                                                  secondWidget: AdvertisingRequestsSlideRightItemWidget(
                                                    isSvg: true,
                                                    title: "رفض",
                                                    onPress: (){
                                                      print("refuse");
                                                    },
                                                    icon: "images/remove-line.svg",
                                                    widgetOpacity: .4,
                                                    checkOpacity: 0,
                                                  ),
                                                ),


                                              ),


                                              AdvertisingRequestsSlideRightItemsSeparation(),



                                              Expanded(
                                                  child: AdvertisingRequestsSlideRightItemsWraper(
                                                    firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                      isSvg: true,
                                                      title: "تحويل",
                                                      onPress: (){
                                                        print("refuse");
                                                      },
                                                      icon: "images/Outline.svg",
                                                      widgetOpacity: .4,
                                                      checkOpacity: .4,
                                                    ),
                                                    secondWidget:  AdvertisingRequestsSlideRightItemWidget(
                                                      isSvg: true,
                                                      title: "تعديل",
                                                      onPress: (){
                                                        print("refuse");
                                                      },
                                                      icon: "images/edit_pen.svg",
                                                      widgetOpacity: .4,
                                                      checkOpacity: 0,
                                                    ),
                                                  )),


                                              AdvertisingRequestsSlideRightItemsSeparation(),


                                              Expanded(
                                                  child: AdvertisingRequestsSlideRightItemsWraper(
                                                    firstWidget: AdvertisingRequestsSlideRightItemWidget(
                                                      isSvg: true,
                                                      title: "تنفيذ",
                                                      onPress: (){
                                                        print("refuse");
                                                      },
                                                      icon: "images/advertising.svg",
                                                      widgetOpacity: .4,
                                                      checkOpacity: 1,
                                                    ),
                                                    secondWidget:    AdvertisingRequestsSlideRightItemWidget(
                                                      isSvg: true,
                                                      title: "الغاء",
                                                      onPress: (){
                                                        print("refuse");
                                                      },
                                                      icon: "images/annotation-visibility.svg",
                                                      widgetOpacity: 1,
                                                      checkOpacity: 0,
                                                    ),
                                                  )
                                              ),




                                            ],
                                          ):Container(),
                                        ),
                                      ),
                                    ),


                                    Positioned(
                                      top:3,
                                      right: 0,
                                      bottom: 3,
                                      child: Container(
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            gradient:   LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xff6fd3de),
                                                Color(0xff486ac7),
                                              ],
                                            ),
                                            borderRadius:  BorderRadius.only(
                                              bottomRight: const Radius.circular(10.0),
                                              topRight: const Radius.circular(10.0),
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              height: 45,
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                     Positioned(
                                        top: 5,
                                        right: 0,
                                        left: 0,
                                        bottom: 5,
                                        child: controller.checkListClickProfile!.contains(orders![index].id) ?  ClickPictureWidget(orderData: orders![index],): Container())

                                  ],
                                ),
                              ),
                            );
                          }),
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
      ownerName: "شركة مجلي أحمد بامجلي",
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
      ownerName: "شركة مجلي أحمد بامجلي",
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
      ownerName: "شركة مجلي أحمد بامجلي",
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
      ownerName: "شركة مجلي أحمد بامجلي",
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
      ownerName: "شركة مجلي أحمد بامجلي",
      ownerImage: "https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg"
  ),
];

