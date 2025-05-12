import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/app_style.dart';
import '../../../common/tab_widget.dart';
import '../../../constants/constant.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Container(
        height: 25.h,
        width: width,
        decoration: BoxDecoration(
          color: koffWhite,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(25.r),
          ),
          labelColor: kLightWhite,
          dividerColor: Colors.transparent,
          unselectedLabelColor: kGrayLight,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.zero,
          unselectedLabelStyle: appStyle(12, kGrayLight, FontWeight.normal),
          labelStyle: appStyle(12, kLightWhite, FontWeight.w600),
          tabs: List.generate(orderList.length, (i) {
            return TabWidget(text: orderList[i]);
          }),
        ),
      ),
    );
  }
}
