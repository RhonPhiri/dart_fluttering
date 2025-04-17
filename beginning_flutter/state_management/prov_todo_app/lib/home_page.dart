import 'package:flutter/material.dart';
import 'package:prov_todo_app/components/todo_alert_dialog.dart';
import 'package:prov_todo_app/models/todo_list.dart';
import 'package:prov_todo_app/models/todo_theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoList>().todoList;
    final todoTheme = context.read<TodoTheme>();
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('T O D O'),
        actions: [
          IconButton(
            onPressed: todoTheme.toggleThemeSwitch,
            icon: Icon(
              todoTheme.isDark ? Icons.dark_mode : Icons.wb_sunny,
            ),
          ),
        ],
      ),
      body: todoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.checklist_rounded,
                      size: 150,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: 'Your ',
                      style: TextStyle(fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Todos',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(text: ' will appear here!'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isComplete,
                      onChanged: (value) {
                        context.read<TodoList>().toggleTodoStatus(index);
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<TodoList>().removeTodo(index);
                      },
                      icon: Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add a new todo',
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return TodoAlertDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
