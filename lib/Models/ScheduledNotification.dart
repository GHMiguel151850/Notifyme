import 'package:notifyme/Database/database_creator.dart';

class ScheduledNotification {
  int id = -1;
  String description = "";
  DateTime notificationTime = DateTime.now();

  ScheduledNotification(this.description, this.notificationTime);

  ScheduledNotification.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.description = json[DatabaseCreator.description];
    this.notificationTime =
        DateTime.parse(json[DatabaseCreator.notificationTime]);
  }

  // Map<String, Object?> toMap() {
  //   var map = <String, Object?>{
  //     'description': description,
  //     'notificationTime': notificationTime
  //   };
  //   if (id != null) {
  //     map['id'] = id;
  //   }
  //   return map;
  // }

  // ScheduledNotification.fromMap(Map<String, Object?> map) {
  //   id = map["id"] as int;
  //   description = map["description"] as String;
  //   notificationTime = map["notificationTime"] as DateTime;
  // }
}

// class ScheduledNotificationProvider {
//   Database? db;
//
//   Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
//         create table notifications (
//           id integer primary key autoincrement,
//           description text not null,
//           notificationTime text not null)
//           ''');
//     });
//   }
//
//   Future<ScheduledNotification> insert(
//       ScheduledNotification notification) async {
//     notification.id = await db!.insert('notification', notification.toMap());
//     return notification;
//   }
//
//   static Future<List<ScheduledNotification>> getAllNotifications() async {
//     final sql = '''SELECT * FROM notifications''';
//     final data = await db!.rawQuery(sql);
//     List<ScheduledNotification> notifications = List();
//
//     for (final node in data) {
//       final todo = Todo.fromJson(node);
//       todos.add(todo);
//     }
//     return todos;
//   }
//
//   Future<ScheduledNotification> getTodo(int id) async {
//     List<Map> maps = await db!.query('notification',
//         columns: ['id', 'description', 'notificationTime'],
//         where: 'id = ?',
//         whereArgs: [id]);
//     if (maps.length > 0) {
//       return ScheduledNotification.fromMap(maps.first);
//     }
//     return null;
//   }
//
//   Future<int> delete(int id) async {
//     return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
//   }
//
//   Future<int> update(Todo todo) async {
//     return await db.update(tableTodo, todo.toMap(),
//         where: '$columnId = ?', whereArgs: [todo.id]);
//   }
//
//   Future close() async => db!.close();
// }
