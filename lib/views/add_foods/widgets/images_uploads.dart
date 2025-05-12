import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/app_style.dart';
import '../../../common/cutom_button.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constant.dart';
import '../../../controllers/uploader_controller.dart';

class ImagesUploads extends StatelessWidget {
  const ImagesUploads({super.key, required this.back, required this.next});

  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
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
                    text: "Upload Images",
                    style: appStyle(16, kGray, FontWeight.w600)),
                ReusableText(
                    text: "You are required to upload at least 2 images to proceed",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image one
                      GestureDetector(
                        onTap: () {
                          controller.pickImage(controller.imageOne);
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageOne.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark,
                                  FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(
                              controller.imageOne.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),

                      // Image two
                      GestureDetector(
                        onTap: () {
                          controller.pickImage(controller.imageTwo);
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageTwo.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark,
                                  FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(
                              controller.imageTwo.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image three
                      GestureDetector(
                        onTap: () {
                          controller.pickImage(controller.imageThree);
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageThree.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark,
                                  FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(
                              controller.imageThree.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),

                      // Image four
                      GestureDetector(
                        onTap: () {
                          controller.pickImage(controller.imageFour);
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: controller.imageFour.value == null
                              ? Center(
                            child: ReusableText(
                              text: "Upload Image",
                              style: appStyle(16, kDark,
                                  FontWeight.w600),
                            ),
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(
                              controller.imageFour.value!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "Back",
                        btnWidth: MediaQuery.of(context).size.width / 2.3,
                        btnRadius: 9,
                        onTap: () {
                          back();
                        },
                      ),
                      CustomButton(
                        text: "Next",
                        btnWidth: MediaQuery.of(context).size.width / 2.3,
                        btnRadius: 9,
                        onTap: () {
                          // Ensure at least 2 images are uploaded before proceeding
                          if (controller.imageOne.value != null && controller.imageTwo.value != null) {
                            next();
                          } else {
                            Get.snackbar("Error", "Please upload at least 2 images.");
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
