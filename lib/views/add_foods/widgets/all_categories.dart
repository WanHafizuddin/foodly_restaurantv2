import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constant.dart';

import '../../../controllers/food_controller.dart';

class ChooseCategory extends HookWidget {
  const ChooseCategory({super.key, required this.next});
  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());

    final List<Map<String, dynamic>> categories = [
      {
        "_id": "1",
        "title": "Fried Rice",
        "imageUrl": "https://img.icons8.com/emoji/48/spaghetti-emoji.png"
      },
      {
        "_id": "2",
        "title": "Curry",
        "imageUrl": "https://img.icons8.com/emoji/48/pizza-emoji.png"
      },
      {
        "_id": "3",
        "title": "Pizza",
        "imageUrl": "https://img.icons8.com/emoji/48/pizza-emoji.png"
      },
      {
        "_id": "4",
        "title": "Pasta",
        "imageUrl": "https://img.icons8.com/emoji/48/spaghetti-emoji.png"
      },
      {
        "_id": "5",
        "title": "Beverages",
        "imageUrl": "https://img.icons8.com/emoji/48/poultry-leg-emoji.png"
      },
      {
        "_id": "6",
        "title": "Burgers",
        "imageUrl": "https://img.icons8.com/emoji/48/hamburger-emoji.png"
      },
      {
        "_id": "7",
        "title": "Chicken",
        "imageUrl": "https://img.icons8.com/emoji/48/poultry-leg-emoji.png"
      },
      {
        "_id": "8",
        "title": "More",
        "imageUrl": "https://img.icons8.com/emoji/48/blue-square-emoji.png"
      },
    ];

    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    ReusableText(
                      text: "Pick Category",
                      style: appStyle(16, kGray, FontWeight.w600)),
                    ReusableText(
                      text: "You are to pick a category to continue adding a food item",
                      style: appStyle(12, kGray, FontWeight.normal)),
                ],
              ),
          ),
          SizedBox(
            height: height * 0.8,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];
                return ListTile(
                  onTap: () {
                    controller.setCategory = category['_id'];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kPrimary,
                    child: Image.network(category['imageUrl'], fit: BoxFit.contain),
                  ),
                  title: ReusableText(
                      text: category['title'],
                      style: appStyle(12, kGray, FontWeight.normal
                      )),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: kGray, size: 15.sp,
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
