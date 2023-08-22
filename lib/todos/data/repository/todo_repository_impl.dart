import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:json_place_holder/core/domain/entities/failures.dart';
import 'package:json_place_holder/todos/data/datasource/todo_source_jsonplaceholder.dart';
import 'package:json_place_holder/todos/data/models/exceptions.dart';
import 'package:json_place_holder/todos/data/models/todo_model.dart';
import 'package:json_place_holder/todos/domain/entities/failures.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';
import 'package:json_place_holder/todos/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoSourceJsonPlaceholder sourceJsonPlaceholder;
  final InternetConnectionChecker internetConnectionChecker;

  TodoRepositoryImpl({
    required this.sourceJsonPlaceholder,
    required this.internetConnectionChecker,
  });
  @override
  Future<Either<Failure, List<Todo>>> getAllTodos(int userId) async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final List<TodoModel> result =
            await sourceJsonPlaceholder.getAllTodos(userId);
        return right(result);
      } on TodoException catch (ex) {
        return left(TodoFailure(ex.message));
      }
    } else {
      return left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> getTodoById({
    required int userId,
    required int id,
  }) async {
    final bool connected = await internetConnectionChecker.hasConnection;
    if (connected) {
      try {
        final TodoModel result =
            await sourceJsonPlaceholder.getTodoById(userId: userId, id: id);
        return right(result);
      } on TodoException catch (ex) {
        return left(TodoFailure(ex.message));
      }
    } else {
      return left(InternetFailure());
    }
  }
}
