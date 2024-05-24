import 'package:calender/utils/notification_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/controllers/theme_service_controller.dart';
import 'features/models/task_hive_model.dart';
import 'src/app_root.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:path_provider/path_provider.dart' as path_provider;

SharedPreferences? pref;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.initNotification();
  tz.initializeTimeZones();
  await initSharedPreferences().then((prefs) {
    pref = prefs;
    Get.put(() => ThemeController().loadThemeFromPreferences());
  });
  // Hive Setup
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const AppRoot());
}

Future<SharedPreferences> initSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

Dio dio = Dio(BaseOptions(
  receiveDataWhenStatusError: true,
  validateStatus: (status) => true,
));

void setupDio() {
  dio.interceptors.add(InterceptorsWrapper(
    onResponse: (response, handler) async {
      // Check if the response status is 401 (unauthorized)
      if (response.statusCode == 401) {
        // await ProfilePageView.clearSharedPreferences();

        // Redirect the user to the login screen
        // Replace '/login' with your actual login route
        Get.offAllNamed('/login');
      }
      return handler.next(response);
    },
  ));
}
