import 'package:blocstatemanagement/bloc/todo_bloc/todo_bloc.dart';
import 'package:blocstatemanagement/bloc/todo_bloc/todo_event.dart';
import 'package:blocstatemanagement/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
        if (state.todoList.isEmpty) {
          return Center(child: Text('No todo found'));
        } else {
          return ListView.builder(
              itemCount: state.todoList.length, // Use the length of the list
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]), // Display the actual task
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<ToDoBloc>()
                          .add(RemoveToDoEvent(task: state.todoList[index]));
                    },
                  ),
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context
                .read<ToDoBloc>()
                .add(AddToDoEvent(task: 'task' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
