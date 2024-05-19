// import 'package:calender/component/text_field_custom.dart';
// import 'package:calender/features/controllers/register_controller.dart';
// import 'package:calender/login/login_view.dart';
// import 'package:calender/utils/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// class RegisterView extends StatelessWidget {
//   const RegisterView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final formKey1 = GlobalKey<FormState>();
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   "assets/images/background1.jpeg",
//                   fit: BoxFit.fill,
//                   height: 950.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 10.w),
//                   child: IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new,
//                         color: Colors.white,
//                       )),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 170.sp),
//                         child: Center(
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(16.r),
//                                     topLeft: Radius.circular(16.r)),
//                                 color: Colors.white),
//                             height: 580.h,
//                             width: 300.w,
//                             child: Padding(
//                                 padding: EdgeInsets.all(16.w),
//                                 child: GetBuilder<RegisterController>(
//                                   builder: (controller) {
//                                     return Form(
//                                         key: formKey1,
//                                         child: Column(
//                                           children: [
//                                             SizedBox(height: 35.h),
//                                             TextFieldCustomEdit(
//                                               hintText: "username".tr,
//                                               controller:
//                                                   controller.nameController,
//                                               validatorText:
//                                                   "please enter your user company"
//                                                       .tr,
//                                               textInputType: TextInputType.name,
//                                               prefixIcon: SvgPicture.asset(
//                                                 "assets/icons/building.svg",
//                                                 fit: BoxFit.scaleDown,
//                                                 colorFilter:
//                                                     const ColorFilter.mode(
//                                                         Colors.grey,
//                                                         BlendMode.srcIn),
//                                               ),
//                                             ),
//                                             SizedBox(height: 15.h),
//                                             TextFieldCustomEdit(
//                                               hintText: "email".tr,
//                                               controller:
//                                                   controller.emailController,
//                                               validatorText:
//                                                   "please enter your email".tr,
//                                               textInputType:
//                                                   TextInputType.emailAddress,
//                                               prefixIcon: SvgPicture.asset(
//                                                 "assets/icons/sms.svg",
//                                                 fit: BoxFit.scaleDown,
//                                               ),
//                                             ),
//                                             SizedBox(height: 15.h),
//                                             TextFieldCustomEdit(
//                                               hintText: "number".tr,
//                                               controller:
//                                                   controller.numberController,
//                                               validatorText:
//                                                   "please enter your user company"
//                                                       .tr,
//                                               textInputType:
//                                                   TextInputType.number,
//                                               prefixIcon: SvgPicture.asset(
//                                                 "assets/icons/call.svg",
//                                                 fit: BoxFit.scaleDown,
//                                                 colorFilter:
//                                                     const ColorFilter.mode(
//                                                         Colors.grey,
//                                                         BlendMode.srcIn),
//                                               ),
//                                             ),
//                                             SizedBox(height: 15.h),
//                                             TextFieldEditPass(
//                                                 onClick:
//                                                     controller.toggleDesign,
//                                                 prefixIcon: SvgPicture.asset(
//                                                   "assets/icons/lock.svg",
//                                                   fit: BoxFit.scaleDown,
//                                                 ),
//                                                 hintText: "password".tr,
//                                                 controller1:
//                                                     controller.passController,
//                                                 icon: Icon(
//                                                   controller.obscureT
//                                                       ? Icons
//                                                           .visibility_off_outlined
//                                                       : Icons
//                                                           .visibility_outlined,
//                                                   color: Colors.grey,
//                                                 ),
//                                                 obscureText:
//                                                     controller.obscureT),
//                                             SizedBox(height: 15.h),
//                                             TextFieldEditPassConfirm(
//                                                 hintText: "confirm pass".tr,
//                                                 onClick:
//                                                     controller.toggleDesign1,
//                                                 textController: controller
//                                                     .confirmPassController,
//                                                 prefixIcon: SvgPicture.asset(
//                                                   "assets/icons/lock.svg",
//                                                   fit: BoxFit.scaleDown,
//                                                 ),
//                                                 icon: Icon(
//                                                   controller.obscureT1
//                                                       ? Icons
//                                                           .visibility_off_outlined
//                                                       : Icons
//                                                           .visibility_outlined,
//                                                   color: Colors.grey,
//                                                 ),
//                                                 obscureText:
//                                                     controller.obscureT1,
//                                                 validateController:
//                                                     controller.passController),
//                                             SizedBox(height: 15.h),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 TextButton(
//                                                   onPressed: () {
//                                                     // Get.to(() => const ForgetPasswordView());
//                                                   },
//                                                   child: Text(
//                                                     "forgot password?".tr,
//                                                     style: AppTextStyles
//                                                         .mediumTitleBlue14,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ));
//                                   },
//                                 )),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           if (formKey1.currentState!.validate()) {
//                             // controller.login();
//                           }
//                         },
//                         child: Center(
//                           child: Container(
//                             height: 60.h,
//                             width: 300.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(16.r),
//                                     bottomRight: Radius.circular(16.r)),
//                                 color: const Color(0xff01579B)),
//                             child: Center(
//                                 child: Text(
//                               "signup".tr,
//                               style: AppTextStyles.largeTitleWhite20,
//                             )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 70.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "already have an account?".tr,
//                             style: AppTextStyles.mediumGreyTitle16,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Get.offAll(() => const LoginView());
//                             },
//                             child: Text(
//                               "signin".tr,
//                               style: AppTextStyles.largeTitleYellow16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: 140.sp,
//                   left: 150.sp,
//                   child: CircleAvatar(
//                     backgroundImage:
//                         const AssetImage("assets/images/calenderIcon.png"),
//                     radius: 40.r,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
