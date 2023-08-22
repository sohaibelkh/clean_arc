import 'package:dartz/dartz.dart';
import 'package:json_place_holder/core/domain/entities/failures.dart';
import 'package:json_place_holder/todos/domain/entities/failures.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';
import 'package:json_place_holder/todos/domain/repository/todo_repository.dart';

class UseCaseGetTodoById {
  final TodoRepository repository;

  UseCaseGetTodoById(this.repository);

  Future<Either<String, Todo>> execute({
    required int userId,
    required int id,
  }) async {
    final Either<Failure, Todo> result = await repository.getTodoById(
      userId: userId,
      id: id,
    );
    return result.bimap(
      (Failure failure) {
        if (failure is InternetFailure) {
          return "Internet failure";
        } else if (failure is TodoFailure) {
          return failure.message;
        } else {
          return "Unknown failure, please try again later";
        }
      },
      (Todo todo) => todo,
    );
  }
}
