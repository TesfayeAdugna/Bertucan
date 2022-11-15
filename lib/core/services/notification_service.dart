import 'dart:developer';

import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as lNotification;
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService() {
    tz.initializeTimeZones();
    setup();
  }

  setup() async {
    tz.setLocalLocation(
        tz.getLocation(await FlutterNativeTimezone.getLocalTimezone()));

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  void selectNotification(String? payload) {
    Get.toNamed(getInitialRoute());
  }

  showNotification(String title, String desc) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await lNotification.FlutterLocalNotificationsPlugin()
        .show(0, title, desc, platformChannelSpecifics);
  }

  Future<void> scheduledNotification(
      String title, String desc, Duration showAfter, int id) async {
    log(tz.TZDateTime.now(tz.local).add(showAfter).toLocal().toString());
    if (tz.TZDateTime.now(tz.local).add(showAfter).isAfter(DateTime.now())) {
      await lNotification.FlutterLocalNotificationsPlugin().zonedSchedule(
          id,
          title,
          desc,
          tz.TZDateTime.now(tz.local).add(showAfter),
          NotificationDetails(
              android: AndroidNotificationDetails(
                  'your channel $id', 'your channel $id',
                  channelDescription: 'your channel description')),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }
}
