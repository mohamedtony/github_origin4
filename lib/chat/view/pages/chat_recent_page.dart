import 'package:advertisers/chat/view/pages/chat_page.dart';
import 'package:advertisers/chat/view/widgets/chat_and_title.dart';
import 'package:advertisers/chat/view/widgets/chat_app_bar.dart';
import 'package:advertisers/chat/view/widgets/chat_recent_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRecentPage extends StatelessWidget {
  const ChatRecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: ChatAppBarWidget(),
      ),
      body: Column(
        children: [
          ChatAndTitle(
            show: Show.recent,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Get.to(const ChatPage());
                },
                child: const ChatRecentWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
