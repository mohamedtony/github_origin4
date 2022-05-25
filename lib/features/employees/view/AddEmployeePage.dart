import 'package:advertisers/features/employees/controller/add_employee_controller.dart';
import 'package:advertisers/features/employees/controller/employees_controller.dart';
import 'package:advertisers/features/employees/view/EmployeeArchivePage.dart';
import 'package:advertisers/features/employees/view/EmployeeAuthorizationPage.dart';
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
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddEmployeePage extends StatefulWidget{

  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {

  //final AddEmployeeController  controller = Get.put(AddEmployeeController());


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
      body: GetBuilder<AddEmployeeController>(
        init: AddEmployeeController(),
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
                          padding: const EdgeInsets.symmetric(horizontal:20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff4184CE),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: MediaQuery.of(context).size.width*.09),
                              child: Text("اضافة موظف",
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
                            child:  SvgPicture.asset( 'images/person-plus.svg' ,
                              width: 50,
                              height: 30,
                              fit: BoxFit.fill,
                            ),
                              width: 36,
                              height: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


               const SizedBox(height: 60,),

                ///jop type dropdown
                Padding(
                  padding: const EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0,left: 16),
                      child: DropdownButton<String>(
                        underline: const SizedBox.shrink(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint:  controller.selectedEmployeeJob.isNotEmpty?
                       Obx(()=>Text( controller.selectedEmployeeJob.value,style: TextStyle(color: Color(0xff244094),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),)):
                        Text('نوع التوظيف',style: TextStyle(color:Color(0xff9CA3AF),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),),
                        items: <String>['موظف داخلى', 'موظف خارجى'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.grey.withOpacity(.8),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),),
                          );
                        }).toList(),
                        isExpanded: true,
                        onChanged: null /*(newVal) {

                            controller.selectedEmployeeJob.value=newVal!;
                            print("v ${controller.selectedEmployeeJob}");

                        }*/,
                      ),
                    ),
                  ),
                ),


                Obx(()=>  Visibility(
                  visible: controller.errorSelectedJobType!=null&&controller.errorSelectedJobType!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.errorSelectedJobType??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ), ),

                ///name
                Padding(
                  padding:   EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:11.0,right: 11),
                      child: Center(
                        child: TextFormField(

                          textAlignVertical: TextAlignVertical.top,
                           controller: controller.nameController.value,
                          focusNode: controller.nameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration: const InputDecoration(
                            hintStyle:  TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                             ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "الاسم",
                          ),
                          onEditingComplete: () => node.nextFocus(),
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(()=>  Visibility(
                  visible: controller.errorNameText!=null&&controller.errorNameText!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.errorNameText??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ),),

                ///email
                Padding(
                  padding:   EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:11.0,right: 11),
                      child: Center(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.emailController.value,
                          focusNode: controller.emailNode,
                          keyboardType:TextInputType.emailAddress,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "الايميل",
                          ),
                          onEditingComplete: ()  => node.nextFocus(),
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(()=>  Visibility(
                  visible: controller.validateEmail!=null&&controller.validateEmail!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.validateEmail??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ),),



                ///mobile
                Padding(
                  padding:  const EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:11.0,right: 11, ),
                          child: Center(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              controller: controller.mobileController.value,
                              focusNode: controller.mobileNode,
                              keyboardType:TextInputType.phone,
                              style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontFamily: 'A Jannat LT, Regular',
                                  fontSize: 12,
                                  color: Color(0xff9CA3AF),//
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "الجوال",
                              ),
                              onEditingComplete: ()  => node.nextFocus(),
                              validator: (value){
                                return controller.validatePhone(value!);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: -1,
                          top: -2,
                          child: InkWell(
                            onTap: ()=>controller.checkSearchEmployee(),
                            child: Container(
                              decoration: BoxDecoration(color: Color(0xffEEEEEE),borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 24),
                                child: Center(child: Text('تأكيد',style: TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp,color: Color(0xff4184CE)),)),
                              ),
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                ),


                Obx(()=> Visibility(
                  visible: controller.errorMobileText!=null&&controller.errorMobileText!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.errorMobileText??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ), ),

                ///position name
                Padding(
                  padding: const  EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:11.0,right: 11),
                      child: Center(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.positionNameController.value,
                          focusNode: controller.positionNameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "المسمى الوظيفي",
                          ),
                          onEditingComplete: ()  => node.nextFocus(),
                        ),
                      ),
                    ),
                  ),
                ),


                Obx(()=> Visibility(
                  visible: controller.errorPositionNameText!=null&&controller.errorPositionNameText!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.errorPositionNameText??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ),),

                ///appearance name
                Padding(
                  padding: const  EdgeInsets.only(top:4.0,left: 25,right: 25,bottom: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width*.9,
                    height: 45.sp,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0XFF4184CE),width: .5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:11.0,right: 11),
                      child: Center(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.appearanceNameController.value,
                          focusNode: controller.appearanceNameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "اسم الظهور",
                          ),
                          onSaved: (_){},
                          onEditingComplete: ()  => node.unfocus(),
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(()=> Visibility(
                  visible: controller.errorAppearenceNameText!=null&&controller.errorAppearenceNameText!=""&&controller.validation.value,
                  child: Padding(
                    padding: const EdgeInsets.only(right:35.0),
                    child: Align(alignment: Alignment.centerRight,child: Text( controller.errorAppearenceNameText??"",style: TextStyle(color: Colors.red,fontSize: 10),)),
                  ),
                ),),


                /// action btns save & cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// save btn
                        InkWell(
                           onTap: (){
                             controller.validation.value=true;
                             Logger().i(controller.errorNameText);
                             Logger().i(controller.errorMobileText);
                             Logger().i(controller.errorPositionNameText);
                             Logger().i(controller.errorAppearenceNameText);
                             Logger().i(controller.validateEmail);
                             if(controller.errorNameText==null&&controller.errorMobileText==null&&controller.errorPositionNameText==null&&controller.errorAppearenceNameText==null&&controller.validateEmail==null){

                               controller.checkAddEmployee();
                             }

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
                        onTap: (){
                          controller.restAll();
                          Get.toNamed('/EmployeesPage');
                        },
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