// import 'package:advertisers/app_core/network/models/ListChatModel.dart';
// import 'package:advertisers/features/chat/controller/chat_messages_controller.dart';
// import 'package:advertisers/features/chat/view/widgets/PlayChatAudio.dart';
// import 'package:advertisers/features/chat/view/widgets/video_chat_widget.dart';
// import 'package:advertisers/main.dart';
// import 'package:clipboard/clipboard.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_file_view/flutter_file_view.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:quds_popup_menu/quds_popup_menu.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:io';
// enum ChatUser {
//   sender,
//   receiver,
// }
//
// class ChatContentWidget extends StatelessWidget {
//   //bool tapped=false;
//   final ChatMessagesController chatMessagesController;
//   final ChatUser chatUser;
//   final ListChatModel message;
//   final String type;
//   final int index;
//   final String? path;
//   late BuildContext alertContext;
//   ScrollController _scrollController = new ScrollController();
//   ItemScrollController itemScrollController;
//   String downloadsPath;
//   ChatContentWidget(
//       {Key? key,
//         this.path,
//         required this.index,
//         required this.chatUser,
//         required this.message,
//         required this.type,required this.downloadsPath,
//         required this.chatMessagesController,required this.itemScrollController})
//       : super(key: key);
//   CustomPopupMenuController? menuController = CustomPopupMenuController();
//   @override
//   Widget build(BuildContext context) {
//     //currentIndex=index;
//     alertContext = context;
//     print('%%%%%%%%%%%%%%${chatMessagesController.isStar}');
//     return CustomPopupMenu(
//
//       menuBuilder: chatMessagesController.replied.value == true
//           ? () => SizedBox()
//           : getMenuItems,
//       pressType: PressType.longPress,
//       controller: menuController,showArrow: false,enablePassEvent: true,
//       position: chatMessagesController.chatIndex.value<3?PreferredPosition.bottom:chatMessagesController.chatIndex.value>chatMessagesController.messagesChat.length-3?PreferredPosition.top:PreferredPosition.bottom,
//       child: InkWell(
//
//         onTap: type == 'location'
//             ? () async {
//           String lat = message.message!
//               .substring(0, message.message!.lastIndexOf('-') - 1);
//           String lon = message.message!
//               .substring(message.message!.lastIndexOf('-') - 1);
//           print('>>>>>>>>>>>>>>>>$lat $lon');
//           final url =
//               'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
//           if (await canLaunch(url)) {
//             await launch(url);
//           } else {
//             throw 'Could not launch $url';
//           }
//         }
//             : null,
//         // child: GestureDetector(
//         //   onLongPress:(){
//         //     List desiredIndex= chatMessagesController.messagesChat.map((element){
//         //       if(element.id==message.replied_message?.id){
//         //         print("Indexxxxxxxxxxxxxxxxxxxxxxxxx${element.id}");
//         //         return chatMessagesController.messagesChat.indexOf(element)+1;
//         //       }
//         //       return 0;
//         //     }).toList();
//         //     SchedulerBinding.instance?.addPostFrameCallback((_) {
//         //       itemScrollController.scrollTo(
//         //           index: desiredIndex[0],
//         //           duration: const Duration(seconds: 2),
//         //           curve: Curves.easeInOutCubic);
//         //       // _scrollController.animateTo(_height * index,
//         //       //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
//         //     } );},
//         child: Column(
//           crossAxisAlignment: chatUser == ChatUser.sender
//               ? CrossAxisAlignment.start
//               : CrossAxisAlignment.end,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (chatUser == ChatUser.sender)
//                   SizedBox(
//                     width: 200.w,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 12.0,
//                             right: 12,
//                             top: 8,
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100.0),
//                             child: Image.network(
//                                 message.from_user?.image ?? ' ',
//                                 height: 20.0,
//                                 width: 20.0,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, o, e) {
//                                   return Image.asset(
//                                     'images/no_image_available.png',
//                                     height: 20.0,
//                                     width: 20.0,
//                                     fit: BoxFit.cover,
//                                   );
//                                 }),
//                           ),
//                         ),
//                          if (chatUser == ChatUser.sender)
//                        // chatUser == ChatUser.receiver||message.from_me==false?
//                         message.from_user?.id.toString()==storage.read("id",).toString()?
//                        Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 0.0,
//                             vertical: 8,
//                           ),
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               message.from_user?.username ?? ' ',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ):Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 0.0,
//                             vertical: 8,
//                           ),
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               message.to_user?.username ?? ' ',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 //if (chatUser == ChatUser.sender) SizedBox(width: 130.w,),
//                 chatUser == ChatUser.receiver? Padding(
//                   padding: EdgeInsets.only(
//                     right: 48.0.w,
//                     //vertical: 8,
//                   ),
//                   child: Text(
//                     message.sent_at ?? ' ',
//                     style: TextStyle(
//                       color: Colors.black54,
//                       // fontWeight: FontWeight.bold,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ):Padding(
//                   padding: EdgeInsets.only(
//                     left: 10.0.w,
//                     //vertical: 8,
//                   ),
//                   child: Text(
//                     message.sent_at ?? ' ',
//                     style: TextStyle(
//                       color: Colors.black54,
//                       // fontWeight: FontWeight.bold,
//                       fontSize: 10,
//                     ),
//                   ),
//                 ),
//
//                 if (chatUser == ChatUser.sender)
//                   SizedBox(
//                     width: 20.w,
//                   ),
//                 // if (chatUser == ChatUser.receiver) const Spacer(),
//                 if (chatUser == ChatUser.receiver)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       //chatUser == ChatUser.receiver?
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 0.0,
//                           vertical: 8,
//                         ),
//                         child: Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Text(
//                             message.from_user?.username ?? ' ',
//                             style: TextStyle(
//                               color: Colors.blueAccent,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                       if (chatUser == ChatUser.sender)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 0.0,
//                             vertical: 8,
//                           ),
//                           child: Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Text(
//                               message.to_user?.username ?? ' ',
//                               style: TextStyle(
//                                 color: Colors.blueAccent,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       //   if (chatUser == ChatUser.receiver)
//                       chatUser == ChatUser.receiver? Padding(
//                         padding: EdgeInsets.only(
//                           left: 12.0,
//                           right: 12,
//                           top: 8,
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(100.0),
//                           child: Image.network(
//                             message.from_user?.image ?? ' ',
//                             height: 20.0,
//                             width: 20.0,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, o, e) {
//                               return Image.asset(
//                                 'images/no_image_available.png',
//                                 height: 20.0,
//                                 width: 20.0,
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           ),
//                         ),
//                       ):Padding(
//                         padding: EdgeInsets.only(
//                           left: 12.0,
//                           right: 12,
//                           top: 8,
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(100.0),
//                           child: Image.network(
//                             message.to_user?.image ?? ' ',
//                             height: 20.0,
//                             width: 20.0,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, o, e) {
//                               return Image.asset(
//                                 'images/no_image_available.png',
//                                 height: 20.0,
//                                 width: 20.0,
//                                 fit: BoxFit.cover,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//               ],
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(
//                 top: 0,
//                 bottom: 4,
//                 left:
//                 // Get.locale?.languageCode == const Locale('en').languageCode
//                 //     ? chatUser == ChatUser.sender
//                 //         ? 30
//                 //         : 4
//                 //   :
//                 chatUser == ChatUser.sender ? 14 : 30,
//                 right:
//                 // Get.locale?.languageCode == const Locale('en').languageCode
//                 //     ? chatUser == ChatUser.sender
//                 //         ? 4
//                 //         : 30
//                 //     :
//                 chatUser == ChatUser.sender ? 30 : 4,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color:const Color(0xffE8E8E8),
//                     borderRadius: BorderRadius.circular(7)
//                 ),
//
//                 child: Column(
//                   children: [
//                     message.replied_message != null?GestureDetector(
//                       onLongPress:(){
//                         List desiredIndex= chatMessagesController.messagesChat.map((element){
//                           if(element.id==message.replied_message?.id){
//                             print("Indexxxxxxxxxxxxxxxxxxxxxxxxx${element.id}");
//                             return chatMessagesController.messagesChat.indexOf(element)+1;
//                           }
//                           return 0;
//                         }).toList();
//                         SchedulerBinding.instance?.addPostFrameCallback((_) {
//                           itemScrollController.scrollTo(
//                               index: desiredIndex[0],
//                               duration: const Duration(seconds: 1),
//                               curve: Curves.easeInOutCubic);
//                           // _scrollController.animateTo(_height * index,
//                           //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
//                         } );},
//                       child: Container(
//                           width: 244.w,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             // border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.transparent),
//                           child: message.message_type == 'text'
//                               ? Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Container(
//                               height: 150,
//                               width: 244.w,
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: Colors.black),
//                                 // color: Colors.lightBlueAccent,
//                                   color: const Color(0xffE8E8E8),
//                                   borderRadius: BorderRadius.circular(25)),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 4.0),
//                                     child: Container(
//                                       width: 10,
//                                       height: 140,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topRight: Radius.circular(25),
//                                             bottomRight: Radius.circular(25)),
//                                         color: Colors.indigo,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 220.w,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         // Align(
//                                         //   alignment:Alignment.centerLeft,
//                                         //   child: InkWell(
//                                         //     onTap: (){
//                                         //       _chatMessagesController.replied.value=false;
//                                         //     },
//                                         //     child: Padding(
//                                         //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//                                         //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                        // message.from_me == true
//                                         chatMessagesController.messagesChat[chatMessagesController.chatIndex.value].from_user?.id==storage.read("id",)
//                                             ? Text('you')
//                                             : Text(
//                                             message.to_user?.username ??
//                                                 ' '),
//                                         Text(
//                                           chatMessagesController.replied.value==true ?chatMessagesController.messagesChat[chatMessagesController.chatIndex.value].message ?? ' ':message.replied_message?.message??'',
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                               : message.message_type == 'sound' ||
//                               message.message_type == 'audio'
//                               ? Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Container(
//                               height: 150,
//                               width: 244.w,
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: Colors.black),
//                                 // color: Colors.lightBlueAccent,
//                                   color: const Color(0xffE8E8E8),
//                                   borderRadius: BorderRadius.circular(25)),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                     const EdgeInsets.only(left: 4.0),
//                                     child: Container(
//                                       width: 10,
//                                       height: 140,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topRight: Radius.circular(25),
//                                             bottomRight:
//                                             Radius.circular(25)),
//                                         color: Colors.indigo,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 220.w,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         // Align(
//                                         //   alignment:Alignment.centerLeft,
//                                         //   child: InkWell(
//                                         //     onTap: (){
//                                         //       chatMessagesController.replied.value=false;
//                                         //     },
//                                         //     child: Padding(
//                                         //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//                                         //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         message.from_me == true
//                                             ? Text('you')
//                                             : Text(message
//                                             .from_user?.username ??
//                                             ' '),
//                                         Text("Voice Message"),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                               : message.message_type == 'video'
//                               ? Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Container(
//                               height: 150,
//                               width: 244.w,
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: Colors.black),
//                                 // color: Colors.lightBlueAccent,
//                                   color: const Color(0xffE8E8E8),
//                                   borderRadius:
//                                   BorderRadius.circular(25)),
//                               child: Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 4.0),
//                                     child: Container(
//                                       width: 10,
//                                       height: 140,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topRight:
//                                             Radius.circular(25),
//                                             bottomRight:
//                                             Radius.circular(25)),
//                                         color: Colors.indigo,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 220.w,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         // Align(
//                                         //   alignment:Alignment.centerLeft,
//                                         //   child: InkWell(
//                                         //     onTap: (){
//                                         //       chatMessagesController.replied.value=false;
//                                         //     },
//                                         //     child: Padding(
//                                         //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//                                         //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         message.from_me == true
//                                             ? Text('you')
//                                             : Text(message.from_user
//                                             ?.username ??
//                                             ' '),
//                                         Text('Video Message'),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                               : message.message_type == 'location'
//                               ? Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Container(
//                                   height: 150,
//                                   width: 244.w,
//                                   decoration: BoxDecoration(
//                                     // border: Border.all(color: Colors.black),
//                                     // color: Colors.lightBlueAccent,
//                                       color: const Color(0xffE8E8E8),
//                                       borderRadius:
//                                       BorderRadius.circular(25)),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(
//                                               left: 4.0),
//                                           child: Container(
//                                             width: 10,
//                                             height: 140,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.only(
//                                                   topRight: Radius
//                                                       .circular(
//                                                       25),
//                                                   bottomRight: Radius
//                                                       .circular(
//                                                       25)),
//                                               color: Colors.indigo,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 220.w,
//                                           child: Column(
//                                             crossAxisAlignment:
//                                             CrossAxisAlignment
//                                                 .start,
//                                             children: [
//                                               // Align(
//                                               //   alignment:Alignment.centerLeft,
//                                               //   child: InkWell(
//                                               //     onTap: (){
//                                               //       chatMessagesController.replied.value=false;
//                                               //     },
//                                               //     child: Padding(
//                                               //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//                                               //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//                                               //     ),
//                                               //   ),
//                                               // ),
//                                               message.from_me == true
//                                                   ? Text('you')
//                                                   : Text(message
//                                                   .from_user
//                                                   ?.username ??
//                                                   ' '),
//                                               Text(
//                                                   'Location Message'),
//                                             ],
//                                           ),
//                                         )
//                                       ])))
//                               : const SizedBox(
//                             height: 0,
//                           )),
//                     ):  const SizedBox(
//                       height: 0,
//                     ),
//
//                     // Padding(
//                     //     padding: EdgeInsets.only(
//                     //         top: 0,
//                     //         bottom: 4,
//                     //         left:
//                     //             // Get.locale?.languageCode == const Locale('en').languageCode
//                     //             //     ? chatUser == ChatUser.sender
//                     //             //         ? 30
//                     //             //         : 4
//                     //             //   :
//                     //             chatUser == ChatUser.sender ? 14 : 30,
//                     //         right:
//                     //             // Get.locale?.languageCode == const Locale('en').languageCode
//                     //             //     ? chatUser == ChatUser.sender
//                     //             //         ? 4
//                     //             //         : 30
//                     //             //     :
//                     //             chatUser == ChatUser.sender ? 30 : 4,
//                     //     ),
//                     //     child:
//                     GetBuilder<ChatMessagesController>(
//                       init: ChatMessagesController(),
//                       //initState: (_) => AuthController().fetchUserData(),
//                       builder: (controller) {
//                         if (controller.tapped.value == true &&
//                             index == controller.chatIndex.value) {
//                           // chatMessagesController.messagesChat[index].starred =
//                           //     controller.isStar.value == 1 ? true : false;
//                           controller.tapped.value = false;
//                           //controller.isStar.value==0;
//                           return Stack(
//                             overflow: Overflow.visible,
//                             fit: StackFit.passthrough,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     border: // message.starred == true||
//                                     chatMessagesController.isStar.value == 1
//                                         ?  chatUser == ChatUser.sender?Border.all(color: Colors.black)
//                                         :Border.all(color: Colors.blueAccent): Border.all(
//                                         width: 0,
//                                         color: Colors.transparent),
//                                     color: chatUser == ChatUser.sender
//                                         ? const Color(0xffE8E8E8)
//                                         : const Color(0xff44A2D7),
//                                     borderRadius: BorderRadius.circular(5)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 0.0,
//                                     vertical: 0,
//                                   ),
//                                   child: //type=='sound'?PlayChatAudio(url:message.message??' '):SizedBox()
//                                   type == 'text'
//                                       ? Text(
//                                     message.message ?? ' ',
//                                     style: TextStyle(
//                                       color: chatUser == ChatUser.sender
//                                           ? const Color(0xff4186CF)
//                                           : Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16.sp,
//                                     ),
//                                   )
//                                       : type == 'location'
//                                       ? Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(7)
//                                     ),
//                                     height: 139,
//                                     width: 301.w,
//                                     child: Image.asset(
//                                       'images/gps-og-image.jpg',
//                                       height: 139,
//                                       width: 301.w,fit: BoxFit.cover,
//                                     ),
//                                   )
//                                       : type == 'sound'
//                                       ? Container(
//                                       width: 301.w,
//                                       child: PlayChatAudio(
//                                           url: message.message ??
//                                               ' '))
//                                       : type == 'video'
//                                       ? VideoChatWidget(
//                                     url: message.message,
//                                   )
//                                       :type=='image'? SizedBox(
//                                     height: 139,
//                                     width: 301.w,
//                                     child: message.message!=null&&message.message!.contains('http')?Image.network(
//                                         message.message ??
//                                             ' ',
//                                         errorBuilder:
//                                             (context, l, t) {
//                                           return Text(
//                                               "???????????? ?????? ??????????");
//                                         }):Image.file(File(message.message??''),errorBuilder:(context, l, t) {
//     return Text(
//     "???????????? ?????? ??????????");})
//
//                         ):SizedBox(
//                                       height: 139,
//                                       width: 301.w,
//                                       child: message.message!=null&&message.message!.contains('http')? NetworkFileViewer(downloadUrl:message.message??'', downloadPath: path??'',onViewPressed: () {
//
//                                       },):LocalFileViewer(filePath: message.message??'')))
//                               ),
//                               //message.starred == true ||
//                               chatMessagesController.isStar.value == 1
//                                   ? chatUser== ChatUser.sender? Positioned(
//                                   top: -15,
//                                   left: -10,
//                                   child: Icon(
//                                     Icons.star,
//                                     color: Color(0xffF29423),
//                                   )):Positioned(
//                                   top:-15,
//                                   right: -10,
//                                   child: Icon(
//                                     Icons.star,
//                                     color: Color(0xffF29423),
//                                   ))
//                                   : SizedBox(),
//                             ],
//                           );
//                         } else {
//                           return Stack(
//                             overflow: Overflow.visible,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     border: message.starred == true
//                                         ? Border.all(color: Colors.blueAccent)
//                                         : Border.all(
//                                         width: 0, color: Colors.transparent),
//                                     color: chatUser == ChatUser.sender
//                                         ? const Color(0xffE8E8E8)
//                                         : const Color(0xff44A2D7),
//                                     borderRadius: BorderRadius.circular(5)),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: type == 'text' ? 18.0 : 0,
//                                     vertical: type == 'text' ? 8 : 0,
//                                   ),
//                                   child: //type=='sound'?PlayChatAudio(url:message.message??' '):SizedBox()
//                                   type == 'text'
//                                       ? Text(
//                                     message.replied_message!=null&&controller.replied.value==true&&controller.chatIndex.value==index?message.replied_message?.message??'':message.message??''
//                                     ,
//                                    // message.message ?? ' ',
//                                     style: TextStyle(
//                                       color: chatUser == ChatUser.sender
//                                           ? const Color(0xff4186CF)
//                                           : Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16.sp,
//                                     ),
//                                   )
//                                       : type == 'location'
//                                       ? Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(7)
//                                     ),
//                                     height: 139,
//                                     width: 301.w,
//                                     child: Image.asset(
//                                       'images/gps-og-image.jpg',
//                                       height: 139,
//                                       width: 301.w,fit: BoxFit.cover,
//                                     ),
//                                   )
//                                       : type == 'sound'
//                                       ? PlayChatAudio(
//                                       url: message.message ?? ' ')
//                                       : type == 'video'
//                                       ? VideoChatWidget(
//                                     url: message.message,
//                                   )
//                                       : type=="image"?SizedBox(
//                                     height: 139.h,
//                                     width: 301.w,
//                                     child: message.message!=null&&message.message!.contains('http')?Image.network(
//                                         message.message ??
//                                             ' ',
//                                         errorBuilder:
//                                             (context, l, t) {
//                                           return Text(
//                                               "???????????? ?????? ??????????");
//                                         }):Image.file(File(message.message??''),errorBuilder:(context, l, t) {
//                         return Text(
//                         "???????????? ?????? ??????????");}),
//                                   ):SizedBox(
//                                     height: 364,
//                                       width: 301.w,
//                                       child:message.message!=null&&message.message!.contains('http')? NetworkFileViewer(downloadUrl:message.message??'', downloadPath: path??'',onViewPressed: () {
//
//                                       },):LocalFileViewer(filePath: message.message??'')),
//                                 ),
//                               ),
//                               message.starred == true
//                                   ?chatUser==ChatUser.sender? const Positioned(
//                                   top: -15,
//                                   left: -10,
//                                   child: Icon(
//                                     Icons.star,
//                                     color: Color(0xffF29423),
//                                   )):const Positioned(
//                                   top: -15,
//                                   right: -10,
//                                   child: Icon(
//                                     Icons.star,
//                                     color: Color(0xffF29423),
//                                   ))
//                                   : SizedBox()
//                             ],
//                           );
//                         }
//                         // return SizedBox();
//                       },
//                     )
//                     //),
//                   ],
//                 ),
//               ),
//             ),
//
//             // message.replied_message!=null?  Container(
//             //
//             //     decoration: BoxDecoration(
//             //       border: Border.all(color:Colors.grey ),
//             //     ),
//             //     child: Text(message.message??' '),
//             //   ):const SizedBox()
//             //   message.replied_message!=null?
//             //   Container(
//             //       width:244.w,
//             //       height: 100,
//             //
//             //       decoration:BoxDecoration(
//             //         // border: Border.all(color: Colors.grey),
//             //           borderRadius: BorderRadius.circular(15),
//             //           color: Colors.transparent
//             //       ),
//             //       child:  message.message_type=='text'?Padding(
//             //         padding: const EdgeInsets.all(4.0),
//             //         child: Container(
//             //           height: 150,
//             //           width: 244.w,
//             //           decoration:BoxDecoration(
//             //             // border: Border.all(color: Colors.black),
//             //             // color: Colors.lightBlueAccent,
//             //               color: const Color(0xffE8E8E8),
//             //               borderRadius: BorderRadius.circular(25)),
//             //
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.only(left: 4.0),
//             //                 child: Container(
//             //                   width: 10,
//             //                   height: 140,
//             //                   decoration: BoxDecoration(
//             //                     borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
//             //                     color: Colors.indigo,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(
//             //                 width:220.w,
//             //                 child: Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: [
//             //                     // Align(
//             //                     //   alignment:Alignment.centerLeft,
//             //                     //   child: InkWell(
//             //                     //     onTap: (){
//             //                     //       _chatMessagesController.replied.value=false;
//             //                     //     },
//             //                     //     child: Padding(
//             //                     //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//             //                     //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//             //                     //     ),
//             //                     //   ),
//             //                     // ),
//             //                     message.from_me==true?Text('you'):Text(message.from_user?.username??' '),
//             //                     Text(message.message??' ',overflow: TextOverflow.ellipsis,),
//             //                   ],
//             //                 ),
//             //               ),
//             //
//             //             ],
//             //           ),
//             //         ),
//             //       ):
//             //       message.message_type=='sound'||message.message_type=='audio'?Padding(
//             //         padding: const EdgeInsets.all(4.0),
//             //         child: Container(
//             //           height: 150,
//             //           width: 244.w,
//             //           decoration:BoxDecoration(
//             //             // border: Border.all(color: Colors.black),
//             //             // color: Colors.lightBlueAccent,
//             //               color: const Color(0xffE8E8E8),
//             //               borderRadius: BorderRadius.circular(25)),
//             //
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.only(left: 4.0),
//             //                 child: Container(
//             //                   width: 10,
//             //                   height: 140,
//             //                   decoration: BoxDecoration(
//             //                     borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
//             //                     color: Colors.indigo,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(
//             //                 width:220.w,
//             //                 child: Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: [
//             //                     // Align(
//             //                     //   alignment:Alignment.centerLeft,
//             //                     //   child: InkWell(
//             //                     //     onTap: (){
//             //                     //       chatMessagesController.replied.value=false;
//             //                     //     },
//             //                     //     child: Padding(
//             //                     //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//             //                     //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//             //                     //     ),
//             //                     //   ),
//             //                     // ),
//             //                     message.from_me==true?Text('you'):Text(message.from_user?.username??' '),
//             //                     Text("Voice Message"),
//             //                   ],
//             //                 ),
//             //               ),
//             //
//             //             ],
//             //           ),
//             //         ),
//             //       )
//             //
//             //
//             //
//             //           : message.message_type=='video'?
//             //       Padding(
//             //         padding: const EdgeInsets.all(4.0),
//             //         child: Container(
//             //           height: 150,
//             //           width: 244.w,
//             //           decoration:BoxDecoration(
//             //             // border: Border.all(color: Colors.black),
//             //             // color: Colors.lightBlueAccent,
//             //               color: const Color(0xffE8E8E8),
//             //               borderRadius: BorderRadius.circular(25)),
//             //
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.only(left: 4.0),
//             //                 child: Container(
//             //                   width: 10,
//             //                   height: 140,
//             //                   decoration: BoxDecoration(
//             //                     borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
//             //                     color: Colors.indigo,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(
//             //                 width:220.w,
//             //                 child: Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: [
//             //                     // Align(
//             //                     //   alignment:Alignment.centerLeft,
//             //                     //   child: InkWell(
//             //                     //     onTap: (){
//             //                     //       chatMessagesController.replied.value=false;
//             //                     //     },
//             //                     //     child: Padding(
//             //                     //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//             //                     //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//             //                     //     ),
//             //                     //   ),
//             //                     // ),
//             //                     message.from_me==true?Text('you'):Text(message.from_user?.username??' '),
//             //                     Text('Video Message'),
//             //                   ],
//             //                 ),
//             //               ),
//             //
//             //             ],
//             //           ),
//             //         ),
//             //       ): message.message_type=='location'? Padding(
//             //         padding: const EdgeInsets.all(4.0),
//             //         child: Container(
//             //           height: 150,
//             //           width: 244.w,
//             //           decoration:BoxDecoration(
//             //             // border: Border.all(color: Colors.black),
//             //             // color: Colors.lightBlueAccent,
//             //               color: const Color(0xffE8E8E8),
//             //               borderRadius: BorderRadius.circular(25)),
//             //
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //             children: [
//             //               Padding(
//             //                 padding: const EdgeInsets.only(left: 4.0),
//             //                 child: Container(
//             //                   width: 10,
//             //                   height: 140,
//             //                   decoration: BoxDecoration(
//             //                     borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
//             //                     color: Colors.indigo,
//             //                   ),
//             //                 ),
//             //               ),
//             //               SizedBox(
//             //                 width:220.w,
//             //                 child: Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: [
//             //                     // Align(
//             //                     //   alignment:Alignment.centerLeft,
//             //                     //   child: InkWell(
//             //                     //     onTap: (){
//             //                     //       chatMessagesController.replied.value=false;
//             //                     //     },
//             //                     //     child: Padding(
//             //                     //       padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
//             //                     //       child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
//             //                     //     ),
//             //                     //   ),
//             //                     // ),
//             //                     message.from_me==true?Text('you'):Text(message.from_user?.username??' '),
//             //                     Text('Location Message'),
//             //                   ],
//             //                 ),
//             //               ),
//             //
//             //             ],
//             //           ),
//             //         ),
//             //       ):const SizedBox(height: 0,)
//             //   ):const SizedBox(height:0,),
//          message.uploaded==true?   Align(
//               alignment: Alignment.centerLeft,
//               child: Icon(Icons.upload_rounded,color:Colors.blueAccent),
//             ):Align(
//            alignment: Alignment.centerLeft,
//            child: Icon(Icons.not_interested,color:Colors.blueAccent)),
//           ],
//         ),
//       ),
//       //),
//     );
//   }
//
//   Widget getMenuItems() {
//     chatMessagesController.chatIndex.value = index;
//     return Container(
//         width: 312,
//         decoration: BoxDecoration(
//             color: Color(0xff4186CF), borderRadius: BorderRadius.circular(15)),
//         child: Column(children: [
//           TextButton(
//               onPressed: () {
//                 menuController?.hideMenu();
//                 // DateTime currentPhoneDate = DateTime.now(); //DateTime
//                 //
//                 // Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
//                 chatMessagesController.replied.value = false;
//
//                 DateTime date=DateTime.fromMillisecondsSinceEpoch(chatMessagesController
//                     .messagesChat[chatMessagesController.chatIndex.value]
//                     .sent_at_timestamp!*1000);
//                 //int year=date.year;
//                 int timeDiference= DateTime.now().difference(date).inMinutes;
//                 print("timeDeferrenceVVVVVVVVVVV  $timeDiference $date");
//                 if(timeDiference>30) {
//                   CoolAlert.show(
//                       context: alertContext,
//                       type: CoolAlertType.warning,
//                       text: '???? ???????? ???????????? ?????? ?????? ?????????????? ??',
//                       onConfirmBtnTap: () {
//                         if (index == chatMessagesController.chatIndex.value) {
//                           chatMessagesController.deleteMessage(message.id ?? 0);
//                           chatMessagesController.messagesChat.removeAt(index);
//                         }
//                         Navigator.pop(alertContext);
//                       },
//                   onCancelBtnTap: (){
//                     Navigator.pop(alertContext);
//                   });
//
//                 }else{
//                   Get.snackbar(
//                     "??????????",
//                     "?????? ???? ?????? ?????? ???????? ?????? ?????????????? ????????",
//                     icon: const Icon(Icons.person, color: Colors.red),
//                     backgroundColor: Colors.yellow,
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 }
//
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SvgPicture.asset('images/baseline-clear-24px.svg',
//                         height: 19, width: 19),
//                   ),
//                   Text(
//                     "??????",
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                 ],
//               )),
//           VerticalDivider(),
//           TextButton(
//               onPressed: () {
//                 //  Get.back();
//                 menuController?.hideMenu();
//                 chatMessagesController.replied.value = false;
//                 chatMessagesController.replied.value = true;
//                 chatMessagesController
//                     .typeOfMessage.value = chatMessagesController
//                     .messagesChat[chatMessagesController.chatIndex.value]
//                     .message_type ??
//                     ' ';
//
//                 // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${MediaQuery.of(alertContext).size.width}');
//                 //
//                 // print(MediaQuery.of(alertContext).size.height);
//               },
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.reply,
//                     color: Colors.white,
//                     size: 19,
//                   ),
//                 ),
//                 Text(
//                   "????",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//               ])),
//           VerticalDivider(),
//           TextButton(
//               onPressed: () async{
//                 menuController?.hideMenu();
//                 chatMessagesController.replied.value = false;
//                 String type=chatMessagesController
//                     .messagesChat[chatMessagesController.chatIndex.value]
//                     .message_type??' ';
//
//                 if(type=='sound'||type=='video'||type=='file'||type=='image') {
//                   // String  downloadsPath = (await DownloadsPath.downloadsDirectory())?.path ??
//                   //       "Downloads path doesn't exist";
//                   WidgetsFlutterBinding.ensureInitialized();
//                   await FlutterDownloader.initialize(
//                       debug: true // optional: set false to disable printing logs to console
//                   );
//                   final taskId = await FlutterDownloader.enqueue(
//                     url: chatMessagesController.messagesChat[chatMessagesController.chatIndex.value]
//                         .message??' ',
//                     savedDir: downloadsPath,
//                     showNotification: true,
//                     // show download progress in status bar (for Android)
//                     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//                   );
//                 }else{
//                   Get.snackbar(
//                     "??????",
//                     "?????????? ?????? ????????????",
//                     icon: const Icon(Icons.person, color: Colors.red),
//                     backgroundColor: Colors.yellow,
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 }
//               },
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.redo_sharp,
//                     color: Colors.white,
//                     size: 19,
//                   ),
//                 ),
//                 Text(
//                   "??????",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//               ])),
//           VerticalDivider(),
//           TextButton(
//               onPressed: () async {
//                 menuController?.hideMenu();
//                 FlutterClipboard.copy(message.message ?? ' ').then((value) {
//                   Get.snackbar(
//                     "??????",
//                     "???? ?????????? ??????????",
//                     icon: const Icon(Icons.person, color: Colors.red),
//                     backgroundColor: Colors.yellow,
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 });
//               },
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.copy,
//                     color: Colors.white,
//                     size: 19,
//                   ),
//                 ),
//                 Text(
//                   "??????",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//               ])),
//           VerticalDivider(),
//           TextButton(
//               onPressed: () {
//                 menuController?.hideMenu();
//                 chatMessagesController.replied.value = false;
//                 chatMessagesController.tapped.value = true;
//                 chatMessagesController.starMessage(message.id ?? 0);
//                 // if(index==currentIndex) {
//
//                 //Get.back();
//                 // message.starred =
//                 //    chatMessagesController.isStar.value == 1 ? true : false;
//
//                 // }
//               },
//               child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     Icons.star,
//                     color: Colors.white,
//                     size: 19,
//                   ),
//                 ),
//                 Text(
//                   "?????????????? ??????????",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//
//               ])),
//
//         ]));
//   }
//   // final button = PopupMenuButton(
//   //     key: _menuKey,
//   //     icon: Visibility(
//   //       visible: false,
//   //       child: Icon(Icons.event),),
//   //     itemBuilder: (_) => const<PopupMenuItem<String>>[
//   //       PopupMenuItem<String>(
//   //           child: Text('Doge'), value: 'Doge'),
//   //       PopupMenuItem<String>(
//   //           child: Text('Lion'), value: 'Lion'),
//   //     ],
//   //     onSelected: (_) {}
//   // ,child: ,);
//
//
// }