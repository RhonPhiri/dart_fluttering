import 'package:flutter/material.dart';
import 'package:prov_todo_app/models/todo.dart';

class TodoList with ChangeNotifier {
  List<Todo> _todoList = [];

  List<Todo> get todoList => List.unmodifiable(_todoList);

  void addTodo(String title) {
    _todoList.add(Todo(title: title));
    notifyListeners();
  }

  void removeTodo(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todoList[index].isComplete = !_todoList[index].isComplete;
    notifyListeners();
  }
}
