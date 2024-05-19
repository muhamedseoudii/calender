import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/reset_pass_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "reset password".tr,
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
                  GetBuilder<ResetPassController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey8,
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
                              "create your new password".tr,
                              style: AppTextStyles.mediumGreyTitle14,
                            ),
                            SizedBox(height: 25.h),
                            TextFieldEditPass(
                                textController: controller.passController,
                                onClick: controller.toggleDesign,
                                hintText: "password".tr,
                                icon: Icon(
                                  controller.obscureT
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey,
                                ),
                                obscureText: controller.obscureT,
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/lock.svg",
                                  colorFilter: const ColorFilter.mode(
                                      Colors.grey, BlendMode.srcIn),
                                  fit: BoxFit.scaleDown,
                                )),
                            SizedBox(height: 20.h),
                            TextFieldEditPassConfirm(
                              hintText: "confirm password".tr,
                              onClick: controller.toggleDesign1,
                              icon: Icon(
                                controller.obscureT1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                              obscureText: controller.obscureT1,
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/lock.svg",
                                colorFilter: const ColorFilter.mode(
                                    Colors.grey, BlendMode.srcIn),
                                fit: BoxFit.scaleDown,
                              ),
                              textController: controller.confirmPassController,
                              validateController: controller.passController,
                            ),
                            SizedBox(height: 40.h),
                            FilledButtomEdit(
                              text: "reset password".tr,
                              buttonColor: const Color(0xff1565C0),
                              size: 16,
                              textColor: Colors.white,
                              onClick: () {
                                if (controller.formKey8.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  // controller.forgetPass();
                                  // Get.to(() => const OTPView());
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
