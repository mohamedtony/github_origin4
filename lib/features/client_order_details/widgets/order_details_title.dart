import 'package:flutter/material.dart';

class OrderDetailsTitle extends StatelessWidget {
  const OrderDetailsTitle({Key? key}) : super(key: key);

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
              onTap: () {},
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
