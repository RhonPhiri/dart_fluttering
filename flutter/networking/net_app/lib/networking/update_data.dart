import 'dart:convert';

import '../classes.dart';
import 'package:http/http.dart' as http;

Future<Album> updateAlbum(String title) async {
  final uri = 'https://jsonplaceholder.typicode.com/albums/1';
  final parsedUri = Uri.parse(uri);
  final response = await http.put(parsedUri,
      headers: <String, String>{
        'Content-Type': 'application/json; Charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{'title': title}));

  final statuscode = response.statusCode;
  if (statuscode != 200) {
    throw Exception('Failed to update the album!');
  }

  final jsonString = response.body;
  final jsonMap = jsonDecode(jsonString);
  return Album.fromJson(jsonMap);
}

//after updating, the dat will be fetched using the fetchAlbum method
