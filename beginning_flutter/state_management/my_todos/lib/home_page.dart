import 'package:flutter/material.dart';
import 'package:my_todos/filter_button.dart';
import 'package:my_todos/todo_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoList = [];

  //used this property below for the chips
  String _chipTapped = Filters.all.label;

//
  List<Todo> allTodos = [
    Todo(title: 'Buy soildering wire', status: true),
    Todo(title: 'Wash clothes', status: false),
    Todo(title: 'Learn Provider', status: false),
    Todo(title: 'Write Genesis letter', status: false),
  ];
  //method to update the list of done todos
  List<Todo> doneTodos() {
    List<Todo> doneTodos = [];
    for (var i = 0; i < allTodos.length; i++) {
      if (allTodos[i].status == true) {
        doneTodos.add(
          allTodos[i],
        );
      }
    }
    return doneTodos;
  } //method to update the list of done todos

  List<Todo> notDoneTodos() {
    List<Todo> notDoneTodos = [];
    for (var i = 0; i < allTodos.length; i++) {
      if (allTodos[i].status == false) {
        notDoneTodos.add(
          allTodos[i],
        );
      }
    }
    return notDoneTodos;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('M Y  T O D O S'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Filters.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _chipTapped = Filters.values[index].label;
                          doneTodos();
                          notDoneTodos();
                          todoList = _chipTapped == Filters.all.label
                              ? allTodos
                              : _chipTapped == Filters.done.label
                                  ? doneTodos()
                                  : notDoneTodos();
                        });
                      },
                      child: Chip(
                        backgroundColor:
                            Filters.values[index].label == _chipTapped
                                ? Colors.grey
                                : Colors.grey.shade100,
                        label: Text(Filters.values[index].label),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: const Material(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ),
                    key: ValueKey(todoList[index].title),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          todoList[index].title,
                          style: TextStyle(
                            decoration: todoList[index].status
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        trailing: Checkbox(
                          value: todoList[index].status,
                          onChanged: (value) {
                            setState(() {
                              todoList[index].status = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        todoList.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              'A todo was deleted successfully',
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
