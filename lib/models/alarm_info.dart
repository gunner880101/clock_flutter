import 'dart:convert';

AlarmInfo alarmInfoFromJson(String str) => AlarmInfo.fromJson(json.decode(str));

String alarmInfoToJson(AlarmInfo data) => json.encode(data.toJson());

class AlarmInfo {
  AlarmInfo({
    this.id,
    this.note,
    this.active,
    this.dateTime,
  });

  int? id;
  String? note;
  int? active;
  DateTime? dateTime;

  factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        note: json["note"],
        active: json["active"],
        dateTime: DateTime.parse(json["dateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "active": active,
        "dateTime": dateTime!.toIso8601String(),
      };
}
