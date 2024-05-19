import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';

class AddTaskController extends GetxController {
  final formKey3 = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController clockController = TextEditingController();

  DropListModel dropListNotification = DropListModel([
    OptionItem(id: "1", title: "1 hour before".tr),
    OptionItem(
      id: "2",
      title: "2 hours before".tr,
    ),
    OptionItem(id: "3", title: "3 hours before".tr),
    OptionItem(
      id: "4",
      title: "10 minutes before".tr,
    ),
    OptionItem(id: "5", title: "15 minutes before".tr),
  ]);
  var optionItemSelectedNotification = OptionItem(title: "select time".tr).obs;
  var contentTypeNotification = ''.obs;

  DropListModel dropListType = DropListModel([
    OptionItem(id: "1", title: "licence".tr),
    OptionItem(
      id: "2",
      title: "leasing".tr,
    ),
    // OptionItem(id: "3", title: ""),
    // OptionItem(
    //   id: "4",
    //   title: "",
    // ),
    // OptionItem(id: "5", title: "10 minutes before"),
  ]);

  var optionItemSelectedType = OptionItem(title: "select type".tr).obs;
  var contentTypeOfType = ''.obs;
}
