import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/forget_pass_controller.dart';
import 'package:calender/forget_pass/otp_view.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "forget password".tr,
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
                  GetBuilder<ForgetController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey2,
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
                              "1enter the email address.".tr,
                              style: AppTextStyles.mediumGreyTitle14,
                            ),
                            SizedBox(height: 25.h),
                            TextFieldCustomEdit(
                              controller: controller.controllerEmail,
                              validatorText: "please enter your email".tr,
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/sms.svg",
                                fit: BoxFit.scaleDown,
                              ),
                              textInputType: TextInputType.emailAddress,
                              hintText: "email".tr,
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "you remember your password".tr,
                                  style: AppTextStyles.mediumGreyTitle14,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "login".tr,
                                    style: AppTextStyles.mediumTitleBlue14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            FilledButtomEdit(
                              text: "rest password".tr,
                              buttonColor: const Color(0xff1565C0),
                              size: 16,
                              textColor: Colors.white,
                              onClick: () {
                                if (controller.formKey2.currentState!
                                    .validate()) {
                                  // Passwords are valid and match
                                  // Perform further actions like saving the password
                                  // controller.forgetPass();
                                  Get.to(() => const OTPView());
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
