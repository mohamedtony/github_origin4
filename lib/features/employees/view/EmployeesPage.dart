import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/view/AddEmployeePage.dart';

import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeesPage extends StatefulWidget{

  const EmployeesPage({Key? key}) : super(key: key);

  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 93.h),
      ),
      body: GetBuilder<EmployeesController>(
        init: EmployeesController(),
        builder: (controller) => SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: () async {
            final result = await controller.getRequestsData(isRefresh: true);
            if (result) {
              controller.refreshController.refreshCompleted();
            } else {
              controller.refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await controller.getRequestsData();
            if (result) {
              controller.refreshController.loadComplete();
            } else {
              controller.refreshController.loadFailed();
            }
          },
          child: Column(
            children: [
              Container(
                color: Color(0xffF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff4184CE),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: MediaQuery.of(context).size.width*.09),
                            child: Text("الموظفون",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color:   Colors.white,
                                  fontFamily: 'A Jannat LT, Regular'
                              ),),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/employees.png'),fit:  BoxFit.fill,

                            )
                          ),

                            width: 36,
                            height: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.755,
                child: ListView.builder(
                  //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //itemCount: orders!.length,
                    itemCount:  controller.employeesJobs.length ,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                        child: GestureDetector(
                          onTap: () {
                            //  Get.toNamed('/AddEmployeePage');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddEmployeePage(),
                              ),
                            );
                            // controller.currentIndex.value = index;
                            // //controller.closeSingleItemFromCheckListFunctions(controller.orders![index].id);
                            // if (controller.currentIndex.value  == index) {
                            //   controller.closeSingleItemFromCheckListFunctions(
                            //       controller.myRequestsAsClient[index].id);
                            // }
                          },
                          onPanUpdate: (details) {
                            controller.currentIndex.value  = index;
                            // Swiping in right direction.
                            if (details.delta.dx > 0) {
                              // controller.closeSingleItemFromCheckListFunctions(orders![index].id);
                              if (controller.currentIndex.value  == index) {
                                controller.closeSingleItemFromCheckListFunctions(
                                    controller.myRequestsAsClient[index].id);
                                print("Dragging in +X direction");
                              }
                            }

                            // Swiping in left direction.
                            if (details.delta.dx < 0) {
                              if (controller.currentIndex.value  == index) {
                                print("Dragging in -X direction");
                                //controller.openSingleItemFromCheckListFunctions(orders![index].id);
                                controller.openSingleItemFromCheckListFunctions(
                                    controller.myRequestsAsClient[index].id);
                              }
                            }
                          },
                          child:  Padding(
                                padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: const Color(0xff4494D5),width: .5)
                                  ),
                                  child: Container(

                                    padding: const EdgeInsets.only(left:8,),
                                    child: StreamBuilder<Object>(
                                      stream: null,
                                      builder: (context, snapshot) {
                                        return
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [

                                                /// left marker
                                                Padding(
                                                  padding: const EdgeInsets.only(left:4.0),
                                                  child: Container(
                                                    width: 10,
                                                    height: controller.employeesJobs[index]=="مسؤول / أدمن"?MediaQuery.of(context).size.height*.17:MediaQuery.of(context).size.height*.15,
                                                    decoration:const BoxDecoration(
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),bottomRight: Radius.circular(10.0),),
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xff6fd3de),
                                                            Color(0xff486ac7),
                                                          ]),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(vertical:38.0),
                                                      child: SvgPicture.asset('images/dashed_icon.svg',
                                                        width: 2,
                                                        height: 4, color: Colors.white,fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(

                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [


                                                        /// image
                                                        InkWell(
                                                          onTap: () {
                                                            print("person");
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 8,right: 6),
                                                            child: Container(
                                                                width: 65,
                                                                height: 65,
                                                               decoration: BoxDecoration(
                                                                 borderRadius:
                                                                 BorderRadius.circular(10),
                                                                 image: DecorationImage(image: AssetImage('images/man img.png')/*NetworkImage("https://picsum.photos/200/300")*/,scale: 1,fit: BoxFit.fill)
                                                               ),
                                                            ),
                                                          ),
                                                        ),

                                                        Row(
                                                           mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            /// name & id & phone
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [

                                                                Padding(
                                                                  padding: const EdgeInsets.only(top:8.0),
                                                                  child: Text(
                                                                    "محمد احمد حسين",//${controller.myRequestsAsClient[index].advertiser?.username ?? ''}
                                                                    style: TextStyle(
                                                                        fontSize: 14.sp,
                                                                        color: const Color(
                                                                            0xff244094),
                                                                      fontFamily: 'A Jannat LT, Bold'
                                                                         ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top:6.0),
                                                                  child: Text(
                                                                    "#rashed",//${controller.myRequestsAsClient[index].advertiser?.username ?? ''}
                                                                    textDirection: TextDirection.ltr,
                                                                    style: TextStyle(

                                                                        fontSize: 11.sp,
                                                                        color: const Color(0xffA7ADB4),
                                                                        fontFamily: 'A Jannat LT, Regular'
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top:8.0),
                                                                  child: Text(
                                                                    "0545459314",//${controller.myRequestsAsClient[index].advertiser?.username ?? ''}
                                                                    style: TextStyle(
                                                                        fontSize: 12.sp,
                                                                        color: const Color(
                                                                            0xff244094),
                                                                        fontFamily: 'A Jannat LT, Bold'
                                                                    ),
                                                                  ),
                                                                ),

                                                              ],
                                                            ),
                                                            /// spacer
                                                            Container(width: MediaQuery.of(context).size.width*.14,),
                                                            /// employee type
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    //
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:8.0,left: 12),
                                                                      child: SvgPicture.asset(controller.employeesJobs[index]=="موظف خارجي"?'images/hand.svg':'images/android-done-all-green.svg',
                                                                        width: 50,
                                                                        height: 30,
                                                                        fit: BoxFit.fill,
                                                                      ),
                                                                    ),

                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:8.0),
                                                                      child: Text(
                                                                        controller.employeesJobs[index]=="موظف خارجي"? 'موقوف':"نشط",//${controller.myRequestsAsClient[index].advertiser?.username ?? ''}
                                                                        style: TextStyle(
                                                                            fontSize: 15.sp,
                                                                            color: controller.employeesJobs[index]=="موظف خارجي"? const Color(0xffFFB300):const Color(
                                                                                0xff0B9C2D),
                                                                            fontFamily: 'A Jannat LT, Regular'
                                                                        ),
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),

                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      color: controller.employeesJobs[index]=="موظف خارجي"?const Color(0xffD37A47):controller.employeesJobs[index]=="مسؤول / أدمن"?Colors.white:const Color(0xff4184CE),
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      border: controller.employeesJobs[index]=="مسؤول / أدمن"? Border.all(color: const Color(0xff4494D5)):Border(),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
                                                                    child: Text(controller.employeesJobs[index],
                                                                      style: TextStyle(
                                                                          fontSize: 14.sp,
                                                                          color:  controller.employeesJobs[index]=="مسؤول / أدمن"?const Color(0xff4494D5): Colors.white,
                                                                          fontFamily: 'A Jannat LT, Regular'
                                                                      ),),
                                                                  ),
                                                                ),

                                                                controller.employeesJobs[index]=="مسؤول / أدمن"?Container(
                                                                  child:   Center(child: Text('صلاحية كاملة',style: TextStyle(color:const Color(0xff00C3FF),fontSize:11.sp),)),
                                                                ):Container(),

                                                              ],
                                                            )
                                                          ],
                                                        ),



                                                      ],
                                                    ),

                                                    /// job description
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom:8.0,left: 8,right: 8),
                                                      child: Text(
                                                        "مسؤول علاقات عامة وتسويق",//${controller.myRequestsAsClient[index].advertiser?.username ?? ''}
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: const Color(
                                                                0xff244094),
                                                            fontFamily: 'A Jannat LT, Regular'
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),


                                              ],
                                            );
                                      }
                                    ),
                                  ),
                                ),
                              ),


                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom:64.0),
          child: InkWell(
            onTap: (){
            //  Get.toNamed('/AddEmployeePage');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEmployeePage(),
                ),
              );
              },
            child: SvgPicture.asset('images/add-employee.svg',
              width: MediaQuery.of(context).size.width*.23,
              height:MediaQuery.of(context).size.width*.23,
              fit: BoxFit.fill,
            ),
          ),
        )

    );

  }

}