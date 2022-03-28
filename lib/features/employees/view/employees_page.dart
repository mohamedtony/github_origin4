import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/advertiser_invoice_input_page.dart';
import 'package:advertisers/features/advertiser_order_details/controller/advertiser_order_details_controller.dart';
import 'package:advertisers/features/advertising_requests/controller/advertising_requests_controller.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_item_separation.dart';
import 'package:advertisers/features/advertising_requests/widgets/advertising_requests_slide_right_items_wraper.dart';
import 'package:advertisers/features/advertising_requests/widgets/click_picture_widget.dart';
import 'package:advertisers/features/advertising_requests/widgets/filter_bottom_sheet.dart';
import 'package:advertisers/features/advertising_requests/widgets/single_statistics_item.dart';
import 'package:advertisers/features/customer_order_invoice_out_puts/order_invoice_controller.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/view/AddEmployeePage.dart';
import 'package:advertisers/features/employees/view/employee_slide_right_items_action.dart';
import 'package:advertisers/features/reason_rejecting_advertisement/controller/reason_rejecting_advertisement_controller.dart';
import 'package:advertisers/features/tax_settings/view/widgets/tax_settings_app_bar_widget.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/reason_rejecting_advertisement_customer/controller/reason_rejecting_advertisement_customer_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeesPage extends GetWidget<EmployeesController>  {

  final EmployeesController  controller = Get.put(EmployeesController());


  // ScrollController? scrollController;
  launchURL(urlLink) async {
    var url = urlLink;
    if(url != null){
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) =>  Scaffold(
              appBar:  PreferredSize(
                child:  AppBarWidget(
              controller: controller.searchController,
              isSideMenu: false,
              isSearchBar: false,
              isNotification: false,
              isBack: true,
              searchBarBigRight: false,
              ),
              preferredSize:  Size(
                  MediaQuery.of(context).size.width,
                  90.0
              ),
          ),

              body: controller.myEmployees.isNotEmpty ? Container(
            color:const Color(0xffF5F5F5),
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
                Expanded(
                  // height: 400,
                  child: Container(
                    padding:const EdgeInsets.all(10),
                    child: SmartRefresher(
                      controller: controller.refreshController,
                      enablePullUp: true,
                      onRefresh: () async {
                        /*final result = await */controller.fetchEmployeesList();
                        if (controller.myEmployees.isNotEmpty) {
                          controller.refreshController.refreshCompleted();
                        } /*else {
                          controller.refreshController.refreshFailed();
                        }*/
                      },
                      onLoading: () async {
                        /*final result = await*/ controller.fetchEmployeesList();
                        if (controller.myEmployees.isNotEmpty) {
                          controller.refreshController.loadComplete();
                        } /*else {
                          controller.refreshController.loadFailed();
                        }*/
                      },
                      child: ListView(
                        controller: controller.scrollController,
                        // primary: true,
                        children: [

                          GetBuilder<EmployeesController>(
                            init: EmployeesController(),
                            builder: (controller) => ListView.builder(

                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.myEmployees.length,
                                // itemCount: state?.data?.parentRequests?.length,
                                itemBuilder: (context, index) {
                                  final uiEmployeeRequests = controller.myEmployees[index];
                                  // final uiParentRequests = state?.data?.parentRequests![index]!;
                                  return  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: GestureDetector(
                                      // onTap: (){
                                      //   controller.closeSingleItemFromCheckListFunctions(uiParentRequests!.id);
                                      // },
                                      onPanUpdate: (details) {
                                        // Swiping in right direction.
                                        if (details.delta.dx > 0) {
                                          controller.closeSingleItemFromCheckListFunctions(uiEmployeeRequests!.id);
                                          print("Dragging in +X direction");
                                        }

                                        // Swiping in left direction.
                                        if (details.delta.dx < 0) {
                                          print("Dragging in -X direction");
                                          controller.openSingleItemFromCheckListFunctions(uiEmployeeRequests!.id);
                                        }

                                      },

                                      child: Stack(
                                        children: [
                                          /// card
                                          InkWell(
                                            onTap:(){
                                              controller.fetchAnEmployee(id: uiEmployeeRequests!.id);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                border: Border.all(color: const Color(0xff4494D5))
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 18),
                                                child:  Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    /// img and remaining data
                                                    Padding(
                                                      padding: const EdgeInsets.only(top:4.0),
                                                      child: Row(

                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [


                                                          /// image
                                                          InkWell(
                                                            onTap: () {
                                                              print("person");
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(top:10.0,bottom: 8,left: 8,right: 6),
                                                              child: Container(
                                                                width: 65,
                                                                height: 65,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                    image: DecorationImage(image: /*AssetImage('images/man img.png')*/ NetworkImage("${uiEmployeeRequests.user!.image}") ,scale: 1,fit: BoxFit.fill)
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
                                                                    child: Text(  "${uiEmployeeRequests.user!.username ?? ''}",
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
                                                                    child: Text("#${uiEmployeeRequests.apperanceName ?? ''}",
                                                                      //textDirection: TextDirection.ltr,
                                                                      style: TextStyle(

                                                                          fontSize: 11.sp,
                                                                          color: const Color(0xffA7ADB4),
                                                                          fontFamily: 'A Jannat LT, Regular'
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(top:8.0),
                                                                    child: Text(  uiEmployeeRequests.user!.phone ?? '',
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
                                                                        child: SvgPicture.asset( uiEmployeeRequests.status==1?'images/hand.svg': 'images/android-done-all-green.svg',
                                                                          width: 50,
                                                                          height: 30,
                                                                          fit: BoxFit.fill,
                                                                        ),
                                                                      ),

                                                                      Padding(
                                                                        padding: const EdgeInsets.only(top:8.0),
                                                                        child: Text(uiEmployeeRequests.status==0?"نشط":"موقوف",
                                                                          style: TextStyle(
                                                                              fontSize: 15.sp,
                                                                              color:  uiEmployeeRequests.status==0?const Color(0xff0B9C2D): const Color(0xffFFB300),
                                                                              fontFamily: 'A Jannat LT, Regular'
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),

                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      color: uiEmployeeRequests.type=="out"?
                                                                      const Color(0xffD37A47)/*:uiEmployeeRequests.jobTitle=="مسؤول / أدمن"?Colors.white*/:const Color(0xff4184CE),
                                                                      borderRadius: BorderRadius.circular(5),
                                                                    // border: uiEmployeeRequests.jobTitle=="مسؤول / أدمن"? Border.all(color: const Color(0xff4494D5)):Border(),
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
                                                                      child: Text(uiEmployeeRequests.type=="in"?"موظف داخلى":uiEmployeeRequests.type=="out"?"موظف خارجى":"",
                                                                        style: TextStyle(
                                                                            fontSize: 14.sp,
                                                                            color:  /*uiEmployeeRequests.jobTitle=="مسؤول / أدمن"?const Color(0xff4494D5):*/ Colors.white,
                                                                            fontFamily: 'A Jannat LT, Regular'
                                                                        ),),
                                                                    ),
                                                                  ),

                                                                  //  uiEmployeeRequests.jobTitle=="مسؤول / أدمن"?Container(
                                                                  //   child:   Center(child: Text('صلاحية كاملة',style: TextStyle(color:const Color(0xff00C3FF),fontSize:11.sp),)),
                                                                  // ):Container(),

                                                                ],
                                                              )
                                                            ],
                                                          ),



                                                        ],
                                                      ),
                                                    ),

                                                    /// job description
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom:12.0,left: 8,right: 8,top: 2),
                                                      child: Text(uiEmployeeRequests.jobTitle!,
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

                                              ),
                                            ),
                                          ),

                                          /// right slider
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            bottom: 0,
                                            // left: controller.checkListFunctions!.contains(uiParentRequests!.id) ? MediaQuery.of(context).size.width * .3 :double.infinity ,
                                            child: AnimatedContainer(
                                              duration:const Duration(milliseconds: 400),
                                              width:  controller.checkListFunctions!.contains(uiEmployeeRequests!.id) ? MediaQuery.of(context).size.width * .39 : 0,
                                              curve: Curves.fastOutSlowIn,
                                              decoration: const BoxDecoration(
                                                borderRadius:  BorderRadius.only(
                                                  bottomRight:  Radius.circular(6.0),
                                                  topRight:  Radius.circular(6.0),
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

                                                padding: EdgeInsets.symmetric(vertical:3,horizontal: 15),
                                                child: controller.checkListFunctions!.contains(uiEmployeeRequests!.id) ? Row(
                                                  children: [

                                                      Expanded(
                                                        child: EmployeeSlideRightItemsAction(
                                                          firstWidget:   InkWell(
                                                            onTap: (){
                                                              if(uiEmployeeRequests.status==1){
                                                                controller.stopOrActivateEmployee(id: uiEmployeeRequests.id);
                                                              }else{
                                                                Get.snackbar("حسنا",
                                                                  "هذا الموظف نشط بالفعل",
                                                                  icon: const Icon(Icons.check, color: Colors.green),
                                                                  backgroundColor: Colors.yellow,
                                                                  snackPosition: SnackPosition.TOP,);
                                                              }

                                                            },
                                                            child: Container(
                                                              width: 99.sp,
                                                              decoration: BoxDecoration(
                                                                color:   const Color(0xffeff7fa),
                                                                borderRadius: BorderRadius.circular(5),
                                                               ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.only( left:14,right: 8),
                                                                child:  Flex(
                                                                  direction: Axis.horizontal,
                                                                  children: [
                                                                    Expanded(
                                                                      child:  Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    //
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:2.0,),
                                                                      child: SvgPicture.asset('images/android-done-all-green.svg',//controller.employeesJobs[index]=="موظف خارجي"?'images/hand.svg'
                                                                        width: 50,
                                                                        height: 30,
                                                                        fit: BoxFit.contain,
                                                                      ),
                                                                    ),

                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:2.0),
                                                                      child: Text(
                                                                         "تنشيط",
                                                                        style: TextStyle(
                                                                            fontSize: 15.sp,
                                                                            color:const Color(
                                                                                0xff0B9C2D),
                                                                            fontFamily: 'A Jannat LT, Regular'
                                                                        ),
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),
                                                                    )
                                                                  ],
                                                                ),

                                                              ),
                                                            ),
                                                          ),
                                                          secondWidget: InkWell(
                                                            onTap: (){
                                                              if(uiEmployeeRequests.status==0){
                                                                controller.stopOrActivateEmployee(id: uiEmployeeRequests.id);
                                                              }else{
                                                                Get.snackbar("حسنا",
                                                                  "هذا الموظف موقوف بالفعل",
                                                                  icon: const Icon(Icons.check, color: Colors.green),
                                                                  backgroundColor: Colors.yellow,
                                                                  snackPosition: SnackPosition.TOP,);
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 99.sp,
                                                              decoration: BoxDecoration(
                                                                color:   const Color(0xffeff7fa),
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.only( left:14,right: 8),
                                                                child:  Flex(
                                                                  direction: Axis.horizontal,
                                                                  children: [
                                                                    Expanded(
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          //
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(top:2.0,),
                                                                            child: SvgPicture.asset('images/hand.svg',
                                                                              width: 50,
                                                                              height: 30,
                                                                              fit: BoxFit.fill,
                                                                            ),
                                                                          ),

                                                                          Padding(
                                                                            padding: const EdgeInsets.only(top:2.0),
                                                                            child: Text(
                                                                              "إيقاف",
                                                                              style: TextStyle(
                                                                                  fontSize: 15.sp,
                                                                                  color: const Color(0xffFFB300) ,
                                                                                  fontFamily: 'A Jannat LT, Regular'
                                                                              ),
                                                                            ),
                                                                          ),

                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          thirdWidget: InkWell(
                                                            onTap: (){
                                                              Get.defaultDialog(
                                                                title: "هل تريد حذف هذا الموظف !",
                                                                content: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                   
                                                                      controller.deleteAnEmployee(id: uiEmployeeRequests.id);
                                                                      Get.back();
                                                                    },
                                                                    child: Container(
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red,
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                      child: const Padding(
                                                                        padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                                                        child: Center(child: Text("نعم",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  InkWell(
                                                                    onTap: (){
                                                                      Get.back();
                                                                    },
                                                                    child: Container(
                                                                      width: 80,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.green,
                                                                        borderRadius: BorderRadius.circular(8),
                                                                      ),
                                                                      child: const Padding(
                                                                        padding:  EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                                                        child: Center(child: Text("لا",style: TextStyle(color: Colors.white,fontSize: 12),)),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                ],),
                                                                backgroundColor: Colors.white,
                                                                titleStyle: const TextStyle(color: Colors.red,fontSize: 16),
                                                                 barrierDismissible: false
                                                              );

                                                            },
                                                            child: Container(
                                                              width: 99.sp,
                                                              decoration: BoxDecoration(
                                                                color:   const Color(0xffeff7fa),
                                                                borderRadius: BorderRadius.circular(5),
                                                              ),
                                                              child: Padding(
                                                                padding:   const EdgeInsets.only( left:14,right: 8),
                                                                child:  Flex(
                                                                  direction: Axis.horizontal,
                                                                  children: [
                                                                    Expanded(
                                                                      child:  Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    //
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:2.0),
                                                                      child: SvgPicture.asset('images/delete_employee.svg',
                                                                        width: 50,
                                                                        height: 30,
                                                                        fit: BoxFit.fill,
                                                                      ),
                                                                    ),

                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:2.0),
                                                                      child: Text(
                                                                        "حذف",
                                                                        style: TextStyle(
                                                                            fontSize: 15.sp,
                                                                            color:  Colors.red,
                                                                            fontFamily: 'A Jannat LT, Regular'
                                                                        ),
                                                                      ),
                                                                    ),

                                                                  ],
                                                                ),
                                                                    )
                                                                  ],
                                                                ),

                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                   ],
                                                ):Container(),
                                              ),
                                            ),
                                          ),

                                          /// background of slider
                                          Positioned(
                                            top:0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 8,
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
                                                    bottomRight: const Radius.circular(6.0),
                                                    topRight: const Radius.circular(6.0),
                                                  )
                                              ),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 45,
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
                ),
              ],
            ),
          ):const Center(
            child: Text("لا يوجد موظفين"),
          ),
                /// add employee button
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
        )
    );
  }
}

