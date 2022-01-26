import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatelessWidget {
  final String title;
  final Widget child;
  const Item({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(7),
        color: const Color(0xff4184CE),
        strokeCap: StrokeCap.butt,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 110.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    color: const Color(0xfff5f5f5),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(7),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 80.w,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xffE8E8E8),
                      color: Color(0xfff5f5f5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                      border: Border.all(color: Colors.blue),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      'تعديل',
                      style: TextStyle(fontSize: 14.sp,color: Color(0xff041D67)),
                    ),
                  ),
                ),
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
