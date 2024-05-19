import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool obscureT = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }
}
