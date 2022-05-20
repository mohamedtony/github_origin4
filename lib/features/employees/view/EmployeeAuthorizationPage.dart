import 'package:advertisers/app_core/network/requests/SetRulesRequest.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/controller/rules_controller.dart';
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

class EmployeeAuthorizationPage extends GetWidget<RulesController>  {

  final RulesController  controller = Get.put(RulesController());


  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    var originalWidth=MediaQuery.of(context).size.width;
    var originalHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          my_height: 120.sp,
          isSearchBar: false,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 120),
      ),
      body: GetBuilder<RulesController>(
        init: RulesController(),
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
                              child: Text("الصلاحيات",
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
                        width:MediaQuery.of(context).size.width*.44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration:   BoxDecoration(
                                   shape: BoxShape.circle,
                                  image: DecorationImage(image:  controller.showEmployeeDetails.data!.user!.image!=null&&controller.showEmployeeDetails.data!.user!.image!=""?
                                  NetworkImage(controller.showEmployeeDetails.data!.user!.image!):NetworkImage(controller.noImage),fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:8.0),
                              child: Text(
                               controller.showEmployeeDetails.data!.user!.username??"",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///custom checkbox
                          Obx(()=>  InkWell(
                              onTap: (){
                                controller.isEdit.value = !controller.isEdit.value;
                                print("controller.isEdit.isTrue ${controller.isEdit.value}");

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.blue ),
                                      shape: BoxShape.circle
                                  ),
                                  child:   Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                              width: 8,
                                              height: 8 ,

                                        decoration: //BoxDecoration(shape: BoxShape.circle, color: controller.isEdit.value?Colors.blue:Colors.transparent),
                                        controller.isEdit.value?
                                        BoxDecoration(shape: BoxShape.circle, color: Colors.blue):
                                        BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
                                        ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Text("تعديل",style: TextStyle(color: const Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 16.sp),
                          )
                        ],
                      ),
                    ],
                  ),

                ),

                /// my privileged list
                Container(
                  height: MediaQuery.of(context).size.height*.63,
                  child:  GetBuilder<RulesController>(
                    init: RulesController(),
                    builder: (controller) => ListView.builder(
                         shrinkWrap: true,
                         itemCount:  controller.myEmployeeRules.length ,
                        itemBuilder: (context, index) {
                          controller.addAllRules.add(false);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
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
                                          /// action name
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xffF5F5F5),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                              ),
                                              child:  Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical:3),
                                                    child: Text(
                                                      controller.myEmployeeRules[index].name??"",
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: const Color(
                                                              0xff244094),
                                                          fontFamily: 'A Jannat LT, Regular'
                                                      ),
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal:8.0,),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                         Container(
                                                            width: 12,
                                                            height: 12,
                                                            child: Checkbox(
                                                                checkColor: Colors.white,
                                                                fillColor: MaterialStateProperty.all(  Colors.lightBlue),
                                                                value: controller.addAllRules[index],
                                                                shape: CircleBorder(),
                                                                onChanged: /*controller.isEdit.isFalse?*/(bool? value) {
                                                                  print("controller.isEdit.isTrue ${controller.isEdit.value}");
                                                                    controller.addAllRules[index] = value!;
                                                                    controller.update();
                                                                }//:null,
                                                              ),

                                                          ),


                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),                                                        child: Text(
                                                          "الكل",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color: const Color(
                                                                  0xff244094),
                                                              decoration: TextDecoration.underline,
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ),
                                                        ),
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),


                                          Container(
                                            height:controller.myEmployeeRules[index].actions!=null&&controller.myEmployeeRules[index].actions!.isNotEmpty?
                                            ((controller.myEmployeeRules[index].actions!.length/2.0).ceil()*55) :10,
                                            child: GridView.builder(
                                                physics: const NeverScrollableScrollPhysics(),
                                                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                                  childAspectRatio: MediaQuery.of(context).size.width /
                                                      (MediaQuery.of(context).size.height / 7),),
                                                itemCount: controller.myEmployeeRules[index].actions!=null&&controller.myEmployeeRules[index].actions!.isNotEmpty?
                                                controller.myEmployeeRules[index].actions!.length:0,
                                                itemBuilder: (BuildContext context, int actionIndex) {
                                                  if(controller.addAllRules[index]){
                                                    controller.myEmployeeRules[index].actions![actionIndex].isSelected=true;
                                                    if(!controller.roles.contains(controller.myEmployeeRules[index].actions![actionIndex].id)){
                                                      controller.roles.add(controller.myEmployeeRules[index].actions![actionIndex].id!);
                                                    }

                                                  }
                                                  return Padding(
                                                    padding: const EdgeInsets.all(6.0),
                                                    child: InkWell(
                                                      onTap: (){

                                                        if(controller.myEmployeeRules[index].actions![actionIndex].isSelected==true){
                                                          controller.myEmployeeRules[index].actions![actionIndex].isSelected = false;
                                                            if(controller.roles.contains(controller.myEmployeeRules[index].actions![actionIndex].id)){
                                                              controller.roles.removeWhere((element) => element==(controller.myEmployeeRules[index].actions![actionIndex].id));
                                                              print("select else# ${controller.myEmployeeRules[index].actions![actionIndex].isSelected}  roles= #${controller.roles}");
                                                              controller.update();
                                                              print(" roles= #${controller.roles}");
                                                            }

                                                        }else{
                                                          controller.myEmployeeRules[index].actions![actionIndex].isSelected = true;
                                                        if((controller.myEmployeeRules[index].actions![actionIndex].isSelected!=null&&
                                                        controller.myEmployeeRules[index].actions![actionIndex].isSelected==true)
                                                        && !controller.roles.contains(controller.myEmployeeRules[index].actions![actionIndex].id)){
                                                        controller.roles.add(controller.myEmployeeRules[index].actions![actionIndex].id!);
                                                        print("select if# ${controller.myEmployeeRules[index].actions![actionIndex].isSelected} roles= #${controller.roles}");
                                                        controller.update();
                                                        print(" roles= #${controller.roles}");
                                                        }
                                                        }


                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: controller.myEmployeeRules[index].actions![actionIndex].isSelected==true?const Color(0xffF5F5F5):Colors.white,
                                                            borderRadius: BorderRadius.circular(10),
                                                            border: Border.all(color: Color(0xff4184CE),width: .5)
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Container(
                                                              width: 12,
                                                              height: 12,
                                                              child:  Checkbox(
                                                                  checkColor: Colors.white,
                                                                  fillColor: MaterialStateProperty.all(Colors.lightBlue),
                                                                  value: controller.myEmployeeRules[index].actions![actionIndex].isSelected,
                                                                  shape: CircleBorder(),
                                                                  onChanged: /*controller.isEdit.value?*/(bool? value) {

                                                                      controller.myEmployeeRules[index].actions![actionIndex].isSelected = value!;
                                                                      if((controller.myEmployeeRules[index].actions![actionIndex].isSelected!=null&&
                                                                          controller.myEmployeeRules[index].actions![actionIndex].isSelected==true)
                                                                      && !controller.roles.contains(controller.myEmployeeRules[index].actions![actionIndex].id)){

                                                                        controller.roles.add(controller.myEmployeeRules[index].actions![actionIndex].id!);
                                                                        print("select if# ${controller.myEmployeeRules[index].actions![actionIndex].isSelected} roles= #${controller.roles}");
                                                                        controller.update();
                                                                        print(" roles= #${controller.roles}");
                                                                      }else{

                                                                        if(controller.roles.contains(controller.myEmployeeRules[index].actions![actionIndex].id)){
                                                                          controller.roles.removeWhere((element) => element==(controller.myEmployeeRules[index].actions![actionIndex].id));
                                                                          print("select else# ${controller.myEmployeeRules[index].actions![actionIndex].isSelected}  roles= #${controller.roles}");
                                                                          controller.update();
                                                                          print(" roles= #${controller.roles}");

                                                                        }
                                                                      }



                                                                  }//:null,
                                                                ),

                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(/*right: 2,*/top: 1,bottom: 1),
                                                              child: Container(
                                                                width: 100,
                                                                child: Center(
                                                                  child: Text(
                                                                    controller.myEmployeeRules[index].actions![actionIndex].text??"",
                                                                 // maxLines: 1,
                                                                  style: TextStyle(
                                                                      fontSize: 14.sp,
                                                                      color: const Color(
                                                                          0xff244094),
                                                                      fontFamily: 'A Jannat LT, Regular'
                                                                  ),
                                                            ),
                                                                ),
                                                              ),
                                                            ),

                                                            const  SizedBox(
                                                              width: 1,
                                                            )

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
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
                ),

                /// action btns save & cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// save btn
                      InkWell(
                        onTap: (){
                          controller.ruleRequest.roles=controller.roles;
                          // SetRulesRequest req =SetRulesRequest();
                          // req .roles=controller.roles;
                           controller.setRules( id: controller.employeeId.value);
                          print("${controller.roles.length}  + id ${controller.employeeId.value} req # ${controller.ruleRequest.roles}");
                          print(controller.roles);

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.33,
                          decoration: BoxDecoration(
                            color:const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0XFF4184CE),width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0,),
                            child: Center(child: Text("حفظ",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Bold',fontSize: 15.sp),)),
                          ),

                        ),
                      ),

                      /// cancel btn
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width*.33,
                          decoration: BoxDecoration(
                            color:const Color(0xff4391D4),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0XFF4184CE),width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:4.0,),
                            child: Center(child: Text("الغاء",style: TextStyle(color: Colors.white,fontFamily: 'A Jannat LT, Regular',fontSize: 15.sp),)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),



    );

  }

}