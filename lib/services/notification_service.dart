
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  displayNotification(String title, String body) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 33,
            channelKey: 'basic_channel',
            title: title,
            body:  body));
  }
}
