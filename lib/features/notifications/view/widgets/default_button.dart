import 'package:advertisers/features/notifications/view/widgets/colors.dart';
import 'package:advertisers/features/notifications/view/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final Color? color;
  final TextStyle? textStyle;
  final String text;
  final VoidCallback? onPressed;
  final double minHeight;
  final double minWidth;
  const DefaultButton({
    Key? key,
    this.color,
    this.textStyle,
    required this.text,
    this.onPressed,
    this.minHeight = 40,
    this.minWidth = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.defaultButtonShadow,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(minWidth.w, minHeight.h),
          elevation: 0.0,
          primary: color ?? AppColors.defaultBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}