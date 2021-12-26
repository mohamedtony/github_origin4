import 'package:advertisers/chat/view/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: AppbarWidget(),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff6fd3de),
                Color(0xff486ac7),
              ]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]),
    );
  }
}
