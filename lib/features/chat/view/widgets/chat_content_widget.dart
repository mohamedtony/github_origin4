import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/features/chat/controller/chat_messages_controller.dart';
import 'package:advertisers/features/chat/view/widgets/PlayChatAudio.dart';
import 'package:advertisers/features/chat/view/widgets/video_chat_widget.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:url_launcher/url_launcher.dart';

enum ChatUser {
  sender,
  receiver,
}

class ChatContentWidget extends StatelessWidget {

  //bool tapped=false;
  final ChatMessagesController chatMessagesController;
  final ChatUser chatUser;
  final ListChatModel message;
  final String type;
  final int index;
  late BuildContext alertContext;
  ChatContentWidget(
      {Key? key,
      required this.index,
      required this.chatUser,
      required this.message,
      required this.type,
      required this.chatMessagesController})
      : super(key: key);
  CustomPopupMenuController? menuController=CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    //currentIndex=index;
    alertContext=context;
    print('%%%%%%%%%%%%%%${chatMessagesController.isStar}');
    return CustomPopupMenu(
      menuBuilder: getMenuItems,
      pressType: PressType.singleClick,controller:menuController ,

      position: PreferredPosition.bottom,
      child: InkWell(
        onLongPress: type == 'location'
            ? () async {
                String lat = message.message!
                    .substring(0, message.message!.lastIndexOf('-') - 1);
                String lon = message.message!
                    .substring(message.message!.lastIndexOf('-') - 1);
                print('>>>>>>>>>>>>>>>>$lat $lon');
                final url =
                    'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }
            : null,
        child: Column(
          crossAxisAlignment: chatUser == ChatUser.sender
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chatUser == ChatUser.sender)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                      top: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(message.from_user?.image ?? ' ',
                          height: 20.0,
                          width: 20.0,
                          fit: BoxFit.cover, errorBuilder: (context, o, e) {
                        return Image.asset(
                          'images/no_image_available.png',
                          height: 20.0,
                          width: 20.0,
                          fit: BoxFit.cover,
                        );
                      }),
                    ),
                  ),
                if (chatUser == ChatUser.sender)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 8,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        message.from_user?.username ?? ' ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                if (chatUser == ChatUser.sender) const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      message.sent_at ?? ' ',
                      style: TextStyle(
                        color: Colors.black54,
                        // fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                if (chatUser == ChatUser.receiver) const Spacer(),
                if (chatUser == ChatUser.receiver)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 8,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        message.to_user?.username ?? ' ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                if (chatUser == ChatUser.receiver)
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                      top: 8,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        message.to_user?.image ?? ' ',
                        height: 20.0,
                        width: 20.0,
                        fit: BoxFit.cover,
                        errorBuilder: (context, o, e) {
                          return Image.asset(
                            'images/no_image_available.png',
                            height: 20.0,
                            width: 20.0,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 4,
                  left:
                      // Get.locale?.languageCode == const Locale('en').languageCode
                      //     ? chatUser == ChatUser.sender
                      //         ? 30
                      //         : 4
                      //   :
                      chatUser == ChatUser.sender ? 14 : 30,
                  right:
                      // Get.locale?.languageCode == const Locale('en').languageCode
                      //     ? chatUser == ChatUser.sender
                      //         ? 4
                      //         : 30
                      //     :
                      chatUser == ChatUser.sender ? 30 : 4,
                ),
                child: GetBuilder<ChatMessagesController>(
                  init: ChatMessagesController(),
                  //initState: (_) => AuthController().fetchUserData(),
                  builder: (controller) {
                    if (controller.tapped.value == true&&
                        index == controller.chatIndex.value
                        ) {
                      chatMessagesController.messagesChat[index].starred=controller.isStar.value==1?true:false;
                      controller.tapped.value = false;
                      //controller.isStar.value==0;
                      return Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:// message.starred == true||
                                    chatMessagesController.isStar.value==1
                                    ?
                          Border.all(color: Colors.blueAccent)
                                     : Border.all(
                                         width: 0, color: Colors.transparent),
                                color: chatUser == ChatUser.sender
                                    ? const Color(0xffE8E8E8)
                                    : const Color(0xff44A2D7),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.0,
                                vertical: 8,
                              ),
                              child: //type=='sound'?PlayChatAudio(url:message.message??' '):SizedBox()
                                  type == 'text'
                                      ? Text(
                                          message.message ?? ' ',
                                          style: TextStyle(
                                            color: chatUser == ChatUser.sender
                                                ? const Color(0xff4186CF)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                        )
                                      : type == 'location'? Image.asset(
                                      'images/gps-og-image.jpg')
                                      :type=='sound'?PlayChatAudio(url:message.message??' ')
                                      : type=='video'?VideoChatWidget(url: message.message,):SizedBox(
                                    height:139.h,width:301.w,
                                    child: Image.network(
                                        message.message ?? ' ',
                                        errorBuilder: (context, l, t) {
                                          return Text("امتداد غير مدعوم");
                                        }),
                                  ),
                            ),
                          ),
                          //message.starred == true ||
                                  chatMessagesController.isStar.value == 1 ?


                    const Positioned(
                                  top: -15,
                                  left: -10,
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffF29423),
                                  )) : SizedBox(),
                        ],
                      );
                    } else {
                      return Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: message.starred == true
                                    ? Border.all(color: Colors.blueAccent)
                                    : Border.all(
                                        width: 0, color: Colors.transparent),
                                color: chatUser == ChatUser.sender
                                    ? const Color(0xffE8E8E8)
                                    : const Color(0xff44A2D7),
                                borderRadius: BorderRadius.circular(5)),

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: type=='text'?18.0:0,
                                vertical:  type=='text'?8:0,
                              ),
                              child: //type=='sound'?PlayChatAudio(url:message.message??' '):SizedBox()
                                  type == 'text'
                                      ? Text(
                                          message.message ?? ' ',
                                          style: TextStyle(
                                            color: chatUser == ChatUser.sender
                                                ? const Color(0xff4186CF)
                                                : Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                        )
                                      : type == 'location'? Image.asset(
                                      'images/gps-og-image.jpg')
                                         :type=='sound'?PlayChatAudio(url:message.message??' ')
                                          : type=='video'?VideoChatWidget(url: message.message,):SizedBox(
                                    height:139.h,width:301.w,
                                            child: Image.network(
                                                message.message ?? ' ',
                                                errorBuilder: (context, l, t) {
                                                return Text("امتداد غير مدعوم");
                                              }),
                                          ),
                            ),
                          ),
                          message.starred == true
                              ? const Positioned(
                                  top: -15,
                                  left: -10,
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0xffF29423),
                                  ))
                              : SizedBox()
                        ],
                      );
                    }
                   // return SizedBox();
                  },
                )),
          // message.replied_message!=null?  Container(
          //
          //     decoration: BoxDecoration(
          //       border: Border.all(color:Colors.grey ),
          //     ),
          //     child: Text(message.message??' '),
          //   ):const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget getMenuItems() {
    chatMessagesController.chatIndex.value = index;
    return Container(
        width: 200,
        decoration: BoxDecoration(
            color: Color(0xff4186CF), borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          TextButton(
              onPressed: () {
                chatMessagesController.tapped.value = true;
                // if(index==currentIndex) {
                chatMessagesController.starMessage(message.id ?? 0);
                //Get.back();
                // message.starred =
                //    chatMessagesController.isStar.value == 1 ? true : false;

                // }
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التمييز بنجمة",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ])),
          VerticalDivider(),
          TextButton(
              onPressed: () {
              //  Get.back();

                menuController?.hideMenu();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "رد",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.reply,
                      color: Colors.white,
                    ),
                  ])),
          VerticalDivider(),
          TextButton(
              onPressed: () {
                menuController?.hideMenu();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تحويل",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.redo_sharp,
                      color: Colors.white,
                    )
                  ])),
          VerticalDivider(),
          TextButton(
              onPressed: () async{
                FlutterClipboard.copy(message.message??' ').then((value){
                  Get.snackbar(
                    "نسخ",
                    "تم النسخ بنجاح",
                    icon: const Icon(Icons.person, color: Colors.red),
                    backgroundColor: Colors.yellow,
                    snackPosition: SnackPosition.BOTTOM,);
                });
                menuController?.hideMenu();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "نسخ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.copy,
                      color: Colors.white,
                    )
                  ])),
          VerticalDivider(),
          TextButton(
              onPressed: () {
                menuController?.hideMenu();
                CoolAlert.show(
                  context: alertContext,
                  type: CoolAlertType.warning,
                  text: 'هل تريد بالفعل حذف هذه الرسالة ؟',
                  onConfirmBtnTap: (){
                    if(index==chatMessagesController.chatIndex.value){
                    chatMessagesController.deleteMessage(message.id ?? 0);
                    chatMessagesController.messagesChat.removeAt(index);

                  }}
                );

                  },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "حذف",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ],
              ))
        ]));
  }
}
