import 'package:calender/component/buttom_custom.dart';
import 'package:calender/component/text_field_custom.dart';
import 'package:calender/features/controllers/add_task_controller.dart';
import 'package:calender/utils/app_text_styles.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    AddTaskController addTaskController = Get.put(AddTaskController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff1565C0),
          title: Text(
            "new task".tr,
            style: AppTextStyles.largeTitleWhite20,
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(
            children: [
              TextFieldCustomEdit(
                textInputType: TextInputType.text,
                labelText: "task name".tr,
                hintText: "enter name task".tr,
                controller: addTaskController.taskNameController,
                validatorText: "please enter your task name".tr,
                prefixIcon: const Icon(
                  Icons.task_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25.h),
              TextFieldCustomEdit(
                textInputType: TextInputType.datetime,
                labelText: "date".tr,
                hintText: "enter date".tr,
                controller: addTaskController.dateController,
                validatorText: "please enter your date".tr,
                prefixIcon: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25.h),
              TextFieldCustomEdit(
                maxLines: 2,
                textInputType: TextInputType.text,
                labelText: "description task".tr,
                hintText: "enter description task".tr,
                controller: addTaskController.descController,
                validatorText: "please enter your description".tr,
                prefixIcon: const Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25.h),
              TextFieldCustomEdit(
                textInputType: TextInputType.datetime,
                labelText: "clock".tr,
                hintText: "enter clock task".tr,
                controller: addTaskController.clockController,
                validatorText: "please enter your clock".tr,
                prefixIcon: const Icon(
                  Icons.access_time_outlined,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 25.h),
              Obx(() {
                return Form(
                  key: addTaskController.formKey3,
                  child: Column(
                    children: [
                      SelectDropList(
                        hintColorTitle: Colors.grey,
                        dropboxColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.black
                                : Colors.white,
                        textColorItem:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        itemSelected: addTaskController
                            .optionItemSelectedNotification.value,
                        dropListModel: addTaskController.dropListNotification,
                        showIcon: true,
                        showArrowIcon: true,
                        showBorder: true,
                        borderColor: Colors.grey,
                        textColorTitle: Colors.black,
                        arrowColor: Colors.grey,
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 55.h,
                        textSizeTitle: 16,
                        textSizeItem: 16,
                        suffixIcon: Icons.arrow_drop_down,
                        arrowIconSize: 28,
                        paddingDropItem: EdgeInsets.all(10.w),
                        paddingBottom: 0,
                        paddingLeft: 0,
                        containerPadding:
                            const EdgeInsets.only(left: 0, right: 10),
                        paddingRight: 0,
                        paddingTop: 0,
                        onOptionSelected: (optionItem) {
                          addTaskController.optionItemSelectedNotification
                              .value = optionItem;
                        },
                      ),
                      SizedBox(height: 25.h),
                      SelectDropList(
                        hintColorTitle: Colors.grey,
                        dropboxColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.black
                                : Colors.white,
                        textColorItem:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        itemSelected:
                            addTaskController.optionItemSelectedType.value,
                        dropListModel: addTaskController.dropListType,
                        showIcon: true,
                        showArrowIcon: true,
                        showBorder: true,
                        borderColor: Colors.grey,
                        textColorTitle: Colors.black,
                        arrowColor: Colors.grey,
                        icon: const Icon(
                          Icons.table_rows_rounded,
                          color: Colors.grey,
                        ),
                        width: double.infinity,
                        height: 55.h,
                        textSizeTitle: 16,
                        textSizeItem: 16,
                        suffixIcon: Icons.arrow_drop_down,
                        arrowIconSize: 28,
                        paddingDropItem: EdgeInsets.all(10.w),
                        paddingBottom: 0,
                        paddingLeft: 0,
                        containerPadding:
                            const EdgeInsets.only(left: 0, right: 10),
                        paddingRight: 0,
                        paddingTop: 0,
                        onOptionSelected: (optionItem) {
                          addTaskController.optionItemSelectedType.value =
                              optionItem;
                        },
                      ),
                      SizedBox(height: 35.h),
                      FilledButtomEdit(
                        text: "add".tr,
                        buttonColor: const Color(0xff1565C0),
                        size: 16,
                        textColor: Colors.white,
                        onClick: () {
                          if (addTaskController.formKey3.currentState!
                              .validate()) {
                            // Passwords are valid and match
                            // Perform further actions like saving the password
                            // controller.updateProfile();
                          }
                        },
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
