import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/advertisers_copons/widgets/advertiser_copon_item.dart';
import 'package:advertisers/features/advertisers_copons/widgets/discount_copon_sheet_advertiser.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/home_page/controller/copons_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/copon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        body:Stack(
          children: [
            PagedListView<int, CoponModelResponse>(
              pagingController: coponsPageController.advertiserCoponspagingController,
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
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10.0,bottom: 40),
                child: PhysicalModel(
                  //borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  elevation: 6,
                  shadowColor: Colors.grey,
                  child: Container(
                    child: InkWell(
                      onTap: (){
                        //Get.toNamed("/FilterOrderAdvertisers");
                        //widget.onSheetClicked!(8);
                        coponsPageController.coponNumberController!.text = '';
                        coponsPageController.coponNameController!.text = '';
                        coponsPageController.coponStoreUrlController!.text = '';
                        coponsPageController.coponStoreNameController!.text = '';
                        coponsPageController.coponUsesController!.text = '';
                        coponsPageController.coponDiscountController!.text = '';
                        coponsPageController.endAdvertisingDateCoupon.value = '';
                        coponsPageController.imagePathCopon.value = '';
                        coponsPageController.showBottomSheetForRequest(context,from: "add");
                      },
                      child: Container(
                        width: 62,
                        height: 62,
                        margin: EdgeInsets.all(4),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'images/add_copon.svg',
                              fit: BoxFit.fill,
                              //color: Colors.white,
                              height: 24.0,
                              width: 30.0,
                            ),
                          ),)
                        ,decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.beginColor, AppColors.endColor],
                        ),
                      ),),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}