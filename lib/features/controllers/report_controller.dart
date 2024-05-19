import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  final formKey4 = GlobalKey<FormState>();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = RxString('');
}
