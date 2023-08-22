import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_place_holder/todos/domain/entities/todo.dart';
import 'package:json_place_holder/todos/domain/usecases/get_all_todos.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit(this.useCaseGetAllTodos) : super(TodoListStateInitial());
  final UseCaseGetAllTodos useCaseGetAllTodos;

  Future<void> loadAllTodos(int userId) async {
    emit(TodoListStateLoading());
    final Either<String, List<Todo>> result =
        await useCaseGetAllTodos.execute(userId);
    result.fold(
      (String failure) => emit(TodoListStateFailure(failure)),
      (List<Todo> todos) => emit(TodoListStateSuccess(todos)),
    );
  }
}
