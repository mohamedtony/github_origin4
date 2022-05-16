
import 'dart:convert';

import 'package:advertisers/features/chat/controller/chat_controller.dart';
import 'package:advertisers/features/chat/view/pages/chat_page.dart';
import 'package:advertisers/features/chat/view/widgets/chat_and_title.dart';
import 'package:advertisers/features/chat/view/widgets/chat_recent_widget.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatRecentPage extends StatelessWidget {
  ChatRecentPage({Key? key}) : super(key: key);
  ChatController _chatController=Get.put(ChatController());
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarWidget(
          isSearchBar: true,isNotification:true,isBack: false,
          // isNotification: true,

          // showSearch: false,
        ),
      ),
      body: Column(
        children: [
          ChatAndTitle(
            show: Show.recent,
            name: _chatController.listChat.isNotEmpty?_chatController.listChat[0].from_user?.username??' ':' ',
            image: _chatController.listChat.isNotEmpty?_chatController.listChat[0].from_user?.image??' ':' ',
          ),
          Expanded(
            child:SmartRefresher(
              controller: _chatController.refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await _chatController.getChatList(isRefresh: true);
                if (result) {
                  _chatController.refreshController.refreshCompleted();
                } else {
                  _chatController.refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await _chatController.getChatList();
                if (result) {
                  _chatController.refreshController.loadComplete();
                } else {
                  _chatController.refreshController.loadFailed();
                }
              },
              child: Obx(()=>ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                physics: const BouncingScrollPhysics(),
                itemCount: _chatController.listChat.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Get.toNamed('/ChatPage?room=${_chatController.listChat[index].room}'
                        '&from_user=${json.encode(_chatController.listChat[index].from_user)}&to_user=${json.encode(_chatController.listChat[index].to_user)}&id=${_chatController.listChat[index].id}&not_seen=${_chatController.listChat[index].not_seen}');
                  },
                  child: ChatRecentWidget(lastMessage: _chatController.listChat[index].message,type: _chatController.listChat[index].message_type,
                  name:_chatController.listChat[index].from_user?.id.toString()==storage.read('id').toString()?_chatController.listChat[index].to_user?.username??' ':_chatController.listChat[index].from_user?.username??' ',not_seen:_chatController.listChat[index].not_seen ,
                  timeAgo: _chatController.listChat[index].sent_from??' ',url: _chatController.listChat[index].from_user?.id.toString()==storage.read('id').toString()?_chatController.listChat[index].to_user?.image??' ':_chatController.listChat[index].from_user?.image??' ',room:_chatController.listChat[index].room??' '),
                ),
              )
          ),
            )),
        ],
      ),
    );
  }
}
