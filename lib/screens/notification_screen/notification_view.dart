import 'package:calender/utils/app_text_styles.dart';
import 'package:calender/utils/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

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
                      Text(
                        "notification".tr,
                        style: AppTextStyles.largeTitleWhite25,
                      ),
                      SizedBox(height: 200.h),
                      InkWell(
                        onTap: () {
                          NotificationService().showNotification(
                              title: "New notification",
                              body: "Check new tasks");
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
                                Icons.notifications_none_outlined,
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
                          "no new notification yet".tr,
                          style: AppTextStyles.largeTitle25,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
