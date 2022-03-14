import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/my_orders/controller/my_orders_controller.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_item.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_item_separation.dart';
import 'package:advertisers/features/my_orders/widgets/slide_right_items_wraper.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EmployeeArchivePage extends StatefulWidget{

  const EmployeeArchivePage({Key? key}) : super(key: key);

  @override
  _EmployeeArchivePageState createState() => _EmployeeArchivePageState();
}

class _EmployeeArchivePageState extends State<EmployeeArchivePage> {


  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
        builder: (controller) =>  SingleChildScrollView(

          controller: controller.scrollController,
          child: Padding(
            padding:   EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                /// header
                Container(
                  color: Color(0xffF5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff4184CE),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: MediaQuery.of(context).size.width*.09),
                              child: Text("سجل العمليات",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color:   Colors.white,
                                    fontFamily: 'A Jannat LT, Regular'
                                ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///image & name & edit
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width*.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                   shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage('images/man img.png'),fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Text(
                                "محمد احمد حسين",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(
                                        0xff244094),
                                    fontFamily: 'A Jannat LT, Bold'
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Container(
                    color: Colors.grey.withOpacity(.5),
                    height: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5.0),
                  child: Container(
                    child:
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('الرقم',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(
                                      0xff244094),
                                  fontFamily: 'A Jannat LT, Regular'
                              )),
                        )),
                        Container(
                          height: 30,
                          color: Colors.grey.withOpacity(.5),
                          width: .5,
                        ),
                        Center(child: Text('التاريخ',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(
                                    0xff244094),
                                fontFamily: 'A Jannat LT, Regular'
                            ))),
                            Container(
                              height: 30,
                              color: Colors.grey.withOpacity(.5),
                              width: .5,
                            ),
                        Center(child: Text('الوقت',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(
                                    0xff244094),
                                fontFamily: 'A Jannat LT, Regular'
                            ))),
                            Container(
                              height: 30,
                              color: Colors.grey.withOpacity(.5),
                              width: .5,
                            ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 4),
                          child: Center(child: Text('تفاصيل العملية',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: const Color(
                                      0xff244094),
                                  fontFamily: 'A Jannat LT, Regular'
                              ))),
                        ),
                       ]),


                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Container(
                    color: Colors.grey.withOpacity(.5),
                    height: 1,
                  ),
                ),

                /// my privileged list
                Container(
                  height: MediaQuery.of(context).size.height*.67,
                  child: ListView.builder(
                       shrinkWrap: true,
                       itemCount:  controller.operationDetails.length ,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Container(
                            child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          //padding: EdgeInsets.all(15.0),
                                          child: Container(
                                            child:
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width*.16,
                                                    child: Center(child: Padding(
                                                      padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8),
                                                      child: Text('532014',
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: const Color(
                                                                  0xff717171),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          )),
                                                    )),
                                                  ),
                                                  Container(
                                                    height: 37.sp,
                                                    color: Colors.grey.withOpacity(.2),
                                                    width: .5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical:8.0),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*.185,
                                                      child: Center(child: Text('02-11-2021',
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: const Color(
                                                                  0xff717171),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ))),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 37.sp,
                                                    color: Colors.grey.withOpacity(.2),
                                                    width: .5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical:8.0),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*.176,
                                                      child: Center(child: Text('04:22pm',
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: const Color(
                                                                  0xff717171),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ))),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 37.sp,
                                                    color: Colors.grey.withOpacity(.2),
                                                    width: .5,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical:8.0),
                                                    child: Container(
                                                      width: MediaQuery.of(context).size.width*.386,
                                                      child: Align(
                                                        alignment: AlignmentDirectional.centerStart,
                                                        child: Text(controller.operationDetails[index],
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color: const Color(
                                                                    0xff717171),
                                                                fontFamily: 'A Jannat LT, Regular'
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ]),


                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal:3.0),
                                          child: Container(
                                            color: Colors.grey.withOpacity(.2),
                                            height: .5,
                                          ),
                                        ),
                                      ],
                                    );
                                }
                            ),
                          ),
                        );
                      }),
                ),


              ],
            ),
          ),
        ),
      ),



    );

  }

}