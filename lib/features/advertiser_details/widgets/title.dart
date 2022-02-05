import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdvertiserDetailsTitle extends StatelessWidget {
  const AddAdvertiserDetailsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed('/CustomerOrderInvoiceOutPutsPage');
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
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
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.transparent,
                ),
                child: Text(
                  'تعديل الطلب',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 16,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                height: 1,
                width: 80,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xff4184CE)),
              child: const Text(
                'إرسال',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
