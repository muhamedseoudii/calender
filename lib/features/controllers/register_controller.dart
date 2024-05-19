import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool obscureT = true;
  bool obscureT1 = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  toggleDesign() {
    obscureT = !obscureT;
    update();
  }

  toggleDesign1() {
    obscureT1 = !obscureT1;
    update();
  }
}
