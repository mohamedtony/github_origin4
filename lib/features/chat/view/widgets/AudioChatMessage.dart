// import 'package:advertisers/app_core/network/models/ListChatModel.dart';
// import 'package:advertisers/features/chat/view/widgets/PlayChatAudio.dart';
// import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:quds_popup_menu/quds_popup_menu.dart';
//
// import 'AudioChatMessage.dart';
//
// enum ChatUser1 {
//   sender,
//   receiver,
// }
//
// class AudioChatMessage extends StatelessWidget {
//   final ChatUser1 chatUser1;
//   final ListChatModel message;
//   final String type;
//   const AudioChatMessage({
//     Key? key,
//     required this.chatUser1,
//     required this.message,
//     required this.type,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  CustomPopupMenu(
//       menuBuilder: getMenuItems,
//       pressType: PressType.singleClick,
//       child:   SizedBox(
//
//         width: 301.w,
//         child: Column(
//           crossAxisAlignment: chatUser1 == ChatUser1.sender
//               ? CrossAxisAlignment.start
//               : CrossAxisAlignment.end,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (chatUser1 == ChatUser1.sender)
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       left: 12.0,
//                       right: 12,
//                       top: 8,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100.0),
//                       child: Image.network(
//                           message.from_user?.image??' ',
//                           height: 20.0,
//                           width: 20.0,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context,o,e) {
//                             return Image.asset('images/no_image_available.png',
//                               height: 20.0,
//                               width: 20.0,
//                               fit: BoxFit.cover,);
//                           }),
//                     ),
//                   ),
//                 if (chatUser1 == ChatUser1.sender)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 0.0,
//                       // vertical: 8,
//                     ),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         message.from_user?.username??' ',
//
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (chatUser1 == ChatUser1.sender) const Spacer(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: type=='sound'||type=='audio'?5:18.0,
//                     // vertical: 8,
//                   ),
//                   child: Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       message.sent_at??' ',
//                       style: TextStyle(
//                         color: Colors.black54,
//                         // fontWeight: FontWeight.bold,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (chatUser1 == ChatUser1.receiver) const Spacer(),
//                 if (chatUser1 == ChatUser1.receiver)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 0.0,
//                       // vertical: 8,
//                     ),
//                     child: Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         message.to_user?.username??' ',
//                         style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 13.sp,
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (ChatUser1 == ChatUser1.receiver)
//                   Padding(
//                     padding: EdgeInsets.only(
//                       left: 12.0,
//                       right: 12,
//                       top: 8,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100.0),
//                       child: Image.network(
//                         message.to_user?.image??' ',
//                         height: 20.0,
//                         width: 20.0,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context,o,e){
//                           return Image.asset('images/no_image_available.png',
//                             height: 20.0,
//                             width: 20.0,fit: BoxFit.cover,);
//                         },
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               height: 54,
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   top: 0,
//                  // bottom: 4,
//                   left: Get.locale?.languageCode == const Locale('en').languageCode
//                       ? chatUser1 == ChatUser1.sender
//                       ? 30
//                       : 4
//                       : chatUser1 == ChatUser1.sender
//                       ? 4
//                       : 30,
//                   right: Get.locale?.languageCode == const Locale('en').languageCode
//                       ? chatUser1 == ChatUser1.sender
//                       ? 4
//                       : 30
//                       : chatUser1 == ChatUser1.sender
//                       ? 30
//                       : 4,
//                 ),
//                 child: Card(
//                   color:chatUser1 == ChatUser1.sender
//                       ? const Color(0xffE8E8E8)
//                       :const Color(0xff44A2D7),
//                   // color: Colors.grey[200],
//                   clipBehavior: Clip.antiAlias,
//                   elevation: 3,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(5.0),
//                       bottomRight: Radius.circular(5.0),
//                       topLeft: Radius.circular(5.0),
//                       bottomLeft: Radius.circular(5.0),
//                     ),
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(
//                       horizontal: type=='sound'||type=='audio'?0:18.0,
//                       vertical: type=='sound'||type=='audio'?0:8,
//                     ),
//                     child:PlayChatAudio(url:message.message??' '),
//                   ),
//                 ),
//               ),
//             ),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//           ],
//         ),
//       ),
//
//     );
//   }
//
//   Widget getMenuItems() {
//     return Container(
//         width:200,
//         decoration: BoxDecoration(color: Colors.black54,
//
//             borderRadius: BorderRadius.circular(15)),
//         child:Column(
//             children:[
//
//
//               TextButton(
//                   onPressed: () {
//
//                   },
//                   child:Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("التمييز بنجمة"), Icon(
//                           Icons.star,
//                           color: Colors.yellow,
//                         )])),
//               VerticalDivider(),
//               TextButton(
//                   onPressed: () {},
//                   child:Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("رد"), Icon(
//                           Icons.reply,
//                           color: Colors.white,
//                         ),])),
//               VerticalDivider(),
//               TextButton(
//                   onPressed: () {},
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("تحويل"),
//                         Icon(
//                           Icons.redo_sharp,
//                           color: Colors.white,)
//                       ])),
//               VerticalDivider(),
//               TextButton(
//                   onPressed: () {},
//                   child:Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("نسخ"),Icon(
//                           Icons.copy,
//                           color: Colors.white,
//                         )])),
//               VerticalDivider(),
//               TextButton(
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("حذف"),
//                       Icon(
//                         Icons.delete,
//                         color: Colors.red,
//                       ),
//                     ],
//                   ))
//             ]));}
// }
