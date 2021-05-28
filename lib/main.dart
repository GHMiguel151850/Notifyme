import 'package:flutter/material.dart';
import 'package:notifyme/Database/database_creator.dart';
import 'package:notifyme/NotifyMe.dart';
import 'package:notifyme/push_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseCreator().initDatabase();

  PushNotificationsManager().init();
  runApp(NotifyMe());
}
