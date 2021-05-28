import 'package:notifyme/Database/database_creator.dart';
import 'package:notifyme/Models/ScheduledNotification.dart';

class RepositoryServiceNotification {
  static Future<List<ScheduledNotification>> getAllNotifications() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.notificationsTable}''';
    final data = await db.rawQuery(sql);
    List<ScheduledNotification> notifications = [];

    for (final node in data) {
      final todo = ScheduledNotification.fromJson(node);
      notifications.add(todo);
    }
    return notifications;
  }

  static Future<ScheduledNotification> getNotification(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.notificationsTable}
    WHERE ${DatabaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final todo = ScheduledNotification.fromJson(data.first);
    return todo;
  }

  static Future<void> addNotification(
      ScheduledNotification notification) async {
    final sql = '''INSERT INTO ${DatabaseCreator.notificationsTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.description},
      ${DatabaseCreator.notificationTime}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [
      notification.id,
      notification.description,
      notification.notificationTime
    ];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add notification', sql, null, result, params);
  }

  static Future<void> deleteNotification(
      ScheduledNotification notification) async {
    final sql = '''DELETE ${DatabaseCreator.notificationsTable}
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [notification.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog(
        'Delete notification', sql, null, result, params);
  }

  static Future<void> updateNotification(
      ScheduledNotification notification) async {
    final sql = '''UPDATE ${DatabaseCreator.notificationsTable}
    SET ${DatabaseCreator.description} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [notification.description, notification.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog(
        'Update notification', sql, null, result, params);
  }

  static Future<int> notificationsCount() async {
    final data = await db.rawQuery(
        '''SELECT COUNT(*) FROM ${DatabaseCreator.notificationsTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
