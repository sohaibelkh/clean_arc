import 'package:dartz/dartz.dart';
import 'package:json_place_holder/core/domain/entities/failures.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> getTodoById({
    required int userId,
    required int id,
  });

  Future<Either<Failure, List<Todo>>> getAllTodos(int userId);
}
