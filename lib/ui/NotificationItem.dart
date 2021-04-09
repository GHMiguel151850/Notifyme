import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notifyme/Models/ScheduledNotification.dart';

class NotificationItem extends StatefulWidget {
  final ScheduledNotification scheduledNotification;

  const NotificationItem(this.scheduledNotification);

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
        padding: EdgeInsets.all(3),
        //height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: Colors.blueGrey.shade100, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.scheduledNotification.description,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm').format(widget
                        .scheduledNotification.notificationTime
                        .toLocal()),
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 5), child: Icon(Icons.delete))
          ],
        ));
  }
}
