import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';
import 'package:json_place_holder/todos/domain/usecases/get_todo_by_id.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.useCaseGetTodoById) : super(TodoStateInitial());

  final UseCaseGetTodoById useCaseGetTodoById;

  Future<void> loadTodoById({
    required int userId,
    required int id,
  }) async {
    emit(TodoStateLoading());
    final Either<String, Todo> result =
        await useCaseGetTodoById.execute(userId: userId, id: id);
    result.fold(
      (String failure) => emit(TodoStateFailure(failure)),
      (Todo todo) => emit(TodoStateSuccess(todo)),
    );
  }
}
