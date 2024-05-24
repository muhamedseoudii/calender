import 'package:hive/hive.dart';

part 'task_hive_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  String date;

  @HiveField(2)
  String description;

  @HiveField(3)
  String clock;

  @HiveField(4)
  String notification;

  @HiveField(5)
  String type;

  TaskModel({
    required this.taskName,
    required this.date,
    required this.description,
    required this.clock,
    required this.notification,
    required this.type,
  });
}
