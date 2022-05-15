import 'package:advertisers/features/notifications/controller/terms_controller.dart';
import 'package:advertisers/features/notifications/view/widgets/colors.dart';
import 'package:advertisers/features/notifications/view/widgets/constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScrollController dialogScrollController = ScrollController();

class DefaultAlertDialog extends StatelessWidget {
  const DefaultAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppConstants.appDirection,
      child: GetBuilder<TermsController>(
          init: TermsController(),
          builder: (controller) {
            return AlertDialog(
              backgroundColor: AppColors.navSelected,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0))),
              insetPadding: const EdgeInsets.all(10),
              contentPadding: const EdgeInsets.all(5),
              alignment: AlignmentDirectional.bottomCenter,
              title: Row(
                children: const [
                  Text('تعهد خاص:'),
                  Expanded(
                      child: Text(
                        'عمري فوق 18 سنة',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              titleTextStyle: TextStyle(
                  color: AppColors.light,
                  fontSize: 15.sp,
                  fontFamily: 'Jannat',
                  fontWeight: FontWeight.bold),
              content: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  controller: dialogScrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(AppConstants.terms.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• ",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    color: AppColors.light,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    AppConstants.terms[index],
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.light,
                                        fontFamily: 'Jannat'),
                                  ),
                                )
                              ]),
                        );
                      }),
                      Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: const Color(0xFFE8E8E8),
                            borderRadius: BorderRadius.circular(7),
                            border: controller.valid
                                ? null
                                : Border.all(color: const Color(0xFFDE2222)),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.defaultStatesBarShadow,
                                  offset: const Offset(0, 3),
                                  blurRadius: 6)
                            ]),
                        child: Row(
                          children: [
                            Checkbox(
                                shape: const CircleBorder(),
                                value: controller.checked,
                                onChanged: (value) =>
                                    controller.termsCheckBox(value!)),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              'لقد اطلعت على البنود أعلاه',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFF427AD0),
                                  fontSize: 15.sp,
                                  fontFamily: 'Jannat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      color: const Color(0xFF39C279),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () {
                        controller.validate();
                        dialogScrollController.animateTo(
                          dialogScrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                        if (controller.valid) {
                          Get.back();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'نعم قبلت',
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: 19.sp,
                            fontFamily: 'Jannat',
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: const Color(0xFFDE2222),
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'ارفض الطلب',
                          style: TextStyle(
                            color: AppColors.light,
                            fontSize: 19.sp,
                            fontFamily: 'Jannat',
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}