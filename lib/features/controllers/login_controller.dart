import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool obscureT = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = RxString('');

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  void toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      var dio = Dio();
      var response = await dio.post(
        "http://127.0.0.1:5000/api/employee/login",
        data: {
          'email': emailController.text,
          'password': passController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final message = data['message'];
        Get.offAllNamed('/home');
        Get.snackbar(
          'Message',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', emailController.text);
        prefs.setString('token', data['token']);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        errorMessage(e.response!.data.toString());
        if (kDebugMode) {
          print(
              'Error ${e.response!.statusCode}: ${e.response!.statusMessage}');
        }
        final data = e.response!.data;
        final message = data['message'];
        Get.snackbar(
          'Failed',
          message,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        errorMessage(e.message);
        if (kDebugMode) {
          print('Error: ${e.message}');
        }
      }
    } catch (e, st) {
      errorMessage(e.toString());
      if (kDebugMode) {
        print('Error: $e');
        print('StackTrace: $st');
      }
    } finally {
      isLoading(false);
    }
  }
}
