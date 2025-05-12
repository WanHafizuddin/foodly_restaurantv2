import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import '../constants/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100.h,
      padding: EdgeInsets.fromLTRB(12.w,30.h,12.w,0),
      color: kSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage("assets/images/profile.png"),
              ),
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: "Kings Foods",
              style: appStyle(14, Colors.white, FontWeight.bold)
            ),
            ReusableText(
              text: "1874 LaFoods Street Union City, NJ 07087",
                style: appStyle(12, Colors.white, FontWeight.normal)
            ),
                  ],
                 ),
              ),
            ],
          ),
            SvgPicture.asset(
              'assets/icons/open.svg',
              height: 30.h,
              width: 30.w,
            )
        ],
      ),
    );
  }
}
