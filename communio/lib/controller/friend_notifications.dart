import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void setupNotifications(String profileId) {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  final initializationSettingsAndroid =
      new AndroidInitializationSettings('icon');
  final initializationSettingsIOS = IOSInitializationSettings();
  final initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);

  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  addFriendsEventListener(profileId, flutterLocalNotificationsPlugin);
}

void addFriendsEventListener(String profileId,
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  final IO.Socket socket = IO.io(DotEnv().env['API_URL'], <String, dynamic>{
    'transports': ['websocket'],
    'extraHeaders': {'user_id': profileId}
  });

  socket.on('success', (_) {
    Logger().i('Sucessfully connected to Socket');
    socket.on('friend_request', (data) async {
      Logger().i(data);
      final androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name', 'your channel description',
          importance: Importance.Max,
          priority: Priority.High,
          ticker: 'ticker');
      final iOSPlatformChannelSpecifics = IOSNotificationDetails();
      final platformChannelSpecifics = NotificationDetails(
          androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(0, 'New Friend Request!',
          '$data wants to be your friend!', platformChannelSpecifics,
          payload: 'item x');
    });
  });
}
