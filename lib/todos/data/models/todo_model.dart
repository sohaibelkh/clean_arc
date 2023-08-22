import 'package:json_place_holder/todos/data/models/constants.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.completed,
  });

  factory TodoModel.fromMap(Map<String, dynamic> data) {
    final String title = data[Constants.title].toString();
    final int id = num.parse(data[Constants.id].toString()).toInt();
    final int userId = num.parse(data[Constants.userId].toString()).toInt();
    final bool completed = data[Constants.completed] as bool;
    return TodoModel(
      id: id,
      userId: userId,
      title: title,
      completed: completed,
    );
  }
}
