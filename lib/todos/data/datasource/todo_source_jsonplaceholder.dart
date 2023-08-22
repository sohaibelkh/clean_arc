import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:json_place_holder/todos/data/models/exceptions.dart';
import 'package:json_place_holder/todos/data/models/todo_model.dart';

abstract class TodoSourceJsonPlaceholder {
  Future<TodoModel> getTodoById({
    required int userId,
    required int id,
  });

  Future<List<TodoModel>> getAllTodos(int userId);
}

class TodoSourceJsonPlaceholderImpl implements TodoSourceJsonPlaceholder {
  final Dio dio;

  TodoSourceJsonPlaceholderImpl(this.dio);

  @override
  Future<List<TodoModel>> getAllTodos(int userId) async {
    final String url =
        "https://jsonplaceholder.typicode.com/todos?userId=$userId";
    final Response result = await dio.get(url,options: Options());
    if (result.statusCode == 200) {
      debugPrint("DEBUG: data=${result.data}, result=$result, ");
      final List<TodoModel> todos = [];
      for (dynamic item in result.data!) {
        final Map<String,dynamic> itemTodo = item as Map<String,dynamic>;
        todos.add(TodoModel.fromMap(itemTodo));
      }
      return todos;
    } else {
      const TodoException exception = TodoException("Todo list is empty");
      debugPrint("TodoSourceJsonPlaceholder getAllTodos exception=$exception");
      throw exception;
    }
  }

  @override
  Future<TodoModel> getTodoById({required int userId, required int id}) async {
    final String url =
        "https://jsonplaceholder.typicode.com/todos?id=$id&userId=$userId";
    final Response<dynamic> result = await dio.get(url);
    if (result.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(result.data);
      return TodoModel.fromMap(data);
    } else {
      const TodoException exception = TodoException("Todo not found");
      debugPrint("TodoSourceJsonPlaceholder getTodoById exception=$exception");
      throw exception;
    }
  }
}
