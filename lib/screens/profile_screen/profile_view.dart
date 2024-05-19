import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/settings_list_tile.dart';
import 'package:calender/features/controllers/theme_service_controller.dart';
import 'package:calender/screens/profile_screen/settings/change_pass_view.dart';
import 'package:calender/screens/profile_screen/settings/edit_profile_view.dart';
import 'package:calender/screens/profile_screen/settings/language_view.dart';
import 'package:calender/screens/profile_screen/settings/policy_view.dart';
import 'package:calender/screens/profile_screen/settings/report_view.dart';
import 'package:calender/screens/profile_screen/settings/terms.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
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
                        "profile".tr,
                        style: AppTextStyles.largeTitleWhite25,
                      ),
                      SizedBox(height: 80.h),
                      Center(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: SizedBox(
                                  width: 250.w,
                                  height: 250.h,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 80.r,
                                    backgroundImage: const AssetImage(
                                      "assets/images/profile.png",
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50.r,
                            backgroundImage: const AssetImage(
                              "assets/images/profile.png",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Text(
                          "name".tr,
                          style: AppTextStyles.largeTitle22,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: SizedBox(
                          width: 180.w,
                          height: 40.h,
                          child: FilledButtomEdit(
                            text: "edit profile".tr,
                            buttonColor: const Color(0xff1565C0),
                            size: 16,
                            textColor: Colors.white,
                            onClick: () {
                              Get.to(() => const EditProfileView());
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      SettingsListTile(
                        onTap: () {},
                        text: "done task".tr,
                        icon: const Icon(
                          Icons.done,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        text: "dark mode".tr,
                        icon: const Icon(
                          Icons.dark_mode_outlined,
                          color: Color(0xff1565C0),
                        ),
                        widget: Obx(() => Switch(
                              // activeColor: Color(0xff79A3D3),
                              inactiveTrackColor: const Color(0xffE0E0E0),
                              value: themeController.switchValue.value,
                              onChanged: (value) {
                                themeController.toggleTheme();
                              },
                            )),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.to(() => const LanguageView());
                        },
                        text: "language".tr,
                        icon: const Icon(
                          Icons.language,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.to(() => const ChangePassView());
                        },
                        text: "change pass".tr,
                        icon: const Icon(
                          Icons.lock,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.to(() => const PolicyView());
                        },
                        text: "privacy".tr,
                        icon: const Icon(
                          Icons.privacy_tip_outlined,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.to(() => const TermsView());
                        },
                        text: "terms".tr,
                        icon: const Icon(
                          Icons.terminal,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.to(() => const ReportView());
                        },
                        text: "report".tr,
                        icon: const Icon(
                          Icons.report,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 10.h),
                      SettingsListTile(
                        onTap: () {
                          Get.defaultDialog(
                            radius: 16.r,
                            contentPadding: const EdgeInsets.all(16),
                            title: 'confirm logout'.tr,
                            middleText: 'are you sure logout'.tr,
                            actions: [
                              FilledButtomEdit(
                                text: "confirm".tr,
                                buttonColor: Colors.red,
                                size: 16.sp,
                                textColor: Colors.white,
                                onClick: () {
                                  Get.back(); // Close the dialog
                                  Get.offAllNamed('/login');
                                },
                              ),
                              FilledButtomEdit(
                                text: "cancel".tr,
                                buttonColor: const Color(0xff79A3D3),
                                size: 16.sp,
                                textColor: Colors.white,
                                onClick: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                        text: "logout".tr,
                        icon: const Icon(
                          Icons.logout,
                          color: Color(0xff1565C0),
                        ),
                        widget: const Icon(Icons.arrow_forward_ios_outlined),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcIn),
                      ),
                      SizedBox(height: 20.h),
                      FilledButtomEdit(
                        text: "delete account".tr,
                        buttonColor: const Color(0xffD50000),
                        size: 16.sp,
                        textColor: Colors.white,
                        onClick: () {
                          Get.defaultDialog(
                            radius: 16.r,
                            contentPadding: EdgeInsets.all(16.w),
                            title: 'confirm deletion'.tr,
                            middleText: 'are you sure'.tr,
                            actions: [
                              FilledButtomEdit(
                                text: "confirm".tr,
                                buttonColor: Colors.red,
                                size: 16.sp,
                                textColor: Colors.white,
                                onClick: () {
                                  Get.back(); // Close the dialog
                                },
                              ),
                              FilledButtomEdit(
                                text: "cancel".tr,
                                buttonColor: const Color(0xff79A3D3),
                                size: 16.sp,
                                textColor: Colors.white,
                                onClick: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
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
