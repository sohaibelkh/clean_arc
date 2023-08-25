import 'package:flutter/material.dart';
import 'package:json_place_holder/app_dependency_tree.dart';
import 'package:json_place_holder/todos/ui/screens/todo_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppDependencyTree();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListScreen(userId: 1),
    );
  }
}
