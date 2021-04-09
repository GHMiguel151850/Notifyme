import 'package:flutter/material.dart';
import 'package:notifyme/Models/ScheduledNotification.dart';
import 'package:notifyme/ui/Home.dart';

class NotifyMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotifyMe',
      home: Home(_getScheduleNotifications()),
    );
  }

  List<ScheduledNotification> _getScheduleNotifications() {
    var listToReturn = <ScheduledNotification>[];
    for (var i = 0; i < 2; i++) {
      listToReturn.add(ScheduledNotification('oi', DateTime.now()));
      listToReturn.add(ScheduledNotification('1', DateTime.now()));
      listToReturn.add(ScheduledNotification('2', DateTime.now()));
    }
    return listToReturn;
  }
}
