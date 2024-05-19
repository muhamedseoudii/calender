import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/otp_controller.dart';
import 'package:calender/forget_pass/reset_pass_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OTPController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "security code".tr,
          style: AppTextStyles.largeTitleWhite20,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<OTPController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundImage: const AssetImage(
                                    "assets/images/calenderIcon.png"),
                                radius: 40.r,
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            Text(
                              "enter the code we have sent".tr,
                              style: AppTextStyles.mediumGreyTitle14,
                            ),
                            SizedBox(height: 25.h),
                            TextFieldCustomEdit(
                              controller: controller.controllerOTP,
                              validatorText:
                                  "please enter your security code".tr,
                              prefixIcon: const Icon(
                                Icons.security_outlined,
                                color: Colors.grey,
                              ),
                              textInputType: TextInputType.emailAddress,
                              hintText: "security code".tr,
                            ),
                            SizedBox(height: 30.h),
                            Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.remainingTime.value > 0
                                        ? "Resend code in ${controller.remainingTime.value} seconds"
                                            .tr
                                        : "press".tr,
                                    style: AppTextStyles.mediumGreyTitle14,
                                  ),
                                  TextButton(
                                    onPressed: controller.isResendButtonEnabled
                                        ? () {
                                            // Implement resend code logic here
                                            controller.startTimer();
                                          }
                                        : null,
                                    child: Text(
                                      "resend code".tr,
                                      style: AppTextStyles.mediumTitleBlue14
                                          .copyWith(
                                        color:
                                            controller.remainingTime.value > 0
                                                ? Colors.grey
                                                : const Color(0xff79A3D3),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            SizedBox(height: 40.h),
                            FilledButtomEdit(
                              text: "verify".tr,
                              buttonColor: const Color(0xff1565C0),
                              size: 16,
                              textColor: Colors.white,
                              onClick: () {
                                if (controller.formKey7.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  // controller.forgetPass();
                                  Get.to(() => const ResetPasswordView());
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
