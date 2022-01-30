import 'package:flutter/material.dart';

class AdvertisingRequestsSlideRightItemsSeparation extends StatelessWidget {
  const AdvertisingRequestsSlideRightItemsSeparation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 1,
          color: const Color(0xffeff7fa),
        ),
        Container(
          height: 50,
          width: 1,
          color: const Color(0xffeff7fa),
        ),

      ],
    );
  }
}
