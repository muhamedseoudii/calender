import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff1565C0),
          title: Text(
            "task details".tr,
            style: AppTextStyles.largeTitleWhite20,
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  color: const Color(0xff1565C0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pay a car".tr,
                        style: AppTextStyles.largeTitleWhite20,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Tue, 15 Oct, 2024 | 07:00 AM".tr,
                        style: AppTextStyles.mediumAmberTitle14,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "On this day we will pay a car".tr,
                        style: AppTextStyles.largeTitleWhite16,
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        "Type: Licence".tr,
                        style: AppTextStyles.largeTitleWhite20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
