import 'package:advertisers/wallet_module/wallet_controller.dart';
import 'package:advertisers/wallet_module/widgets/appbar_widget.dart';
import 'package:advertisers/wallet_module/widgets/point_widgets/point_widget.dart';
import 'package:advertisers/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:advertisers/wallet_module/widgets/pulls_widgets/pulls_widget.dart';
import 'package:advertisers/wallet_module/widgets/select_tab.dart';
import 'package:advertisers/wallet_module/widgets/shipping_widgets/shipping_widget.dart';
import 'package:advertisers/wallet_module/widgets/wallet_and_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WalletPage extends StatelessWidget {
   WalletPage({Key? key}) : super(key: key);
  final WalletController _walletController=Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
      GetBuilder<WalletController>(
        init: WalletController(),
        builder: (controller) => controller.tabId == 0 ? InkWell(
          onTap: (){

          },
          child: Container(
            height: 70,
            width: 70,
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 8.0,
                  spreadRadius: 2.0,
                )
              ],
              border: Border.all(
                color: Colors.white, //                   <--- border color
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(50),
              gradient:  const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff6fd3de),
                    Color(0xff486ac7),
                  ]
              ),
              // color:const Color(0xff4184CE),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                "images/wallet.svg",
                height: 21,
                color: Colors.white,
              ),
            ),
          ),):Container(),
      ),



      appBar:  PreferredSize(
        child:  AppbarWidget(),
        preferredSize:  Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),
      body:  Container(
        color: Color(0xffF5F5F5),
        child: Column(
          children: [
            const WalletAndTitle(),

 Container(
    height: 50,
    child:   Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Center(
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: upperTabItems!.length,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            _walletController.passIndex(upperTabItems![index].id);
            print("${_walletController.tabId}");
          },
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SelectedTab(title: upperTabItems![index].title, id: upperTabItems![index].id,),
          )
        ) ;
        }),
      ),
    ),
  ),

            const SizedBox(
              height: 12,
            ),

            Container(
              color: Colors.grey.withOpacity(.5),
              height: 1,
              width: double.infinity,
            ),




        Expanded(
          child: GetBuilder<WalletController>(
            init: WalletController(),
            builder: (controller) => AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: Container(
                key: Key('${controller.tabId}'),
                child: TabsWidgets[controller.tabId],
              ),
            ),
          ),
        ),
            // controller.tabId

            // const ProcessesWidget()
          ],
        ),
      ),
    );
  }
}






List <Widget> TabsWidgets = [
  ProcessesWidget(),
  ShippingWidget(),
  PullsWidget(),
  PointsWidget()

];



