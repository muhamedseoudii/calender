import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/report_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff1565C0),
          title: Text(
            "report".tr,
            style: AppTextStyles.largeTitleWhite20,
          )),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<ReportController>(
              builder: (controller) {
                return Form(
                  key: controller.formKey4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFieldCustomEdit(
                        hintText: "title".tr,
                        controller: controller.controller1,
                        validatorText: "please enter your problem title".tr,
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.task_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      TextFieldCustomEdit(
                        maxLines: 5,
                        hintText: "description".tr,
                        controller: controller.controller2,
                        validatorText:
                            "please enter your problem description".tr,
                        textInputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.description_outlined,
                          color: Colors.grey,
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
                                text: "send".tr,
                                buttonColor: const Color(0xff1565C0),
                                size: 16,
                                textColor: Colors.white,
                                onClick: () {
                                  if (controller.formKey4.currentState!
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
    );
  }
}
