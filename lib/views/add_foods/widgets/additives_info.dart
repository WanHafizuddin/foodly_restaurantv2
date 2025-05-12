import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurant_app/common/custome_textfield.dart';
import 'package:restaurant_app/common/cutom_button.dart';
import 'package:restaurant_app/models/additive_model.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constant.dart';
import '../../../controllers/food_controller.dart';

class AdditivesInfo extends StatelessWidget {
  const AdditivesInfo({super.key, required this.additivePrice, required this.additiveTitle});

  final TextEditingController additivePrice;
  final TextEditingController additiveTitle;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
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
                    text: "Add Additives Info",
                    style: appStyle(16, kGray, FontWeight.w600)),
                ReusableText(
                    text: "You are required add additives info for your product if it has any.",
                    style: appStyle(11, kGray, FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),

                  CustomTextfield(
                      controller: additivePrice,
                      hintText: "Addittives Price",
                      prefixIcon: Icon(Icons.keyboard_capslock
                      )
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  CustomTextfield(
                      controller: additivePrice,
                      hintText: "Addittives Price",
                      prefixIcon: Icon(Icons.keyboard_capslock
                      )
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  Obx(() =>
                  controller.additivesList.isNotEmpty
                      ? Column(
                    children: List.generate(controller.additivesList.length, (i) {
                      final additive = controller.additivesList[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: kGrayLight,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  text: additive.title,
                                  style: appStyle(11, kLightWhite,
                                      FontWeight.normal)),
                              ReusableText(
                                  text:"\$ ${additive.price.toString()}",
                                  style: appStyle(11, kLightWhite,
                                      FontWeight.normal)),
                            ],
                          )
                        ),
                      );
                    }),
                  )
                      : const SizedBox.shrink(),),

                  SizedBox(
                    height: 15.h,
                  ),

                  CustomButton(
                    text: "A D D  A D D I T I V E S",
                    btnWidth: width,
                    btnRadius: 9,
                    onTap: () {
                      if(additivePrice.text.isNotEmpty && additiveTitle.text.isNotEmpty) {
                        Additive additive = Additive(
                            id: controller.generatedId(),
                            title: additiveTitle.text,
                            price: additivePrice.text
                        );
                        controller.addAdditive = additive;
                        additivePrice.text = '';
                        additiveTitle.text = '';

                      }else {
                        Get.snackbar(
                          colorText: kLightWhite,
                          backgroundColor: kPrimary,
                          "You need data to add additives",
                          "Please fill all the fields"
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

