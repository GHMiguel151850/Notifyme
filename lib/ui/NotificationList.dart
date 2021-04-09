import 'package:flutter/material.dart';
import 'package:notifyme/Models/ScheduledNotification.dart';
import 'package:notifyme/ui/NotificationItem.dart';

class NotificationList extends StatefulWidget {
  List<ScheduledNotification> _notifications;

  NotificationList(this._notifications);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget._notifications.length,
        itemBuilder: (_, index) =>
            NotificationItem(widget._notifications[index]),
      ),
    );
  }
}
