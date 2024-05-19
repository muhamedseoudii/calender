import 'package:calender/component/buttom_custom.dart';
import 'package:calender/features/controllers/onboarding_controller.dart';
import 'package:calender/login/login_view.dart';
import 'package:calender/register/register_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingController onBoardingController =
        Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background1.jpeg",
            fit: BoxFit.cover,
            height: 900.h,
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "welcome to calender".tr,
                    style: AppTextStyles.largeTitleWhite30,
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "user type".tr,
                    style: AppTextStyles.largeTitleWhite20,
                  ),
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // InkWell(
                    //   onTap: onBoardingController.selectCompany,
                    //   child: Container(
                    //     height: 90.h,
                    //     width: 100.w,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20.r),
                    //       color:
                    //           onBoardingController.isCompanySelected.value
                    //               ? Colors.amber
                    //               : Colors.white,
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.all(8.w),
                    //       child: Column(
                    //         mainAxisAlignment:
                    //             MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           SvgPicture.asset(
                    //             "assets/icons/building.svg",
                    //             fit: BoxFit.scaleDown,
                    //           ),
                    //           Center(
                    //             child: Text(
                    //               textAlign: TextAlign.center,
                    //               "company".tr,
                    //               style: AppTextStyles.largeTitle16,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: onBoardingController.selectPerson,
                      child: Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.amber,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/user.svg",
                                fit: BoxFit.scaleDown,
                              ),
                              Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "person".tr,
                                  style: AppTextStyles.largeTitle16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150.h),
                FilledButtomEdit(
                  text: "signin".tr,
                  buttonColor: Colors.amber,
                  size: 18.sp,
                  textColor: Colors.black,
                  onClick: () {
                    Get.to(() => const LoginView());
                  },
                ),
                // SizedBox(height: 25.h),
                // FilledButtomEdit(
                //   text: "signup".tr,
                //   buttonColor: Colors.white,
                //   size: 18.sp,
                //   textColor: Colors.black,
                //   onClick: () {
                //     // Get.to(() => const RegisterView());
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
