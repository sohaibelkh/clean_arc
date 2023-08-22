part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

final class TodoStateInitial extends TodoState {}

final class TodoStateLoading extends TodoState {}

final class TodoStateSuccess extends TodoState {
  final Todo todo;

  const TodoStateSuccess(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  bool? get stringify => true;
}

final class TodoStateFailure extends TodoState {
  final String message;

  const TodoStateFailure(this.message);

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [message];
}
