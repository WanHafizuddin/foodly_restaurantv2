import 'package:flutter/material.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constant.dart';
import 'package:restaurant_app/views/add_foods/widgets/additives_info.dart';
import 'package:restaurant_app/views/add_foods/widgets/all_categories.dart';
import 'package:restaurant_app/views/add_foods/widgets/food_info.dart';
import 'package:restaurant_app/views/add_foods/widgets/images_uploads.dart';

import '../../common/background_container.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();
  final TextEditingController additivePrice = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: "Welcome to Restaurant Panel",
                style: appStyle(14, kLightWhite, FontWeight.w600)
            ),
            ReusableText(
                text: "Fill all the required info",
                style: appStyle(12, kLightWhite, FontWeight.normal)
            )
          ],
        ),
      ),
      body: BackgroundContainer(child: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              children: [
                ChooseCategory(
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
                ImagesUploads(
                  back: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
                FoodInfo(
                  back: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  title: title,
                  description: description,
                  price: price,
                  preparation: preparation,
                  types: types,
                ),

                AdditivesInfo(
                  additivePrice: additivePrice,
                  additiveTitle: additiveTitle,
                )



              ],
            ),
          )
        ],
      )),
    );
  }
}
