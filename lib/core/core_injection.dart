import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void injectCoreDependencies(GetIt injection) {
  injection.registerLazySingleton<Dio>(() => Dio());

  injection.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
