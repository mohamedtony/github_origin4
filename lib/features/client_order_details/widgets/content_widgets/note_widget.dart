import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controller/client_order_details_controller.dart';

class NoteWidget extends GetWidget<ClientOrderDetailsController> {
  const NoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            // color: Colors.white,
           // color: Color(0xff979797),
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  width: 95.w,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    // border: Border.all(color: Colors.grey[300]!),
                    // color: const Color(0xff4184CE),
                    color: const Color(0xff979797),
                  ),
                  child: Text(
                    'ملحوظة',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GetBuilder<ClientOrderDetailsController>(
                    id: 'Second',
                    builder: (_) {
                      return Column(
                        children: [
                          Text(
                            ' بمناسبة هذا الافتتاح سنمنح عرض 25% لمدة 3 أيام كما أن هناك هداياتغطية افتتاح الفرع الثالث من فروعنا - الرياض . حي الملقى بمناسبة هذا الافتتاح سنمنح عرض 25% لمدة 3 أيام كما أن هناك هدايا',
                            style: TextStyle(
                              color: const Color(0xff041D67),
                              fontSize: 12.sp,
                            ),
                            maxLines: controller.secondSeeMore,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                controller.updateSeeMore(builderId: 'Second');
                              },
                              child: Text(
                                controller.secondSeeMore != null
                                    ? ' المزيد...'
                                    : ' أقل...',
                                style: TextStyle(
                                  color: const Color(0xffF1924F),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
