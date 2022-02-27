// import 'dart:convert';
//
// import 'package:advertisers/app_core/network/models/ChannelData.dart';
// import 'package:advertisers/features/advertising_influence_channels/controller/advertising_influence_channels_controller.dart';
// import 'package:advertisers/features/advertising_influence_channels/view/widgets/advertising_influence_channels_list_widget.dart';
// import 'package:advertisers/shared/gradient_check_box/gradient_check_box.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'dart:math' as math;
// class AdvertisingInfluenceChannelsPageWidget extends StatefulWidget {
//
//    late final ChannelData advertisingChannels;
//    final int? index;
//   AdvertisingInfluenceChannelsPageWidget({
//     required this.advertisingChannels,
//     required this.index
//   });
//   @override
//   _AdvertisingInfluenceChannelsPageWidgetState createState() => _AdvertisingInfluenceChannelsPageWidgetState();
// }
//
// class _AdvertisingInfluenceChannelsPageWidgetState extends State<AdvertisingInfluenceChannelsPageWidget> {
//
//
//
//   // bool? isChecked ;
// int currentIndex=0;
// late Widget icon;
//
//
//   @override
//   Widget build(BuildContext context) {
//     Get.find<AdvertisingInfluenceChannelsController>().status.value=Get.find<AdvertisingInfluenceChannelsController>().isChecked==true?1:0;
//     //currentIndex=index??0;
//     Get.find<AdvertisingInfluenceChannelsController>().type.value=widget.advertisingChannels.type??'ads';
//     final AdvertisingInfluenceChannelsController _advertisingInfluenceChannelsController=Get.put(AdvertisingInfluenceChannelsController());
//     _advertisingInfluenceChannelsController.checkListSee!.add(widget.advertisingChannels.status==1?true:false) ;
//     // return
//     //   GetBuilder<AdvertisingInfluenceChannelsController>(
//     //   init: AdvertisingInfluenceChannelsController(),
//     //   builder: (controller) {
//         // isChecked = advertisingChannels.isChecked;
//         // controller.isCheckedSee = isChecked!;
//    // _advertisingInfluenceChannelsController.advertisingChannels2.value=widget.advertisingChannels;
//     icon= widget.advertisingChannels.status==1?Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//         ));
//
//        return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Card(
//             clipBehavior: Clip.antiAlias,
//             elevation: 6,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(15.0),
//               ),
//             ),
//             child: IntrinsicHeight(
//               child: SizedBox(
//                 width: 325.w,
//                 child: Row(
//                   children: [
//                     Expanded(child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             widget.advertisingChannels!=null ?Image.network(
//                               "${widget.advertisingChannels.channel?.image}",
//                               height: 65,
//                               width: 65,
//                               errorBuilder: (context,object,err){
//                                 return Image.asset('images/no_image_available.png',height: 70);
//                               },
//                             ):const SizedBox(),
//                             Container(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text("تأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
//
//
//     //                                 InkWell(
//     //                                   onTap: (){
//     // // int currentIndex=index??0;
//     // // if(index==currentIndex) {
//     // //   },
//                                      //   child:
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.end,
//                                           children: [
//     //                                       SizedBox(
//     //                                         width: 10,
//     //                                       ),
//     //
//     //                                       SizedBox(
//     //                                         width: 10,
//     //                                       ),
//     //                                       AnimatedSwitcher(
//     //                                         duration: Duration(milliseconds: 500),
//     //
//     //                                         child: Container(
//     //                                           key: Key("${Get.find<AdvertisingInfluenceChannelsController>().checkList!}"),
//     //                                           child:  Transform(
//     //                                             alignment: Alignment.center,
//     //                                             transform: Matrix4.rotationY(
//     // Get.find<AdvertisingInfluenceChannelsController>().checkList!.contains(advertisingChannels.id)
//     //                                                     ? math.pi
//     //                                                     : 0),
//     //                                             child: Image.asset("images/switchButton.png"),
//     //                                           ),
//     //                                         ),
//     //                                       ),
//
//
//                                             SizedBox(
//                                               width: 15,
//                                             ),
//
//                                           ],),
//                                       //),
//                                       SizedBox(
//                                         width: 40,
//                                         child:
//                                           // Obx(()=>(
//                                         GetBuilder<AdvertisingInfluenceChannelsController>(
//                                             init: AdvertisingInfluenceChannelsController(),
//                                             builder: (controller) {
//                                             return
//     Switch(
//                                               thumbColor:MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
//                                               trackColor: MaterialStateProperty.all(Color(0xff4391D4)),
//                                              // value: advertisingChannels.type=='ads'?false:true,
//                                                 //value: Get.find<AdvertisingInfluenceChannelsController>().type.value=='ads'?false:true,
//                                                 value: widget.advertisingChannels.type=='ads'?false:true,
//                                               // value: advertisingChannels.isChecked!,
//                                               onChanged: (value) {
//                                                 currentIndex=widget.index??0;
//
//                                                 //currentIndex=index??0;
//                                                 if(widget.index==currentIndex) {
//                                                   // if (Get
//                                                   //     .find<
//                                                   // AdvertisingInfluenceChannelsController>()
//                                                   //     .isChecked == true) {
//                                                   // Get.find<
//                                                   // AdvertisingInfluenceChannelsController>()
//                                                   //     .addRemoveCheckList(
//                                                   // advertisingChannels.channel_id);
//                                                   // print("${Get
//                                                   //     .find<
//                                                   // AdvertisingInfluenceChannelsController>()
//                                                   //     .checkList!}");
//
//                                                   // Get.find<
//                                                   // AdvertisingInfluenceChannelsController>()
//                                                   //     .channelToggleType(
//                                                   // toggleId: advertisingChannels
//                                                   //     .channel_id ?? 0);
//                                                   // }
//                                                   // }
//                                                   if (value == false) {
//                                                     widget.advertisingChannels.type =
//                                                     'ads';
//                                                   } else if (value == true) {
//                                                     widget.advertisingChannels.type =
//                                                     'ads_effect';
//                                                   }
//                                                   Get.find<
//                                                       AdvertisingInfluenceChannelsController>()
//                                                       .channelToggleType(
//                                                       toggleId: widget.advertisingChannels
//                                                           .id ?? 0);
//                                                   //  }
//                                                   //   },
//                                                   // );}
//                                                   //  )),
//                                                 }},);}
//   )),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text("إعلان وتأثير",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
//                                     ],
//                                   ),
//                                   Text("${widget.advertisingChannels.channel?.name}",style: TextStyle(fontSize: 16.sp,color:Color(0xffD37A47),height: 1.3 ),),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             Container(),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(child: Text("عدد المتابعين",style: TextStyle(fontSize: 16.sp,color: Colors.grey),)),
//                               Text("${widget.advertisingChannels.followers_from}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
//                               Text("-",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
//                               Text("${widget.advertisingChannels.followers_to}",style: TextStyle(fontSize: 16.sp,color:Color(0xff244094) ),),
//
//                             ],
//                           ),
//                         ),
// // const  SizedBox(
// //     height: 6,
// //   ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(child: Text("شريحة المتأثرين",style: TextStyle(fontSize: 16.sp,color: Colors.grey),)),
//                               Column(
//                                 children: [
//                                   Text("${widget.advertisingChannels.men} % رجال",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
//                                   Text("${widget.advertisingChannels.boys} % شباب",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   Text("${widget.advertisingChannels.women} % نساء",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
//                                   Text("${widget.advertisingChannels.girls} % فتيات",style: TextStyle(fontSize: 14.sp,color: Colors.grey),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     )),
//                     Container(
//                       color: Color(0xfff1f1f1),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                         GetBuilder<AdvertisingInfluenceChannelsController>(
//                         init: AdvertisingInfluenceChannelsController(),
//                         builder: (controller) {
//                       return
//                             SizedBox(
//                               width: 40,
//                               child: InkWell(
//                                 onTap: ()async{
//                                     setState(() async{
//                                    currentIndex=widget.index??0;
//                                   if(currentIndex==widget.index){
//                                     await controller.channelToggleStatusView(viewId: widget.advertisingChannels.id??0);
//
//                                     // if(Get.find<AdvertisingInfluenceChannelsController>().isChecked == true){
//     //   Get.find<AdvertisingInfluenceChannelsController>().addRemoveCheckListSee(index);
//     //Get.find<AdvertisingInfluenceChannelsController>().checkListSee![index!]=Get.find<AdvertisingInfluenceChannelsController>().status.value==1?true:false;
//     //if(controller.advertisingChannels2.value.status==0){
//
//     widget.advertisingChannels.status=controller.status.value;
//     icon= widget.advertisingChannels.status==1?Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
//     padding: const EdgeInsets.all(5.0),
//     child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//     ));}
//
//     });},
//
//                                       // controller.update();
//     //                               controller.icon.value= Padding(
//     // padding: const EdgeInsets.all(5.0),
//     // child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
//     // );
//     //                              controller.update();
//     //                             }else{
//     //                              // advertisingChannels2.status=0;
//     //                               controller.icon.value=Padding(
//     //                               padding: const EdgeInsets.all(5.0),
//     // child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//     // ));
//     //                               controller.update();
//     //                             }
//
//
//
//                                    // controller.advertisingChannels2.value.status=controller.status.value;
//                                  // print("${Get.find<AdvertisingInfluenceChannelsController>().isChecked} ${advertisingChannels.id}");
//
//                                // child: Obx(()=>( Get.find<AdvertisingInfluenceChannelsController>().checkListSee![index!] == true ? Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),):Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),))),
//                                 child:icon),
//                             );
//                               // index==currentIndex&&controller.advertisingChannels2.value.status==1? Padding(
//                               //   padding: const EdgeInsets.all(5.0),
//                               //   child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
//                               // ): index==currentIndex&&controller.advertisingChannels2.value.status==0?Padding(
//                               //   padding: const EdgeInsets.all(5.0),
//                               //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//                               //   ),):
//                             //  widget.advertisingChannels.status==1?Padding(
//                             // padding: const EdgeInsets.all(5.0),
//                             // child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0))):Padding(
//                             //   padding: const EdgeInsets.all(5.0),
//                             //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//                             //   ),));// Obx(()=>(
//
//                                //controller.advertisingChannels2.value.status==1 ? icon);
//                               //  Padding(
//                               //   padding: const EdgeInsets.all(5.0),
//                               //   child: Icon(Icons.remove_red_eye_outlined,color: Color(0xff5aa1d0),),
//                               // ):Padding(
//                               //   padding: const EdgeInsets.all(5.0),
//                               //   child: Image.asset("images/icon_eye_off.png",height: 25,width:25,//Icon(Icons.remove_red_eye,color: Color(0xff5aa1d0),
//                               //   ),
//
//                         }),
//
//                             InkWell(
//                               onTap: (){
//                                 Get.toNamed('/EditAdvertiserChannel?channel=${jsonEncode(widget.advertisingChannels)}');
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Icon(Icons.edit,color: Color(0xff5aa1d0),),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: (){
//                                 _advertisingInfluenceChannelsController.deleteChannel(channelId:widget.advertisingChannels.id??0);
//
//                               },
//                               child: Icon(Icons.delete_forever,color: Color(0xff5aa1d0),),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//  );
//     //   },
//     // );
//   }
// }
//
