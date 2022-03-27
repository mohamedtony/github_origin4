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
    return Column(
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
                  child: Image.network(
                    'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
                    height: 20.0,
                    width: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (chatUser == ChatUser.sender)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  // vertical: 8,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'أحمد السيد اسماعيل',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            if (chatUser == ChatUser.sender) const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
                // vertical: 8,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '14 نوفمبر 2020 السعة 7:25 م',
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
                  // vertical: 8,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'محمد السيد اسماعيل',
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
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12,
                  top: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    'https://www.neshanstyle.com/blog/wp-content/uploads/2019/11/122-1-710x434.jpg',
                    height: 20.0,
                    width: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 0,
            bottom: 4,
            left: Get.locale?.languageCode == const Locale('en').languageCode
                ? chatUser == ChatUser.sender
                    ? 30
                    : 4
                : chatUser == ChatUser.sender
                    ? 4
                    : 30,
            right: Get.locale?.languageCode == const Locale('en').languageCode
                ? chatUser == ChatUser.sender
                    ? 4
                    : 30
                : chatUser == ChatUser.sender
                    ? 30
                    : 4,
          ),
          child: Card(
            color: chatUser == ChatUser.sender
                ? Colors.orange[200]
                : const Color(0xff44A2D7),
            // color: Colors.grey[200],
            clipBehavior: Clip.antiAlias,
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 8,
              ),
              child: Text(
                message,
                style: TextStyle(
                  color:
                      chatUser == ChatUser.sender ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
