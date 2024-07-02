import 'package:calender/button_nav_bar/navigator_bar_view.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/login_controller.dart';
import 'package:calender/forget_pass/forget_pass_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background1.jpeg",
              fit: BoxFit.fill,
              height: 820.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 170.sp),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.r),
                                topLeft: Radius.circular(16.r)),
                            color: Colors.white),
                        height: 330.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: GetBuilder<LoginController>(
                            builder: (controller) {
                              return Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 35.h),
                                    TextFieldCustomEdit(
                                      fillColor: Colors.white,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      hintText: "email".tr,
                                      controller: controller.emailController,
                                      validatorText:
                                          "please enter your email".tr,
                                      textInputType: TextInputType.emailAddress,
                                      prefixIcon: SvgPicture.asset(
                                        "assets/icons/sms.svg",
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    TextFieldEditPass(
                                        fillColor: Colors.white,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onClick: controller.toggleDesign,
                                        prefixIcon: SvgPicture.asset(
                                          "assets/icons/lock.svg",
                                          fit: BoxFit.scaleDown,
                                        ),
                                        hintText: "password".tr,
                                        textController:
                                            controller.passController,
                                        icon: Icon(
                                          controller.obscureT
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.grey,
                                        ),
                                        obscureText: controller.obscureT),
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.to(() =>
                                                const ForgetPasswordView());
                                          },
                                          child: Text(
                                            "forgot password?".tr,
                                            style:
                                                AppTextStyles.mediumTitleBlue14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    // Obx(
                                    //   () => controller.isLoading.value
                                    //       ? const Center(
                                    //           child: CircularProgressIndicator(
                                    //               color: Color(0xff79A3D3)),
                                    //         )
                                    //       : InkWell(
                                    //           onTap: () {
                                    //             if (formKey.currentState!
                                    //                 .validate()) {
                                    //               // controller.login();
                                    //               Get.offAll(() =>
                                    //                   const BottomNavBar());
                                    //             }
                                    //           },
                                    //           child: Center(
                                    //             child: Container(
                                    //               height: 60.h,
                                    //               width: 300.w,
                                    //               decoration: BoxDecoration(
                                    //                   borderRadius:
                                    //                       BorderRadius.only(
                                    //                           bottomLeft: Radius
                                    //                               .circular(
                                    //                                   16.r),
                                    //                           bottomRight: Radius
                                    //                               .circular(
                                    //                                   16.r)),
                                    //                   color: const Color(
                                    //                       0xff01579B)),
                                    //               child: Center(
                                    //                   child: Text(
                                    //                 "signin".tr,
                                    //                 style: AppTextStyles
                                    //                     .largeTitleWhite20,
                                    //               )),
                                    //             ),
                                    //           ),
                                    //         ),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // controller.login();
                        Get.offAll(() => const BottomNavBar());
                      }
                    },
                    child: Center(
                      child: Container(
                        height: 60.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r)),
                            color: const Color(0xff01579B)),
                        child: Center(
                            child: Text(
                          "signin".tr,
                          style: AppTextStyles.largeTitleWhite20,
                        )),
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "don’t have an account?".tr,
                  //       style: AppTextStyles.mediumGreyTitle16,
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         // Get.to(() => const RegisterView());
                  //       },
                  //       child: Text(
                  //         "signup".tr,
                  //         style: AppTextStyles.largeTitleYellow16,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Positioned(
              top: 140.sp,
              left: 150.sp,
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage("assets/images/calenderIcon.png"),
                radius: 40.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
