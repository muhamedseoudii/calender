import 'package:calender/component/buttom_custom.dart';
import 'package:calender/screens/add_screen/add_task_view.dart';
import 'package:calender/screens/add_screen/personal_task_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.r),
                          bottomLeft: Radius.circular(25.r)),
                      color: const Color(0xff1565C0)),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "add".tr,
                            style: AppTextStyles.largeTitleWhite25,
                          ),
                          IconButton(
                              iconSize: 30.sp,
                              onPressed: () {
                                Get.to(() => const AddTaskView());
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(height: 200.h),
                      InkWell(
                        onTap: () {
                          Get.to(() => const AddTaskView());
                        },
                        child: Center(
                          child: Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: const Color(0xff1565C0)),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Center(
                        child: Text(
                          "add first task".tr,
                          style: AppTextStyles.largeTitle25,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      FilledButtomEdit(
                        text: "go to personal tasks".tr,
                        buttonColor: const Color(0xff1565C0),
                        size: 16,
                        textColor: Colors.white,
                        onClick: () {
                          Get.to(() => const PersonalTaskView());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
