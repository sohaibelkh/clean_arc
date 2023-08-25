
import 'package:get_it/get_it.dart';
import 'package:json_place_holder/core/core_injection.dart';
import 'package:json_place_holder/todos/todos_injection.dart';

final GetIt injection = GetIt.instance;


void initAppDependencyTree(){
  injectCoreDependencies(injection);
  injectTodosDependencies(injection);
}