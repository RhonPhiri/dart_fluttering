import 'dart:convert';

import 'package:http/http.dart' as http;
// The following link returns a JSON list of comments:
// https://jsonplaceholder.typicode.com/comments
// Create a Comment data class and convert the raw JSON to a Dart list of type List<Comment>

class Comment {
  factory Comment.fromJson(Map<String, dynamic> jsonMap) {
    return Comment(
      postId: jsonMap['postId'] as int,
      id: jsonMap['id'] as int,
      name: jsonMap['name'] as String,
      email: jsonMap['email'] as String,
      body: jsonMap['body'] as String,
    );
  }
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  String toString() {
    return 'postId: $postId, id: $id, name: $name, email: $email, body: $body';
  }
}

Future<void> main() async {
  final uri = 'https://jsonplaceholder.typicode.com/comments';
  final parsedUri = Uri.parse(uri);

  final response = await http.get(parsedUri);
  final statusCode = response.statusCode;
  if (statusCode != 200) {
    throw ArgumentError('An error occured!');
  }
  List<Comment> comments = [];
  final jsonString = response.body;
  final jsonMapList = jsonDecode(jsonString);
  for (var jsonMap in jsonMapList) {
    final comment = Comment.fromJson(jsonMap);
    comments.add(comment);
  }
  print(comments[1]);
}
