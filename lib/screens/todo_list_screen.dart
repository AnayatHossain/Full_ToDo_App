import 'package:crud_app/screens/add_new_todo_screen.dart';
import 'package:crud_app/models/todo.dart';
import 'package:crud_app/screens/update_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/models/todo_manager.dart'; // Import TodoManager

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoManger todoManager = TodoManger(); // Create a TodoManager instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Visibility(
        visible: todoManager.todoList.isNotEmpty, // Use todoManager.todoList
        replacement: const Center(
          child: Text("Empty List"),
        ),
        child: ListView.builder(
          itemCount: todoManager.todoList.length,
          itemBuilder: (context, index) {
            Todo todo = todoManager.todoList[index]; // Access todos via TodoManager
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              leading: Text(todo.status.name),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        todoManager.deleteTodo(index); // Call deleteTodo from TodoManager
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () => _showChangeStatusDialog(index),
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTodoScreen(
                      todo: todo,
                      onUpdateTodo: (Todo updatedTodo) {
                        setState(() {
                          todoManager.updateTodo(index, updatedTodo); // Call updateTodo
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewTodoScreen()),
          );
          if (todo != null) {
            setState(() {
              todoManager.addTodo(todo); // Call addTodo from TodoManager
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showChangeStatusDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Idle'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.idle);
                },
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: const Text('In Progress'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.inProgress);
                },
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: const Text('Done'),
                onTap: () {
                  _onTapUpdateStatusButton(index, TodoStatus.done);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTapUpdateStatusButton(int index, TodoStatus status) {
    setState(() {
      todoManager.updateTodoStatus(index, status); // Call updateTodoStatus
    });
    Navigator.pop(context);
  }
}
