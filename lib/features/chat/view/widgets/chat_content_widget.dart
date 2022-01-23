import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum ChatUser {
  sender,
  receiver,
}

class ChatContentWidget extends StatelessWidget {
  final ChatUser chatUser;
  final String message;
  const ChatContentWidget({
    Key? key,
    required this.chatUser,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
        bottom: 8,
        left: Get.locale?.languageCode == const Locale('en').languageCode
            ? chatUser == ChatUser.sender
                ? 40
                : 4
            : chatUser == ChatUser.sender
                ? 4
                : 40,
        right: Get.locale?.languageCode == const Locale('en').languageCode
            ? chatUser == ChatUser.sender
                ? 4
                : 40
            : chatUser == ChatUser.sender
                ? 40
                : 4,
      ),
      // height: 110,
      child: Card(
        color: chatUser == ChatUser.sender ? Colors.grey[200] : Color(0xff44A2D7),
        // color: Colors.grey[200],
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight:
                Get.locale?.languageCode == const Locale('en').languageCode &&
                        chatUser == ChatUser.sender
                    ? const Radius.circular(35.0)
                    : const Radius.circular(15.0),
            bottomRight:
                Get.locale?.languageCode == const Locale('en').languageCode &&
                        chatUser == ChatUser.sender
                    ? const Radius.circular(35.0)
                    : const Radius.circular(15.0),
            topLeft:
                Get.locale?.languageCode == const Locale('ar').languageCode &&
                        chatUser == ChatUser.sender
                    ? const Radius.circular(35.0)
                    : const Radius.circular(15.0),
            bottomLeft:
                Get.locale?.languageCode == const Locale('ar').languageCode &&
                        chatUser == ChatUser.sender
                    ? const Radius.circular(35.0)
                    : const Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (chatUser == ChatUser.receiver)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: CircleAvatar(
                  radius: 35,
                  foregroundImage: NetworkImage(
                    'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        color: chatUser == ChatUser.sender
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    Align(
                      alignment: Get.locale?.languageCode ==
                              const Locale('en').languageCode
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      child: Text(
                        'منذ 3.5 ساعة',
                        style: TextStyle(
                          color: chatUser == ChatUser.sender
                              ? Colors.black54
                              : Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (chatUser == ChatUser.sender)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: CircleAvatar(
                  radius: 35,
                  foregroundImage: NetworkImage(
                    'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}