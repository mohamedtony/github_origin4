import 'package:advertisers/app_core/network/responses/advertising_requests_response.dart';
import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/adding_items_widget.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/advertiser_invoice_input_appbar.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/advertising_type_widget.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/costs_discounts_table_widget.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/payment_type_widget.dart';
import 'package:advertisers/features/customer_order_invoice/view/widgets/staticts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AdvertiserInvoiceInputs  extends GetWidget<AdvertiserInvoiceInputsController>  {
  final Advertiser? user;

  AdvertiserInvoiceInputs({this.user});




  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) =>
            Scaffold(
      appBar: PreferredSize(
        child: AdvertiserInvoiceInputAppbar(
          // user: controller.user,
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 110.h),
      ),
      body: GetBuilder<AdvertiserInvoiceInputsController>(
          init: AdvertiserInvoiceInputsController(),
          builder: (controller) => Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff6cc9db),
                    Color(0xff60abd6),
                    Color(0xff538bce),
                    Color(0xff496ec7),
                    // Colors.white
                  ]),
            ),
            // padding:const EdgeInsets.only(20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                  child: AdvertisingTypeWidget(
                    // types:
                    //   state!.data!.types
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                    child: AddingItemsWidget()),

                CostsDiscountsWidget(data: state!.data,),
               const SizedBox(
                 height: 30,
               ),
                PaymentTypeWidget(),


                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          )
      ),
    ));
  }
}
