import 'package:get/get.dart';

class NotificationModel {
  final String title;
  final String description;
  final DateTime date;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
  });
}

class NotificationsController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  void addNotification(String title, String description, DateTime date) {
    notifications.add(
        NotificationModel(title: title, description: description, date: date));
  }

  void clearNotifications() {
    notifications.clear();
  }
}
