import 'package:flutter/material.dart';
import 'package:prov_todo_app/models/todo_list.dart';
import 'package:provider/provider.dart';

class TodoAlertDialog extends StatefulWidget {
  const TodoAlertDialog({super.key});

  @override
  State<TodoAlertDialog> createState() => _TodoAlertDialogState();
}

class _TodoAlertDialogState extends State<TodoAlertDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

//method to handle whether to create a todo or not
  void _addTodo() {
    final todoTitle = _textController.text;
    if (todoTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Add a Todo title first!'),
        ),
      );
    } else {
      context.read<TodoList>().addTodo(_textController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Todo created Successfully!'),
        ),
      );
      _textController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Todo'),
      content: TextField(
        controller: _textController,
        maxLength: 70,
        decoration: InputDecoration(
          hintText: 'Todo title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: _addTodo,
          child: Text('Create'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
