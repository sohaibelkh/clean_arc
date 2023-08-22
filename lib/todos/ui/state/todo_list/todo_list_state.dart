part of 'todo_list_cubit.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class TodoListStateInitial extends TodoListState {}

final class TodoListStateLoading extends TodoListState {}

final class TodoListStateSuccess extends TodoListState {
  final List<Todo> todos;

  const TodoListStateSuccess(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  bool? get stringify => true;
}

final class TodoListStateFailure extends TodoListState {
  final String message;

  const TodoListStateFailure(this.message);

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [message];
}
