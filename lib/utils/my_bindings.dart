import 'package:calender/features/controllers/edit_profile_controller.dart';
import 'package:calender/features/controllers/login_controller.dart';
import 'package:calender/features/controllers/notification_controller.dart';
import 'package:calender/features/controllers/profile_controller.dart';
import 'package:calender/features/controllers/register_controller.dart';
import 'package:calender/features/controllers/theme_service_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(EditProfileController());
    Get.put(ProfileController());
    Get.put(ThemeController());
    Get.put(NotificationsController());
  }
}
