import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:net_app/classes.dart';

Future<Album> createData({required String title}) async {
  final mapToJson = <String, String>{'title': title};
  final uri = 'https://jsonplaceholder.typicode.com/albums';
  final parsedUri = Uri.parse(uri);
  final response = await http.post(
    parsedUri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(mapToJson),
  );
  final statusCode = response.statusCode;
  if (statusCode != 201) {
    print(statusCode);
    throw Exception('Failed to create data!');
  }
  final jsonString = response.body;
  final jsonMap = jsonDecode(jsonString);
  return Album.fromJson(jsonMap);
}
