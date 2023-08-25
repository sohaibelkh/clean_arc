import 'package:get_it/get_it.dart';
import 'package:json_place_holder/todos/data/datasource/todo_source_jsonplaceholder.dart';
import 'package:json_place_holder/todos/data/repository/todo_repository_impl.dart';
import 'package:json_place_holder/todos/domain/repository/todo_repository.dart';
import 'package:json_place_holder/todos/domain/usecases/get_all_todos.dart';
import 'package:json_place_holder/todos/ui/state/todo/todo_cubit.dart';

void injectTodosDependencies(GetIt injection) {
  injection.registerFactory<TodoCubit>(
    () => TodoCubit(injection()),
  );

  injection.registerLazySingleton<UseCaseGetAllTodos>(
    () => UseCaseGetAllTodos(injection()),
  );

  injection.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(
        sourceJsonPlaceholder: injection(),
        internetConnectionChecker: injection(),
      ));

  injection.registerLazySingleton<TodoSourceJsonPlaceholder>(
    () => TodoSourceJsonPlaceholderImpl(injection()),
  );
}
