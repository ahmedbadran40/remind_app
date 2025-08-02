import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 0)
class ReminderModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime dateTime;

  @HiveField(2)
  final String category;

  ReminderModel({
    required this.title,
    required this.dateTime,
    required this.category,
  });
}
