import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var isCompanySelected = true.obs;

  void selectCompany() {
    isCompanySelected.value = true;
  }

  void selectPerson() {
    isCompanySelected.value = false;
  }
}
