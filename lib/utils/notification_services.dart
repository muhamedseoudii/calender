import 'package:calender/features/controllers/notification_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        var payload = details.payload;
        var title = "No title";
        var description = "No description";

        if (payload != null) {
          var payloadParts = payload.split('|');
          if (payloadParts.length == 2) {
            title = payloadParts[0];
            description = payloadParts[1];
          }
        }

        Get.find<NotificationsController>().addNotification(
          title,
          description,
          DateTime.now(),
        );
      },
    );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  void showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    await notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  void showRepeatedNotification(
      {int id = 1,
      String? title,
      String? body,
      String? payLoad,
      RepeatInterval? repeatInterval}) async {
    await notificationsPlugin.periodicallyShow(
        id, title, body, repeatInterval!, await notificationDetails());
  }

  void showScheduleNotification(
      {required int id,
      String? title,
      String? body,
      required tz.TZDateTime scheduledDate,
      required NotificationDetails notificationDetails,
      String? payLoad}) async {
    tz.initializeTimeZones();
    await notificationsPlugin.zonedSchedule(
        id, title, body, scheduledDate, notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: "$title|$body",
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  void cancelAllNotification() async {
    await notificationsPlugin.cancelAll();
    Get.find<NotificationsController>().clearNotifications();
  }
}
// class NotifyHelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin(); //
//
//   initializeNotification() async {
//     // tz.initializeTimeZones();
//     // this is for latest iOS settings
//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//             requestSoundPermission: false,
//             requestBadgePermission: false,
//             requestAlertPermission: false,
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings("calendericon");
//
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       iOS: initializationSettingsIOS,
//       android: initializationSettingsAndroid,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }
//
//   void requestIOSPermissions() {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       debugPrint('notification payload: $payload');
//     } else {
//       debugPrint('notification payload done');
//     }
//     // Get.to(()=>SecondScreen(payload));
//   }
//
//   Future onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     // showDialog(
//     //   //context: context,
//     //   builder: (BuildContext context) => CupertinoAlertDialog(
//     //     title: Text(title),
//     //     content: Text(body),
//     //     actions: [
//     //       CupertinoDialogAction(
//     //         isDefaultAction: true,
//     //         child: Text('Ok'),
//     //         onPressed: () async {
//     //           Navigator.of(context, rootNavigator: true).pop();
//     //           await Navigator.push(
//     //             context,
//     //             MaterialPageRoute(
//     //               builder: (context) => SecondScreen(payload),
//     //             ),
//     //           );
//     //         },
//     //       )
//     //     ],
//     //   ),
//     // );
//     Get.dialog(const Text("welcome to flutter"));
//   }
// }
