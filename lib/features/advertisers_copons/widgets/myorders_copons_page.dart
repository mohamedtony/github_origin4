import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/advertisers_copons/widgets/discount_widget.dart';
import 'package:advertisers/features/discounts/controller/discount_controller.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:advertisers/shared/toast_template/toast_template.dart';
import 'package:advertisers/shared/widget_and_title/widget_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class MyOrdersCoponsPage extends StatefulWidget {
  MyOrdersCoponsPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersCoponsPage> createState() => _MyOrdersCoponsPageState();
}

class _MyOrdersCoponsPageState extends State<MyOrdersCoponsPage> {
   AdvertisersCoponsController discountPageController = Get.put(AdvertisersCoponsController());
   @override
   void initState() {
     // TODO: implement initState
     discountPageController.appCoponspagingController.addPageRequestListener((pageKey) async {
       print("hhhhhhhhhhhhhhhhhhhhhhhh");
       await discountPageController.fetchAppCoponsPage(pageKey);
     });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: PreferredSize(
        child: AppBarWidget(
          isBack: true,
          isNotification: false,
          isSearchBar: false,
          isSideMenu: false,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
      ),*/
      body: Column(
        children: [
          /*WidgetAndTitle(
            title: "كوبونات خصم المنصة",
            iconWidget: SvgPicture.asset(
              "images/rate.svg",
              height: 26,
            ),
          ),*/
          Expanded(
            child: PagedListView<int, CoponModelResponse>(
              pagingController: discountPageController.appCoponspagingController,
              //shrinkWrap: true,
              builderDelegate: PagedChildBuilderDelegate<CoponModelResponse>(
                animateTransitions: true,
                noItemsFoundIndicatorBuilder: (context){
                  return Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top:20.0),
                      child: Text('لا يوجد كوبونات !',style:TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)));
                },

                itemBuilder: (context, item, position) {
                  return DiscountWidget(
                   copon: item,
                   index: position,
                   // iconColor: discounts[position].iconColor,
                  );
                },
              ),
            ),
          ),
         /* ListView.builder(
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
              }),*/
          ],
      ),
    );
  }
}

