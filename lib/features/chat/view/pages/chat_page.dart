import 'dart:math' as math;

import 'package:advertisers/features/chat/view/widgets/chat_and_title.dart';
import 'package:advertisers/features/chat/view/widgets/chat_content_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarWidget(
            // isSearchBar: ,
            // showSearch: false,
            ),
      ),
      body: Column(
        children: [
          ChatAndTitle(
            show: Show.content,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              physics: const BouncingScrollPhysics(),
              children: const [
                ChatContentWidget(
                  chatUser: ChatUser.sender,
                  message: 'السلام عليكم',
                ),
                // ChatContentWidget(
                //   chatUser: ChatUser.sender,
                //   message: 'أستاذ أحمد',
                // ),
                ChatContentWidget(
                  chatUser: ChatUser.receiver,
                  message: 'عليكم السلام ورحمة الله وبركاته',
                ),
                ChatContentWidget(
                  chatUser: ChatUser.sender,
                  message:
                      'هل من الممكن تخفيض مبلغ الإعلان عن الإعلان السابق ، و يا ليت هذه المرة تكون التغطية بطريقة',
                ),
                ChatContentWidget(
                  chatUser: ChatUser.receiver,
                  message:
                      'بإمكانك الحصول على تخفيض من خلال كوبونات المنصة جرب لحر ما يضبط معاك أحدها',
                ),
                ChatContentWidget(
                  chatUser: ChatUser.sender,
                  message: 'أشكرك أستاذ أحمد .... ما قصرت',
                ),
                ChatContentWidget(
                  chatUser: ChatUser.receiver,
                  message: 'العفو',
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.all(4),
            color: Color(0xff4187cd),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "images/ios-mic.svg",
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "images/camera.svg",
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    // width: 323.w,
                    // height: 45.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: Colors.grey[200],
                        clipBehavior: Clip.antiAlias,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            style: TextStyle(fontSize: 15.sp),
                            textAlign: Get.locale?.languageCode ==
                                    const Locale('en').languageCode
                                ? TextAlign.left
                                : TextAlign.right,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: '..............',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              // isDense: true,
                              // contentPadding: EdgeInsets.all(0),
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.all(12.0),
                              //   child: InkWell(
                              //     onTap: () {},
                              //     child: SvgPicture.asset(
                              //       "images/bx-search-alt.svg",
                              //       height: 10,
                              //     ),
                              //   ),
                              // ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(
                                        Get.locale?.languageCode ==
                                                const Locale('en').languageCode
                                            ? math.pi
                                            : 0),
                                    child: SvgPicture.asset(
                                      "images/send.svg",
                                      height: 30,

                                    ),
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                  color: const Color(
                                    0xffA5A5A5,
                                  ),
                                  fontSize: 15.sp),
                            ),
                            // controller: _walletController.searchController,
                            // onSaved: (value){
                            //   _walletController.search=value!;
                            // },
                            // validator: (value){
                            //   return _walletController.validatePhone(value!);
                            // },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
