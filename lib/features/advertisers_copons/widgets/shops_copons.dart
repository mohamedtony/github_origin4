import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/advertisers_copons/widgets/advertiser_copon_item.dart';
import 'package:advertisers/features/advertisers_copons/widgets/discount_copon_sheet_advertiser.dart';
import 'package:advertisers/features/home_page/controller/copons_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/copon_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class ShopsPage extends StatefulWidget {
  ShopsPage({Key? key}) : super(key: key);

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  AdvertisersCoponsController coponsPageController = Get.put(AdvertisersCoponsController());
  @override
  void initState() {
    // TODO: implement initState
    coponsPageController.advertiserCoponspagingController.addPageRequestListener((pageKey) async {
      print("hhhhhhhhhhhhhhhhhhhhhhhh");
      await coponsPageController.fetchAdvertiserCoponsPage(pageKey);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:GetBuilder<AdvertisersCoponsController>(
          init: coponsPageController,
          builder: (controller) => PagedListView<int, CoponModelResponse>(
            pagingController: controller.advertiserCoponspagingController,
            builderDelegate: PagedChildBuilderDelegate<CoponModelResponse>(
              animateTransitions: true,
              noItemsFoundIndicatorBuilder: (context){
                return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top:20.0),
                    child: Text('لا يوجد كوبونات !',style:TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)));
              },

              itemBuilder: (context, item, position) {
                return AdvertiserCoponItem(pos: position, coponModelResponse: item);
              },
            ),
          ),)
    );
  }
}