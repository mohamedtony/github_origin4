import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddAdvertiserTitle extends StatelessWidget {
  final String title;
   AddAdvertiserTitle({required this.title,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff4184CE)),
                child:  Text(
                title, // "اضافة قناة اعلان وتأثير",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SvgPicture.asset(
              "images/tv-alt-play.svg",
              height: 21,
            ),
          ],
        ),
      ),
    );
  }
}
