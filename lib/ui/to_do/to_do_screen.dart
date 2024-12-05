import 'package:experimenting_bloc_app/bloc/to_do/to_do_bloc.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_event.dart';
import 'package:experimenting_bloc_app/bloc/to_do/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (BuildContext context, ToDoState state) {
          if (state.toDoList.isEmpty) {
            return const Center(
              child: Text('No To Do Items'),
            );
          } else if (state.toDoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.toDoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.toDoList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<ToDoBloc>()
                            .add(DeleteToDoEvent(state.toDoList[index]));
                      },
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
