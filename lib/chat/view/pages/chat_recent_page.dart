import 'package:advertisers/chat/view/pages/chat_page.dart';
import 'package:advertisers/chat/view/widgets/chat_and_title.dart';
import 'package:advertisers/chat/view/widgets/chat_recent_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRecentPage extends StatelessWidget {
  const ChatRecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarWidget(
          isSearchBar: true,
          // isNotification: true,
          isBack: true,
          // showSearch: false,
        ),
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
