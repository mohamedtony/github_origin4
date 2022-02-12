import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponsWidget extends StatelessWidget {
  const CouponsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(
      // hasNote: false,
      title: 'كوبون الاعلان',
      iconUrl: 'images/rate.png',
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(1),
                    child: Image.asset(
                      'images/namshi_logo.jpg',
                      height: 60.w,
                      width: 60.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  // borderRadius: BorderRadius.circular(8),
                                  // border: Border.all(
                                  //   color: Colors.grey[100]!,
                                  // ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        color: Colors.transparent,
                                        child: const Text('M521')),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.blue[400],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.brown[200]!,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Text('15'),
                                            Container(
                                              width: 20,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Image.asset(
                                                'images/coupon.png',
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            const Text(
                              'الانتهاء في 1/5/2021',
                              style: TextStyle(
                                color: Color(0xffFFAA00),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'قسيمة تخفيض نون 15 % على كل منتجات نون السعودية',
                          style: TextStyle(
                            color: Color(0xff041D67),
                            fontSize: 12,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 170.w,
                            ),
                            SizedBox(
                              width: 15,
                              child: Image.asset(
                                'images/android_done_all.png',
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'استخدام 400 مرة',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: const Color(0xff4184CE),
                  width: 0.01,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          'images/share.png',
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        '00',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          'images/dislike.png',
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        '00',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          'images/like.png',
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        '00',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 20,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          'images/android_done_all.png',
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Text(
                        '00',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        'الذهاب لمتجر نمشي',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'عدد مرات الذهاب 516',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
