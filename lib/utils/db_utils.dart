import 'package:clock_flutter/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';

class AlarmManager {
  static Database? _database;
  static AlarmManager? _alarmManager;

  final String tableName = 'alarm';
  final String id = 'id';
  final String dateTime = 'dateTime';
  final String active = 'active';
  final String note = 'note';

  AlarmManager._createInstance();
  factory AlarmManager() {
    if (_alarmManager == null) {
      _alarmManager = AlarmManager._createInstance();
    }
    return _alarmManager!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarms.db";

    var db = openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        create table $tableName (
          $id integer primary key autoincrement,
          $dateTime text not null,
          $active integer,
          $note text)
      ''');
    });
    return db;
  }

  Future<void> addAlarm(AlarmInfo info) async {
    var db = await this.database;
    var result = await db?.insert(tableName, info.toJson());
    print('db insert result: $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];

    var db = await this.database;
    var result = await db!.query(tableName);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromJson(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }
}
