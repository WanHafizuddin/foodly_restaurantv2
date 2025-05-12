import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../common/home_tile.dart';
import '../../../constants/constant.dart';
import '../../add_foods/add_foods.dart';
import '../../food/food_list.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 70.h,
      decoration: BoxDecoration(
        color: koffWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeTile(
                onTap: () {
                  Get.to(() => const AddFoods(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 900));
                },
                text: "Add Foods",
                iconPath: "assets/icons/taco.svg"
            ),

            HomeTile(
                onTap: () {},
                text: "Wallet",
                iconPath: "assets/icons/wallet.svg"
            ),

            HomeTile(
                onTap: () {
                  Get.to(() => const FoodList(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 900));
                },
                text: "Foods",
                iconPath: "assets/icons/french_fries.svg"
            ),

            HomeTile(
                onTap: () {},
                text: "Self Deliveries",
                iconPath: "assets/icons/delivery.svg"
            ),

          ],
        ),
      ),
    );
  }
}
