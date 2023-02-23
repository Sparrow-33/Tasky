// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';
//
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
 displayNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 33,
        channelKey: 'basic_channel',
        title: 'Notification test',
        body: 'IT WORKED')
        );
 }

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   initializeNotification() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('appicon');
//
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings
//         ,onSelectNotification: selectNotification
//         );
//   }
//
//    Future selectNotification(String? payload) async {
//     if (payload != null) {
//       print('notification payload: $payload');
//     } else {
//       print("No plaload");
//     }
//
//       if(payload=="Theme Changed"){
//       }else{
//        Get.to(()=>Container( color: Colors.white,));
//       }
//   }
//
//   Future onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//
//     Get.dialog(Text("Welcome to flutter"));
//   }
//
//   displayNotification({required String title, required String body}) async {
//     print("doing test");
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'your channel id', 'your channel name', 'your channel description',
//         importance: Importance.max, priority: Priority.high,
//         icon: 'appicon'
//     );
//     var platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'You change your theme',
//       'You changed your theme back !',
//       platformChannelSpecifics,
//       payload: 'It could be anything you pass',
//     );
//   }
}
