import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http; //the as http enables prefixing
//contents from this library with http

//Making asynchronous network requests

Future<void> main() async {
  try {
    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final parsedUrl = Uri.parse(url);

    final response = await http.get(parsedUrl);

    final statusCode = response.statusCode;
    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }

    final jsonString = response.body;
    final jsonMap = jsonDecode(jsonString);
    final todo = ToDo.fromJson(jsonMap);
    print(todo);
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }
}

//creating a class to hold the data from the server
class ToDo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  factory ToDo.fromJson(Map<String, dynamic> jsonMap) {
    return ToDo(
      userId: jsonMap['userId'] as int,
      id: jsonMap['id'] as int,
      title: jsonMap['title'] as String,
      completed: jsonMap['completed'] as bool,
    );
  }

  ToDo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  String toString() {
    return 'UserId: $userId\n'
        'Id: $id\n'
        'Title: $title\n'
        'Completed: $completed';
  }
}
