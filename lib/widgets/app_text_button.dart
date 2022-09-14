import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../value/colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 343,
    this.height = 48,
    this.textColor = const Color(0xFFFFFFFF),
    this.backgroundColor = AppColors.appColor,
    this.borderColor = Colors.transparent,
    this.radius = 15,

  }) : super(key: key);

  final String text;
  final Color textColor;
  final void Function() onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}