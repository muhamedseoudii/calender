import 'package:calender/button_nav_bar/navigator_bar_view.dart';
import 'package:calender/features/controllers/locale_controller.dart';
import 'package:calender/features/controllers/theme_service_controller.dart';
import 'package:calender/login/login_view.dart';
import 'package:calender/screens/home_screen/home_view.dart';
import 'package:calender/splash/splash_view.dart';
import 'package:calender/utils/my_bindings.dart';
import 'package:calender/utils/my_locale.dart';
import 'package:calender/utils/themes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    LocaleController controller = Get.put(LocaleController());
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Calender'.tr,
          debugShowCheckedModeBanner: false,
          locale: controller.inialLang,
          translations: MyLocale(),
          theme: ThemeClass().lightTheme,
          darkTheme: ThemeClass().darkTheme,
          themeMode: ThemeController().isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialBinding: MyBindings(),
          initialRoute: '/',
          getPages: [
            GetPage(
                name: '/',
                page: () => const SplashView(),
                binding: MyBindings()),
            GetPage(
                name: '/login',
                page: () => const LoginView(),
                binding: MyBindings()),
            GetPage(
                name: '/home',
                page: () => const HomeView(),
                binding: MyBindings()),
            GetPage(
                name: '/navBar',
                page: () => const BottomNavBar(),
                binding: MyBindings()),
          ],
        );
      },
    );
  }
}
