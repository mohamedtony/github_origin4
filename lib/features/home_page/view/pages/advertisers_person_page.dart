import 'package:advertisers/features/home_page/view/widgets/advertiser_person_item.dart';
import 'package:flutter/material.dart';

class AdvertisersPage extends StatelessWidget {
  const AdvertisersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AdvertiserItem(),
          AdvertiserItem(),
          AdvertiserItem(),
          AdvertiserItem(),
          AdvertiserItem(),
          AdvertiserItem(),
          AdvertiserItem(),
        ],
      ),
    )
    ;
  }
}
