import 'package:advertisers/home_page/view/widgets/copon_item.dart';
import 'package:flutter/material.dart';

class CoponsPage extends StatelessWidget {
   CoponsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {
          return  CoponItem(pos: position,);
        },
      )
    );
  }
}
