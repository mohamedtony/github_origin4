import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class ChatRecentWidget extends StatelessWidget {
   ChatRecentWidget({this.name,this.lastMessage,this.url,
    Key? key, this.timeAgo,this.room,this.not_seen,
  }) : super(key: key);

 final String? name,url,lastMessage,timeAgo,room;
 final int? not_seen;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0,
        left: 4,
        right: 4,
      ),
      height: 82,
      width: 367.w,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight:
                Get.locale?.languageCode == const Locale('en').languageCode
                    ? const Radius.circular(17.0)
                    : const Radius.circular(39.0),
            bottomRight:
                Get.locale?.languageCode == const Locale('en').languageCode
                    ? const Radius.circular(17.0)
                    : const Radius.circular(39.0),
            topLeft: Get.locale?.languageCode == const Locale('ar').languageCode
                ? const Radius.circular(17.0)
                : const Radius.circular(39.0),
            bottomLeft:
                Get.locale?.languageCode == const Locale('ar').languageCode
                    ? const Radius.circular(20.0)
                    : const Radius.circular(39.0),
          ),
        ),
        child: Row(
          children: [
             Padding(
              padding: EdgeInsets.only(left:16.0.w,right:6,top:6,bottom:6),
              child: Material(
                borderRadius: BorderRadius.circular(55),
                elevation: .5,
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Color(0xffE4E4E4),
                  child: CircleAvatar(
                    radius: 23,
                    foregroundImage: NetworkImage( //url??
                      "https://image.winudf.com/v2/image/Y29tLmFtYXppbmdwaWN0cy5hcmFiLm1hbi5waG90b21ha2VyX3NjcmVlbl8xXzI4b2QzYWht/screen-1.jpg?fakeurl=1&type=.jpg"
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name??' ',
                      style: TextStyle(
                        color: Color(0xff427FD1),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      lastMessage??' ',
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,overflow:TextOverflow.ellipsis,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18.0,
                left: 16, //
                // right: 16,
                top: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    timeAgo??' ',
                    style: TextStyle(
                      color: Color(0xff212121),
                      // fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.all(6),
                    height: 23,
                    width: 23.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff6fd3de),
                            Color(0xff486ac7),
                          ]),
                    ),
                    child: Text(
                      not_seen.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
