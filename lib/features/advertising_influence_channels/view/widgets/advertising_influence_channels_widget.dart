import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/widgets/advertising_influence_channels_list_widget.dart';
import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;


class AdvertisingInfluenceChannelsPageWidget extends StatelessWidget {
  final AdvertisingChannel advertisingChannels;
  final int? index;
  // bool? isChecked ;

  AdvertisingInfluenceChannelsPageWidget({
    required this.advertisingChannels,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final AdvertisingInfluenceChannelsController _advertisingInfluenceChannelsController=Get.put(AdvertisingInfluenceChannelsController());
    _advertisingInfluenceChannelsController.checkListSee!.add(advertisingChannels.isChecked!) ;
    return GetBuilder<AdvertisingInfluenceChannelsController>(
      init: AdvertisingInfluenceChannelsController(),
      builder: (controller) {
        // isChecked = advertisingChannels.isChecked;
        // controller.isCheckedSee = isChecked!;
       return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "${advertisingChannels.iconUrl}",
                            height: 65,
                          ),

                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("تأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),


                                    InkWell(
                                      onTap: (){
                                        if(controller.isChecked == true){
                                          controller.addRemoveCheckList(advertisingChannels.id);
                                          print("${controller.checkList!}");
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),

                                          SizedBox(
                                            width: 10,
                                          ),
                                          AnimatedSwitcher(
                                            duration: Duration(milliseconds: 500),
                                            child: Container(
                                              key: Key("${controller.checkList!}"),
                                              child:  Transform(
                                                alignment: Alignment.center,
                                                transform: Matrix4.rotationY(
                                                    controller.checkList!.contains(advertisingChannels.id)
                                                        ? math.pi
                                                        : 0),
                                                child: Image.asset("images/switchButton.png"),
                                              ),
                                            ),
                                          ),


                                          SizedBox(
                                            width: 15,
                                          ),

                                        ],),
                                    ),
                                    // Switch(
                                    //   thumbColor:MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
                                    //   trackColor: MaterialStateProperty.all(Color(0xff4391D4)),
                                    //   value: controller.checkList!.contains(advertisingChannels.id),
                                    //   // value: advertisingChannels.isChecked!,
                                    //   onChanged: (value) {
                                    //     if(controller.isChecked == true){
                                    //       controller.addRemoveCheckList(advertisingChannels.id);
                                    //       print("${controller.checkList!}");
                                    //     }
                                    //   },
                                    // ),
                                    Text("إعلان وتأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                                  ],
                                ),
                                Text("${advertisingChannels.socialTitle}",style: TextStyle(fontSize: 16.sp,color:Color(0xffD37A47),height: 1.3 ),),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),

                          Container(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text("عدد المتابعين",style: TextStyle(fontSize: 16.sp,color: Colors.grey),)),
                            Text("${advertisingChannels.minFollower}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                            Text("-",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                            Text("${advertisingChannels.maxFollower}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),

                          ],
                        ),
                      ),
// const  SizedBox(
//     height: 6,
//   ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text("شريحة المتأثرين",style: TextStyle(fontSize: 16.sp,color: Colors.grey),)),
                            Column(
                              children: [
                                Text("${advertisingChannels.men}",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                                Text("${advertisingChannels.boys}",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                              ],
                            ),
                            Column(
                              children: [
                                Text("${advertisingChannels.women}",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                                Text("70 % فتيات",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  )),
                  Container(
                    color: Color(0xfff1f1f1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              if(controller.isChecked == true){
                                controller.addRemoveCheckListSee(index);
                              }
                              print("${controller.isChecked} ${advertisingChannels.id}");
                            },
                            child: controller.checkListSee![index!] == true ? Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),):Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.edit,color: Color(0xff5aa1d0),),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.delete_forever,color: Color(0xff5aa1d0),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

