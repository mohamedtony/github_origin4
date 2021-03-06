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
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          leading: InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset(
                  'images/DrawerIcon.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          leadingWidth: 56.0,
          title: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Container(
              height: 40.0,
              // alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'images/search_icon.svg',
                      ),
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'images/filter_icon.svg',
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(70.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    //hintText: "Type in your text",
                    fillColor: Colors.white70),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left:16.0,top: 8),
              child: InkWell(
                onTap: (){
                   Navigator.of(context).pop();
                },
                child: SvgPicture.asset('images/arrow_back.svg',
                  // matchTextDirection: true,
                  height: 40,width: 40, fit: BoxFit.contain,color: Colors.white,),
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF48DBE1), Color(0xFF4166CD)],
              ),
            ),
          ),
          elevation: 2,
          //  bottom: ,
        ),
      ),/*PreferredSize(
        child: AppBarWidget(
          isSearchBar: true,
          isNotification: false,
          isBack: true,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 93.h),
      ),*/
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
                              child: Text("?????????????? ??????????????????",
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
                          Text("??????????",style: TextStyle(color: const Color(0xff244094),fontFamily: 'A Jannat LT, Regular',fontSize: 16.sp),
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
                                                  padding:   EdgeInsets.only(top:4,bottom: 4,right: index==6||index==11||index==12? 16: 8,left: index==6||index==11||index==12? 8: 0),
                                                  child: Container(
                                                    width: index==6||index==11||index==12?13:30,
                                                    height: index==6||index==11||index==12?13:30,
                                                    // decoration: BoxDecoration(
                                                    //     image: DecorationImage(image: AssetImage('manasa img.png'),fit: BoxFit.fill) ),
                                                    child:  SvgPicture.asset('images/${controller.notificationSettingsImgsList[index]}',height: 30,width: 30,fit: BoxFit.contain,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:3),
                                                  child: Text(controller.notificationSettingsList[index],
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
                                                    borderRadius: BorderRadius.circular(6),
                                                    border: Border.all(color: Color(0xff4184CE),width: .5)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                                        child: Text("??????",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color: const Color(
                                                                  0xff244094),
                                                              fontFamily: 'A Jannat LT, Regular'
                                                          ),
                                                        ),
                                                      ),

                                                      InkWell(
                                                        onTap: (){
                                                          setState(() {
                                                            controller.isMuted=!controller.isMuted;
                                                          });

                                                        },
                                                        child: Container(
                                                          child:  controller.isMuted?SvgPicture.asset('images/volume-up.svg',height: 40,)
                                                              :SvgPicture.asset('images/mute icon.svg',height: 40,)
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                              ),

                                              /// edit
                                              Container(
                                                width: MediaQuery.of(context).size.width*.45,
                                                decoration: BoxDecoration(
                                                    color: controller.isChecked?const Color(0xffF5F5F5):Colors.white,
                                                    borderRadius: BorderRadius.circular(6),
                                                    border: Border.all(color: Color(0xff4184CE),width: .5)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 4),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [

                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                                        child: Text(
                                                          "??????????",
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
                                                        child: ClipRRect(
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
                            child: Center(child: Text("??????",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Bold',fontSize: 15.sp),)),
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
                            child: Center(child: Text("??????????",style: TextStyle(color: Colors.white,fontFamily: 'A Jannat LT, Regular',fontSize: 15.sp),)),
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