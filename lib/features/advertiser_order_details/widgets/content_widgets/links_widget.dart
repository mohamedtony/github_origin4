import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/content.dart';
import 'package:flutter/material.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(
      // hasNote: false,
      title: 'روابط الاعلان',
      iconUrl: 'images/link_line.png',
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (_, index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (_, index) => Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: const [
              Text('رابط المتجر'),
              Text('www.dremhaous.com/kasjdh'),
            ],
          ),
        ),
      ),
    );
  }
}
