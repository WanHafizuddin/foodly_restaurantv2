import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/constants/constant.dart';

class TabWidget extends StatelessWidget {
  final String text;

  const TabWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 25.h,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
