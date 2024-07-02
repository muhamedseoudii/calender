import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/edit_profile_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final ProfileController profileController = Get.find();
    // final controller = Get.put(EditProfileController());
    // controller.controller1.text = profileController.user.value?.data.name ?? '';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1565C0),
        title: Text(
          "edit profile".tr,
          style: AppTextStyles.largeTitleWhite20,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).w,
          child: ListView(
            children: [
              Column(
                children: [
                  GetBuilder<EditProfileController>(
                    builder: (controller) {
                      return Form(
                        key: controller.formKey5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              fit: StackFit.passthrough,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 55.r,
                                  child: Obx(() {
                                    if (controller.image != null) {
                                      return CircleAvatar(
                                        radius: 50.r,
                                        backgroundImage:
                                            FileImage(controller.image!),
                                      );
                                    } else {
                                      return CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 50.r,
                                        backgroundImage: const AssetImage(
                                          "assets/images/profile.png",
                                        ),
                                      );
                                    }
                                  }),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      Get.bottomSheet(
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(16)),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            // Set the desired height here
                                            color: Get.isDarkMode
                                                ? Colors.black
                                                : Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.camera),
                                                    title:
                                                        Text('take a photo'.tr),
                                                    onTap: () {
                                                      Get.back();
                                                      controller
                                                          .pickImageFromCamera();
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading:
                                                        const Icon(Icons.photo),
                                                    title: Text(
                                                        'choose from gallery'
                                                            .tr),
                                                    onTap: () {
                                                      Get.back();
                                                      controller
                                                          .pickImageFromGallery();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        isScrollControlled: true,
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 20.r,
                                      backgroundColor: const Color(0xffB2EBF2),
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            TextFieldCustomEdit(
                              hintText: "enter your new name".tr,
                              controller: controller.controller1,
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/profile.svg",
                                fit: BoxFit.scaleDown,
                              ),
                              suffixIcon: const Icon(Icons.edit),
                              validatorText: "please enter your name".tr,
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
                                        if (controller.formKey5.currentState!
                                            .validate()) {
                                          // Passwords are valid and match
                                          // Perform further actions like saving the password
                                          controller.updateProfile();
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
            ],
          ),
        ),
      ),
    );
  }
}

// NetworkImage(
// "${profileController.user.value?.data.profileImage}",
// ),
