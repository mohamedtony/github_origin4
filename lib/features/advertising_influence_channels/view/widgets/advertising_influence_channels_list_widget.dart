import 'dart:convert';

import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
import 'package:advertisers/features/advertising_influence_channels/view/widgets/advertising_influence_channels_widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdvertisingInfluenceChannelsPageListWidget extends StatefulWidget {
  const AdvertisingInfluenceChannelsPageListWidget({Key? key}) : super(key: key);

  @override
  _AdvertisingInfluenceChannelsPageListWidgetState createState() => _AdvertisingInfluenceChannelsPageListWidgetState();
}

class _AdvertisingInfluenceChannelsPageListWidgetState extends State<AdvertisingInfluenceChannelsPageListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


  // int? id;
  // bool? isChecked;
  // String? socialTitle,iconUrl,minFollower,maxFollower,men,women,boys,girls;
  // AdvertisingInfluenceChannelsPageListWidget({Key? key}) : super(key: key);
   AdvertisingInfluenceChannelsController controller=Get.put(AdvertisingInfluenceChannelsController());
 // late int currentIndex;
   late Widget icon=Padding(padding: EdgeInsets.all(0));

   @override
  Widget build(BuildContext context) {
    return  Obx(()=>controller.channels.isNotEmpty?ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.channels.length,
        itemBuilder: (context, index) {
          // icon= controller.channels[index].status==1?Padding(
          //     padding: const EdgeInsets.all(5.0),
          //     child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
          //     padding: const EdgeInsets.all(5.0),
          //     child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
          //     ));
          return  Container(
            padding: EdgeInsets.only(bottom: 12),
            child:
            // AdvertisingInfluenceChannelsPageWidget(
            //   advertisingChannels: Get.find<AdvertisingInfluenceChannelsController>().channels[index],
            //   index: index,
            // ),
            Container(
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
                  child: SizedBox(
                    width: 325.w,
                    child: Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.channels[index].channel?.image!='' ?Image.network(
                                  "${controller.channels[index].channel?.image}",
                                  height: 65,
                                  width: 65,
                                  errorBuilder: (context,object,err){
                                    return Image.asset('images/no_image_available.png',height: 70);
                                  },
                                ):const SizedBox(),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("تأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),


                                          //                                 InkWell(
                                          //                                   onTap: (){
                                          // // int currentIndex=index??0;
                                          // // if(index==currentIndex) {
                                          // //   },
                                          //   child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              //                                       SizedBox(
                                              //                                         width: 10,
                                              //                                       ),
                                              //
                                              //                                       SizedBox(
                                              //                                         width: 10,
                                              //                                       ),
                                              //                                       AnimatedSwitcher(
                                              //                                         duration: Duration(milliseconds: 500),
                                              //
                                              //                                         child: Container(
                                              //                                           key: Key("${Get.find<AdvertisingInfluenceChannelsController>().checkList!}"),
                                              //                                           child:  Transform(
                                              //                                             alignment: Alignment.center,
                                              //                                             transform: Matrix4.rotationY(
                                              // Get.find<AdvertisingInfluenceChannelsController>().checkList!.contains(advertisingChannels.id)
                                              //                                                     ? math.pi
                                              //                                                     : 0),
                                              //                                             child: Image.asset("images/switchButton.png"),
                                              //                                           ),
                                              //                                         ),
                                              //                                       ),


                                              SizedBox(
                                                width: 15,
                                              ),

                                            ],),
                                          //),
                                          SizedBox(
                                              width: 40,
                                              child:
                                              // Obx(()=>(
                                              GetBuilder<AdvertisingInfluenceChannelsController>(
                                                  init: AdvertisingInfluenceChannelsController(),
                                                  builder: (controller) {
                                                    return
                                                      Switch(
                                                        thumbColor:MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
                                                        trackColor: MaterialStateProperty.all(Color(0xff4391D4)),
                                                        // value: advertisingChannels.type=='ads'?false:true,
                                                        //value: Get.find<AdvertisingInfluenceChannelsController>().type.value=='ads'?false:true,
                                                        value: controller.channels[index].type=='ads'?false:true,
                                                        // value: advertisingChannels.isChecked!,
                                                        onChanged: (value) {
                                                         controller.currentIndex2.value=index;

                                                          //currentIndex=index??0;
                                                          if(index==controller.currentIndex2.value) {
                                                            // if (Get
                                                            //     .find<
                                                            // AdvertisingInfluenceChannelsController>()
                                                            //     .isChecked == true) {
                                                            // Get.find<
                                                            // AdvertisingInfluenceChannelsController>()
                                                            //     .addRemoveCheckList(
                                                            // advertisingChannels.channel_id);
                                                            // print("${Get
                                                            //     .find<
                                                            // AdvertisingInfluenceChannelsController>()
                                                            //     .checkList!}");

                                                            // Get.find<
                                                            // AdvertisingInfluenceChannelsController>()
                                                            //     .channelToggleType(
                                                            // toggleId: advertisingChannels
                                                            //     .channel_id ?? 0);
                                                            // }
                                                            // }
                                                            if (value == false) {
                                                              controller.channels[index].type =
                                                              'ads';
                                                            } else if (value == true) {
                                                              controller.channels[index].type =
                                                              'ads_effect';
                                                            }
                                                            Get.find<
                                                                AdvertisingInfluenceChannelsController>()
                                                                .channelToggleType(
                                                                toggleId: controller.channels[index]
                                                                    .id ?? 0);
                                                            //  }
                                                            //   },
                                                            // );}
                                                            //  )),
                                                          }},);}
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text("إعلان وتأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                                        ],
                                      ),
                                      Text("${controller.channels[index].name}",style: TextStyle(fontSize: 16.sp,color:Color(0xffD37A47),height: 1.3 ),),
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
                                  Text("${controller.channels[index].followers_from}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                                  Text("-",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
                                  Text("${controller.channels[index].followers_to}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),

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
                                      Text("${controller.channels[index].men} % رجال",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                                      Text("${controller.channels[index].boys} % شباب",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("${controller.channels[index].women} % نساء",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
                                      Text("${controller.channels[index].girls} % فتيات",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
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
                                GetBuilder<AdvertisingInfluenceChannelsController>(
                                    init: AdvertisingInfluenceChannelsController(),
                                    builder: (controller) {
                                      return
                                SizedBox(
                                          width: 40,
                                          child: InkWell(
                                              onTap: (){

                                                controller.currentIndex2.value=index;

                                                //currentIndex=index??0;
                                                if(index==controller.currentIndex2.value) {
                                                  if( controller
                                                      .channels[index].status==1)
                                                    controller
                                                        .channels[index].status==0;
                                                  else
                                                    controller
                                                        .channels[index].status==1;
          controller
              .channelToggleStatusView(
          viewId: controller
              .channels[controller.currentIndex2.value]
              .id ?? 0,index:controller.currentIndex2.value);

          }
// setState(() {
//   icon= controller.channels[index].status==1?Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//           ));
// });
                                                    // if(Get.find<AdvertisingInfluenceChannelsController>().isChecked == true){
                                                    //   Get.find<AdvertisingInfluenceChannelsController>().addRemoveCheckListSee(index);
                                                    //Get.find<AdvertisingInfluenceChannelsController>().checkListSee![index!]=Get.find<AdvertisingInfluenceChannelsController>().status.value==1?true:false;
                                                    //if(controller.advertisingChannels2.value.status==0){

                                                    // controller.channels[index]
                                                    //     .status =
                                                    //     controller.status.value;
                                                    //

                                                        //  });
                                                //  }
                                            //  });
                                          },

                                              // controller.update();
                                              //                               controller.icon.value= Padding(
                                              // padding: const EdgeInsets.all(5.0),
                                              // child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
                                              // );
                                              //                              controller.update();
                                              //                             }else{
                                              //                              // advertisingChannels2.status=0;
                                              //                               controller.icon.value=Padding(
                                              //                               padding: const EdgeInsets.all(5.0),
                                              // child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
                                              // ));
                                              //                               controller.update();
                                              //                             }



                                              // controller.advertisingChannels2.value.status=controller.status.value;
                                              // print("${Get.find<AdvertisingInfluenceChannelsController>().isChecked} ${advertisingChannels.id}");

                                              // child: Obx(()=>( Get.find<AdvertisingInfluenceChannelsController>().checkListSee![index!] == true ? Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),):Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),))),
                                               child://icon,),),
                                            controller.channels[index].status==1?Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
                                                  ))));}),
          //);
                                      // index==currentIndex&&controller.advertisingChannels2.value.status==1? Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
                                      // ): index==currentIndex&&controller.advertisingChannels2.value.status==0?Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
                                      //   ),):
                                      //  widget.advertisingChannels.status==1?Padding(
                                      // padding: const EdgeInsets.all(5.0),
                                      // child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
                                      //   ),));// Obx(()=>(

                                      //controller.advertisingChannels2.value.status==1 ? icon);
                                      //  Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
                                      // ):Padding(
                                      //   padding: const EdgeInsets.all(5.0),
                                      //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
                                      //   ),

                                   // }


                                InkWell(
                                  onTap: (){
                                    Get.toNamed('/EditAdvertiserChannel?channel=${jsonEncode( controller.channels[index])}');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.edit,color: Color(0xff5aa1d0),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    CoolAlert.show(
                                      context: context,title: "تحذير",
                                      type: CoolAlertType.warning,
                                      cancelBtnText: "الغاء",
                                      showCancelBtn: true,
                                      confirmBtnText: "حذف",
                                      text: 'هل تريد بالفعل حذف هذه القناة ؟',
                                      onConfirmBtnTap: (){
                                        controller.deleteChannel(channelId: controller.channels[index].id??0);
                                      },onCancelBtnTap: (){
                                        Navigator.pop(context);
                                    }
                                    );


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
              ),
            )
            );
        }):Center(
      child: Text("لا يوجد قنوات لهذا المعلن"),
    ));
  }
}



// class AdvertisingChannel {
//   int? id;
//   bool? isChecked;
//   String? socialTitle,iconUrl,minFollower,maxFollower,men,women,boys,girls;
//   AdvertisingChannel({
//     this.id,this.isChecked,this.boys,this.girls,this.iconUrl,this.maxFollower,this.men,this.minFollower,this.socialTitle,this.women
//   });
// }
//
// List <AdvertisingChannel> advertisingChannels = [
//   AdvertisingChannel(
//       id: 1,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: true,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
//   AdvertisingChannel(
//       id: 2,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: false,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
//   AdvertisingChannel(
//       id: 3,
//       boys: "70 % شباب",
//       maxFollower: "2500000",
//       girls: "70 % فتيات",
//       men: "70 % رجال",
//       women: "70 % نساء",
//       iconUrl: "images/snapshat_icon.png",
//       isChecked: false,
//       minFollower: "1000000",
//       socialTitle: "Snapchat .com / gdshh"
//   ),
// ];