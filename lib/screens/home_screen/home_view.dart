import 'package:calender/component/home_task_custom.dart';
import 'package:calender/features/controllers/home_controller.dart';
import 'package:calender/screens/home_screen/task_details_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  Text(
                    "home".tr,
                    style: AppTextStyles.largeTitleWhite25,
                  ),
                  SizedBox(height: 65.h),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Obx(() => HomeTaskCustom(
                              onClick: () {
                                Get.to(() => const TaskDetailsView());
                              },
                              isChecked: homeController.taskList[index].value,
                              onCheckedChanged: (value) {
                                homeController.toggle(index);
                              },
                              title: "Pay a car".tr,
                              desc: "On this day we will pay a car".tr,
                              date: "15 Oct, 2024".tr));
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 25.h),
                        itemCount: 25),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
