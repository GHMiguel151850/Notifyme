import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notifyme/Database/repository.dart';
import 'package:notifyme/Models/ScheduledNotification.dart';
import 'package:notifyme/ui/LoginDrawer.dart';
import 'package:notifyme/ui/NotificationList.dart';

class Home extends StatefulWidget {
  List<ScheduledNotification> notificationList;

  Home(this.notificationList);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NotifyMe'),
        ),
        drawer: LoginDrawer(),
        body: NotificationList(widget.notificationList),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _AddNotification(),
          child: Icon(Icons.add),
        ));
  }

  void _AddNotification() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Notification'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Notification Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.dateTime,
                    dateMask: 'EEEE - hh:mm',
                    initialValue: '',
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Notification time',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              TextButton(onPressed: () {}, child: Text('Save')),
            ],
          );
        });
    setState(() {
      var newNotification =
          new ScheduledNotification('ADICIONEI', DateTime.now());
      RepositoryServiceNotification.addNotification(newNotification);
      widget.notificationList.add(newNotification);
    });
  }

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    super.initState();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() {
        widget.notificationList.add(new ScheduledNotification(
            message["notification"]["body"], DateTime.now()));
      });
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() {
        widget.notificationList.add(new ScheduledNotification(
            message["notification"]["body"], DateTime.now()));
      });
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() {
        widget.notificationList.add(new ScheduledNotification(
            message["notification"]["body"], DateTime.now()));
      });
    });
  }
}
