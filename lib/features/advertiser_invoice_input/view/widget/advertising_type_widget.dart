import 'package:advertisers/features/advertiser_invoice_input/advertiser_invoice_inputs_response.dart';
import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:advertisers/features/advertiser_invoice_input/view/widget/advertiser_invoice_input_appbar.dart';
import 'package:advertisers/features/customer_order_invoice/view/widgets/staticts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';



class AdvertisingTypeWidget extends StatelessWidget {

  // List<Types>? types;
  // AdvertisingTypeWidget({this.types});

  // final List<String> _advertisingType = [];


  @override
  Widget build(BuildContext context) {
    // types!.forEach((type) {
    //   if(){}
    //
    // });
    return GetBuilder<AdvertiserInvoiceInputsController>(
        init: AdvertiserInvoiceInputsController(),
        builder: (controller) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<Types>(
            underline: const SizedBox.shrink(),
            icon: SvgPicture.asset('images/dropdown_icon.svg',height: 8.sp,),
            hint: controller.selectedAdvertisingType!.id != 0
                ? Container(
                child: Text(
                  controller.selectedAdvertisingType!.name!,
                  style: TextStyle(fontSize: 14.sp),
                ))
                :  Container(
              child: Text(
                'اختر نوع الاعلان',
                style: TextStyle(color: Color(0xff041D67),fontSize: 14.sp),
              ),
            ),
            items: controller.types!.map((Types value) {
              return DropdownMenuItem<Types>(
                value: value,
                child: Text(
                  "${value.name}",
                  style: TextStyle(fontSize: 14.sp),
                ),
              );
            }).toList(),
            // value: _selectedLocation,
            // isDense: true,
            isExpanded: true,
            onChanged: (newVal) {
              controller.selectType(newVal);
            },
          ),
        )
    );
  }
}
