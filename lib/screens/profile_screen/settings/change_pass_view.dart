import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/change_pass_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePassController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "change password".tr,
          style: AppTextStyles.largeTitleWhite20,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: Column(
            children: [
              GetBuilder<ChangePassController>(
                builder: (controller) {
                  return Form(
                    key: controller.formKey6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFieldEditPass(
                          textController: controller.controller1,
                          onClick: controller.toggleDesign,
                          hintText: "enter your current password".tr,
                          icon: Icon(
                            controller.obscureT
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          obscureText: controller.obscureT,
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/lock.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextFieldEditPass(
                          textController: controller.controller2,
                          onClick: controller.toggleDesign1,
                          hintText: "enter your new password".tr,
                          icon: Icon(
                            controller.obscureT1
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          obscureText: controller.obscureT1,
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/lock.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextFieldEditPassConfirm(
                          textController: controller.controller3,
                          validateController: controller.controller2,
                          hintText: "enter confirm new password".tr,
                          onClick: controller.toggleDesign2,
                          icon: Icon(
                            controller.obscureT2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                          obscureText: controller.obscureT2,
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/lock.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Obx(
                          () => controller.isLoading.value
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Color(0xff1565C0)),
                                )
                              : FilledButtomEdit(
                                  text: "save".tr,
                                  buttonColor: const Color(0xff1565C0),
                                  size: 16,
                                  textColor: Colors.white,
                                  onClick: () {
                                    if (controller.formKey6.currentState!
                                        .validate()) {
                                      // Passwords are valid and match
                                      // Perform further actions like saving the password
                                      // controller.changePass();
                                    }
                                  },
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
