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

class NotificationSettingsPage extends StatefulWidget{

  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {


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
                              child: Text("اعدادات الاشعارات",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color:   Colors.white,
                                    fontFamily: 'A Jannat LT, Regular'
                                ),),
                            ),
                          ),
                        ),
                        Container(
                          child:  SvgPicture.asset('images/my notification.svg',height: 45,),
                        )
                      ],
                    ),
                  ),
                ),

                ///image & name & edit
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///custom checkbox
                          InkWell(
                            onTap: (){
                              setState(() {
                                controller.isChecked=!controller.isChecked;
                              });
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
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: controller.isChecked?Colors.blue:Colors.transparent),
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
                  child: ListView.builder(
                       shrinkWrap: true,
                       itemCount:  controller.privilegedList.length ,
                      itemBuilder: (context, index) {
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
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top:4,bottom: 4,right: 8),
                                                  child: Container(
                                                    child:  SvgPicture.asset('images/manasa icon.svg',height: 30,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:3),
                                                  child: Text('المنصة',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
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

                                        /// row of view & add & edit
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal:8.0 ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              /// view
                                              Container(
                                                width: MediaQuery.of(context).size.width*.45,
                                                decoration: BoxDecoration(
                                                    color: controller.isChecked?const Color(0xffF5F5F5):Colors.white,
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Color(0xff4184CE),width: .5)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                                        child: Text("عرض",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color: const Color(
                                                                  0xff244094),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ),
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(top:4,bottom: 4,right: 8),
                                                        child: Container(
                                                          child:  SvgPicture.asset('images/volume-up.svg',height: 30,),
                                                        ),
                                                      ),
                                                    //

                                                    ],
                                                  ),
                                                ),
                                              ),

                                              /// edit
                                              Container(
                                                width: MediaQuery.of(context).size.width*.45,
                                                decoration: BoxDecoration(
                                                    color: controller.isChecked?const Color(0xffF5F5F5):Colors.white,
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Color(0xff4184CE),width: .5)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                                        child: Text(
                                                          "تعديل",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color: const Color(
                                                                  0xff244094),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ),
                                                        ),
                                                      ),


                                                      ClipRRect(
                                                        clipBehavior: Clip.hardEdge,
                                                        borderRadius: BorderRadius.all(Radius.circular(2)),
                                                        child: SizedBox(
                                                          width: Checkbox.width,
                                                          height: Checkbox.width,
                                                          child: Container(
                                                            decoration: new BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Color(0xffE5E5E5)
                                                              ),
                                                              borderRadius: new BorderRadius.circular(2),
                                                            ),
                                                            child: Theme(
                                                              data: ThemeData(
                                                                unselectedWidgetColor: Colors.transparent,
                                                              ),
                                                              child: Checkbox(
                                                                value:  controller.isChecked,
                                                                onChanged: (state) => setState((){
                                                                  controller.isChecked=!controller.isChecked;
                                                                }),
                                                                activeColor: Color(0xFF4184CE),
                                                                checkColor: Colors.white,
                                                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),




                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ],
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

                /// action btns save & cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// save btn
                      InkWell(
                        onTap: (){},
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