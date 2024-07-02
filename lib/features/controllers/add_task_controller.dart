import 'package:calender/utils/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import '../models/task_hive_model.dart';

class AddTaskController extends GetxController {
  final formKey3 = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController clockController = TextEditingController();

  DropListModel dropListNotification = DropListModel([
    OptionItem(id: "0", title: "None".tr),
    OptionItem(id: "1", title: "1 hour before".tr),
    OptionItem(id: "2", title: "2 hours before".tr),
    OptionItem(id: "3", title: "3 hours before".tr),
    OptionItem(id: "4", title: "10 minutes before".tr),
    OptionItem(id: "5", title: "15 minutes before".tr),
  ]);
  var optionItemSelectedNotification = OptionItem(title: "select time".tr).obs;
  var contentTypeNotification = ''.obs;

  DropListModel dropListType = DropListModel([
    OptionItem(id: "1", title: "licence".tr),
    OptionItem(id: "2", title: "leasing".tr),
  ]);

  var optionItemSelectedType = OptionItem(title: "select type".tr).obs;
  var contentTypeOfType = ''.obs;

  void addTask() {
    if (formKey3.currentState?.validate() ?? false) {
      final taskBox = Hive.box<TaskModel>('tasks');
      final newTask = TaskModel(
        taskName: taskNameController.text,
        date: dateController.text,
        description: descController.text,
        clock: clockController.text,
        notification: optionItemSelectedNotification.value.title,
        type: optionItemSelectedType.value.title,
      );
      taskBox.add(newTask);
      _scheduleNotification(newTask);
      Get.back();
      Get.snackbar(
        'successful'.tr,
        "your task has been added successfully".tr,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void _scheduleNotification(TaskModel task) async {
    final DateTime taskDate = DateFormat.yMMMd().parse(task.date);
    final DateTime taskTime = DateFormat('hh:mm a').parse(task.clock);
    final DateTime combinedDateTime = DateTime(taskDate.year, taskDate.month,
        taskDate.day, taskTime.hour, taskTime.minute);

    // final tz.TZDateTime scheduledDateTime =
    //     tz.TZDateTime.from(combinedDateTime, tz.local);

    final int notificationId =
        task.hashCode; // Use task's hashCode as unique id

    // Calculate notification time based on user selection
    Duration notificationOffset = Duration.zero;
    switch (optionItemSelectedNotification.value.id) {
      case "1":
        notificationOffset = const Duration(hours: 1);
        break;
      case "2":
        notificationOffset = const Duration(hours: 2);
        break;
      case "3":
        notificationOffset = const Duration(hours: 3);
        break;
      case "4":
        notificationOffset = const Duration(minutes: 10);
        break;
      case "5":
        notificationOffset = const Duration(minutes: 15);
        break;
      case "0":
      default:
        notificationOffset = Duration.zero; // No delay
        break;
    }

    final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(
        combinedDateTime.subtract(notificationOffset), tz.local);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    LocalNotificationService().showScheduleNotification(
      id: notificationId,
      title: task.taskName,
      body: task.description,
      scheduledDate: scheduledDateTime,
      notificationDetails: platformChannelSpecifics,
    );
  }
}

// notificationId, task.taskName,
// task.description, scheduledDateTime, platformChannelSpecifics,
// androidAllowWhileIdle: true,
// uiLocalNotificationDateInterpretation:
// UILocalNotificationDateInterpretation.absoluteTime,
// matchDateTimeComponents: DateTimeComponents.time
