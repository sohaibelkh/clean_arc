import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_place_holder/app_dependency_tree.dart';
import 'package:json_place_holder/todos/ui/state/todo_list/todo_list_cubit.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({required this.userId, super.key});
  final int userId;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late final TodoListCubit _cubit = injection<TodoListCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
      await _cubit.loadAllTodos(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoListCubit, TodoListState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is TodoListStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoListStateSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].title),
                  trailing: Checkbox(
                    value: state.todos[index].completed,
                    onChanged: (value) {},
                  ),
                );
              },
            );
          } else if (state is TodoListStateFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
