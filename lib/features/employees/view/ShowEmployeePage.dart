import 'package:advertisers/app_core/network/models/Operation.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowEmployeePage extends GetWidget<EmployeesController> {

  final EmployeesController  controller = Get.put(EmployeesController());



  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return   Scaffold(
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
                          padding: const EdgeInsets.symmetric(horizontal:20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff4184CE),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Padding(
                              padding:   EdgeInsets.symmetric(vertical:4.0,horizontal: MediaQuery.of(context).size.width*.09),
                              child: Text("موظف",
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

                ///date & edit
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width*.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("تاريخ الاضافة",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp),
                              ),
                            ),
                            Container(
                              child: Text(controller.createdAtDate.value,style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///custom checkbox
                          Obx(()=>   InkWell(
                            onTap: (){
                                controller.isEdit.value= !controller.isEdit.value;
                                print("controller.isEdit ${controller.isEdit.value}");
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
                                  padding:   EdgeInsets.all(4.0),
                                  child: Container(
                                            width: 8,
                                            height: 8 ,
                                          decoration: controller.isEdit.value?
                                          BoxDecoration(shape: BoxShape.circle, color: Colors.blue):
                                          BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),

                                      ),

                                ),

                              ),
                            ),
                          ),),
                          Text("تعديل",style: TextStyle(color: const Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 16.sp),),

                        ],
                      ),
                    ],
                  ),

                ),

                ///image and stars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(width: 30,),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [

                        Container(
                          width: 98.sp,
                          height: 92.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: controller.profileImage.value.isNotEmpty?
                            NetworkImage(controller.profileImage.value):NetworkImage(controller.noImage)
                                /*AssetImage('images/man img.png')*/,fit: BoxFit.fill),
                          ),
                        ),


                        Positioned(
                            left: -8,
                            top:-8,
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color:  Colors.blue,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:2.0,right: 8),
                      child: Text(controller.rate.value,style: TextStyle(color: Colors.grey.withOpacity(.5),fontSize: 12),),
                    ),
                    Icon(Icons.star,color: Color(0xffFFB300),size: 18,)
                  ],
                ),

                /// social buttons
                Center(
                  child: Padding(
                    padding:   EdgeInsets.only(top:16.sp,bottom: 12.sp),
                    child: Container(
                      width: MediaQuery.of(context).size.width*.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:42,
                            height: 42,
                            decoration: BoxDecoration(
                              color:Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0XFF4184CE),width: .5),
                                image:   const DecorationImage(image: AssetImage('images/icon-msg1.png',),scale: 2)

                            ),

                          ),

                          InkWell(
                            onTap:() {
                              if(controller.showEmployeeDetails.data!.user!.whatsapp!=null){
                                controller.SendMsgToWhatsapp(whatsapp: controller.showEmployeeDetails.data!.user!.whatsapp!);
                              }
                            } ,
                            child: Container(
                              width:42,
                              height: 42,
                              decoration: BoxDecoration(
                                color:Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0XFF4184CE),width: .5),
                                  image: const DecorationImage(image: AssetImage('images/icon-whatsapp1.png',),scale: 2)

                              ),


                            ),
                          ),
                          Container(
                            width:42,
                            height: 42,
                            decoration: BoxDecoration(
                              color:Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0XFF4184CE),width: .5),//
                                image: const DecorationImage(image: AssetImage('images/icon-email1.png',),scale: 2)

                            ),


                          ),
                          InkWell(
                            onTap:() {
                              if(controller.showEmployeeDetails.data!.user!.phone!=null){
                                launch("tel://${controller.showEmployeeDetails.data!.user!.phone}");
                              }
                            } ,
                            child: Container(
                              width:42,
                              height: 42,
                              decoration: BoxDecoration(
                                color:Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0XFF4184CE),width: .5),
                                image: const DecorationImage(image: AssetImage('images/icon-phone2.png',),scale: 2)
                              ),


                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),

                /// authorization & archive
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// authorization btn
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeAuthorizationPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.37,
                          decoration: BoxDecoration(
                              color:const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0XFF4184CE),width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:6.0,),
                            child: Center(child: Text("الصلاحيات",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp),)),
                          ),

                        ),
                      ),

                      ///archive btn
                      InkWell(
                        onTap: (){
                          controller.fetchAnEmployeeOperations(id: controller.showEmployeeDetails.data!.id!);

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.37,
                          decoration: BoxDecoration(
                            color:const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0XFF4184CE),width: .5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:6.0,),
                            child: Center(child: Text("سجل العمليات",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp),)),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),

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
                        hint:  controller.selectedEmployeeJob!=""?Text( controller.selectedEmployeeJob.value,style: TextStyle(color: Color(0xff244094),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),):
                        Text('نوع التوظيف',style: TextStyle(color:Color(0xff9CA3AF),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),),
                        items: <String>['موظف داخلى', 'موظف خارجى'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.grey.withOpacity(.8),fontSize: 14.sp,fontFamily: 'A Jannat LT, Regular'),),
                          );
                        }).toList(),
                        isExpanded: true,
                        onChanged: (newVal) {

                            controller.selectedEmployeeJob.value=newVal!;
                            print("v ${controller.selectedEmployeeJob}");

                        },
                      ),
                    ),
                  ),
                ),
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
                        child: Obx(()=>TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.nameController.value,
                          focusNode: controller.nameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration:   InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "الاسم",
                            enabled: controller.isEdit.value,
                          ),
                          onEditingComplete: () => node.nextFocus(),
                        ),),
                      ),
                    ),
                  ),
                ),

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
                        child: Obx(()=>TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.emailController.value,
                          focusNode: controller.emailNode,
                          keyboardType:TextInputType.emailAddress,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration:   InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "الايميل",
                            enabled: controller.isEdit.value
                          ),
                          onEditingComplete: ()  => node.nextFocus(),
                        ),),
                      ),
                    ),
                  ),
                ),
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
                            child: Obx(()=> TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              controller: controller.mobileController.value,
                              focusNode: controller.mobileNode,
                              keyboardType:TextInputType.phone,
                              style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                              decoration:  InputDecoration(
                                hintStyle: const TextStyle(
                                  fontFamily: 'A Jannat LT, Regular',
                                  fontSize: 12,
                                  color: Color(0xff9CA3AF),//
                                ),
                                filled: true,
                                fillColor: Color(0xffF5F5F5),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "الجوال",
                                enabled: controller.isEdit.value
                              ),
                              onEditingComplete: ()  => node.nextFocus(),

                            ),),
                          ),
                        ),
                        Positioned(
                          left: -1,
                          top: -2,
                          child: Container(
                            decoration: BoxDecoration(color: Color(0xffEEEEEE),borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 24),
                              child: Center(child: Text('تأكيد',style: TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14.sp,color: Color(0xff4184CE)),)),
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                ),
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
                        child: Obx(()=>TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.positionNameController.value,
                          focusNode: controller.positionNameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration:  InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "المسمى الوظيفي",
                            enabled: controller.isEdit.value,
                          ),
                          onEditingComplete: ()  => node.nextFocus(),
                        ),),
                      ),
                    ),
                  ),
                ),

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
                        child: Obx(()=>TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: controller.appearanceNameController.value,
                          focusNode: controller.appearanceNameNode,
                          keyboardType:TextInputType.text,
                          style: const TextStyle(fontFamily: 'A Jannat LT, Regular',fontSize: 14,color:Color(0xff244094)),
                          decoration:  InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'A Jannat LT, Regular',
                              fontSize: 12,
                              color: Color(0xff9CA3AF),//
                            ),
                            filled: true,
                            fillColor: Color(0xffF5F5F5),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "اسم الظهور",
                            enabled: controller.isEdit.value,
                          ),
                          onSaved: (_){},
                          onEditingComplete: ()  => node.unfocus(),
                        ),),
                      ),
                    ),
                  ),
                ),

                /// action btns save & cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// save btn
                      InkWell(
                        onTap: (){
                          controller.checkEditEmployee(controller.showEmployeeDetails.data!.id!);
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