import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:net_app/classes.dart';

Future<Album> fetchAlbum() async {
  final uri = 'https://jsonplaceholder.typicode.com/albums/2';
  final parsedUri = Uri.parse(uri);
  final response = await http.get(parsedUri);

  final statusCode = response.statusCode;
  if (statusCode != 200) {
    throw Exception('Failed to fetch data from the uri provided!');
  }
  final jsonString = response.body;
  final jsonMap = jsonDecode(jsonString);
  return Album.fromJson(jsonMap);
}
