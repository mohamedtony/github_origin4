import 'package:advertisers/features/customer_order_invoice_out_puts/order_invoice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class OrderDetailsTitle extends StatelessWidget {
    OrderDetailsTitle({Key? key,required, this.requestId}) : super(key: key);
  final requestId;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.grey[100],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xff4184CE)),
                child: const Text(
                  'تفاصيل الطلب',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Get.put(OrderInvoiceController()).fetchInvoiceData(requestId: requestId);
                // Get.toNamed(
                //   '/CustomerOrderInvoiceOutPutsPage',
                //   //     arguments: [
                //   //   {"first": 'First data'},
                //   //   {"second": 'Second data'}
                //   // ]
                // );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(color: Colors.grey[300]!),
                  // color: const Color(0xff4184CE),
                  color: Color(0xffe8e8e8),
                ),
                child: const Text(
                  'الفاتورة',
                  style: TextStyle(color: Color(0xff4184CE), fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
