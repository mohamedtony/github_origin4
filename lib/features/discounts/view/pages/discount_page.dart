import 'package:advertisers/features/discounts/view/widgets/discount_widget.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/toast_template/toast_template.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class DiscountPage extends StatelessWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          isBack: true,
          isNotification: false,
          isSearchBar: false,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
      ),
      body: ListView(
        children: [
          WidgetAndTitle(
            title: "كوبونات خصم المنصة",
            iconWidget: SvgPicture.asset(
              "images/rate.svg",
              height: 26,
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: discounts.length,
              itemBuilder: (context, index) {
                return DiscountWidget(
                  title: discounts[index].title,
                  id: discounts[index].id,
                  desc: discounts[index].desc,
                  discount: discounts[index].discount,
                  codeNumber: discounts[index].code,
                  expiredDate: discounts[index].expiredDate,
                  iconColor: discounts[index].iconColor,
                );
              }),
          ],
      ),
    );
  }
}

