import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage,
    this.marginEnd = 0,
  }) : super(key: key);

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 4.h,
      width: 18.w,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF6A90F2) : Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
