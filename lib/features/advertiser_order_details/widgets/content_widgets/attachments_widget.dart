import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentsWidget extends StatelessWidget {
  const AttachmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(
      // hasNote: true,
      title: 'مرفقات الإعلان',
      iconUrl: 'images/attatch_file_icon.png',
      child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Image.asset(
                      'images/twitter.png',
                      height: 80.w,
                      width: 80.w,
                    ),
                  ),
                ),
                // Positioned(
                //     left: 0,
                //     child: Container(
                //       padding: const EdgeInsets.all(1),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(100),
                //         border: Border.all(
                //           color: Colors.red,
                //         ),
                //       ),
                //       child: Icon(
                //         Icons.close,
                //         color: Colors.red,
                //         size: 12.sp,
                //       ),
                //     ))
              ],
            );
          }),
    );
  }
}
