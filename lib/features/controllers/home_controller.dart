import 'package:get/get.dart';

class HomeController extends GetxController {
  var taskList = List.generate(25, (_) => false.obs);

  void toggle(int index) {
    taskList[index].value = !taskList[index].value;
  }
}
