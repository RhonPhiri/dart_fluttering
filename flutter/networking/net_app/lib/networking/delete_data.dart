import 'package:http/http.dart' as http;
import '../classes.dart';

Future<Album> deleteAlbum(int id) async {
  final uri = 'https://jsonplaceholder.typicode.com/albums/$id';
  final parsedUri = Uri.parse(uri);
  final response = await http.delete(parsedUri, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  final statuscode = response.statusCode;
  if (statuscode == 200) {
    return Album.empty();
  } else {
    throw Exception('Unable to delete album');
  }
}
