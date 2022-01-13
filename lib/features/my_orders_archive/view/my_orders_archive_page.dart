import 'package:advertisers/features/my_orders_archive/controller/my_orders_archive_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/select_tab.dart';
import 'package:advertisers/features/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersArchivePage extends StatelessWidget {
   MyOrdersArchivePage({Key? key}) : super(key: key);
  // final MyOrdersArchiveController _myOrdersArchiveController = Get.put(MyOrdersArchiveController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: upperTabItems!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: (){
                                controller.passIndex(upperTabItems![index].id);
                                print("myOrdersArchiveController.tabId ${controller.tabId}");
                              },
                              child:  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
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
             child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 5,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                    Text("12/02/2021",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
                                    Row(
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
                                        child: Image.network("https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg",height: 120,)
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
                                              Expanded(child: Text("حمدي الفريدي",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
                                              Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text("منتجات غذائية",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
                                          Text("تغطية كاملة مع الحضور لافتتاح الفرع لجديد",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),),

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

                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
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
                                    Text("523621",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 5,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                    Text("12/02/2021",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
                                    Row(
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
                                        child: Image.network("https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg",height: 120,)
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
                                              Expanded(child: Text("حمدي الفريدي",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
                                              Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text("منتجات غذائية",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
                                          Text("تغطية كاملة مع الحضور لافتتاح الفرع لجديد",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),),

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

                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
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
                                    Text("523621",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 5,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                    Text("12/02/2021",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
                                    Row(
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
                                        child: Image.network("https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg",height: 120,)
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
                                              Expanded(child: Text("حمدي الفريدي",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
                                              Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text("منتجات غذائية",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
                                          Text("تغطية كاملة مع الحضور لافتتاح الفرع لجديد",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),),

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

                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
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
                                    Text("523621",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 5,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff4B4B95)),),
                                    Text("12/02/2021",style: TextStyle(fontSize: 15.sp,color: Color(0xff888888)),),
                                    Row(
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
                                        child: Image.network("https://roshah.com/wp-content/uploads/2018/04/2986-1.jpg",height: 120,)
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
                                              Expanded(child: Text("حمدي الفريدي",style: TextStyle(fontSize: 17.sp,color: Color(0xff000000)),)),
                                              Text("تفاصيل الطلب",style: TextStyle( decoration: TextDecoration.underline,fontSize: 15.sp,color: Color(0xff244094)),),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text("منتجات غذائية",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95)),),
                                          Text("تغطية كاملة مع الحضور لافتتاح الفرع لجديد",style: TextStyle(fontSize: 14.sp,color: Color(0xff888888)),),

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

                                    Text("#523621",style: TextStyle( decoration: TextDecoration.underline,fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
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
                                    Text("523621",style: TextStyle(fontSize: 14.sp,color: Color(0xff4B4B95),height: 0),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ) ,
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






List <Widget> TabsWidgets = [
  ProcessesWidget(),
  ShippingWidget(),
  // PullsWidget(),
  // PointsWidget()

];



