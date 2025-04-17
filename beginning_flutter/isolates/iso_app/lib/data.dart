import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> jsonMap) {
    return switch (jsonMap) {
      {
        'albumId': int albumId,
        'id': int id,
        'title': String title,
        'url': String url,
        'thumbnailUrl': String thumbnailUrl,
      } =>
        Photo(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        ),
      _ => throw const FormatException('Unexpected Json Format'),
    };
  }
}

//prepare a function to return a list of photos
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final uri = 'https://jsonplaceholder.typicode.com/photos';
  final parsedUri = Uri.parse(uri);
  final response = await client.get(parsedUri);
  final statusCode = response.statusCode;
  if (statusCode != 200) {
    throw Exception('Failed to access the photos');
  }
  final jsonString = response.body;
  return compute(parsedImages, jsonString);
}

List<Photo> parsedImages(String jsonString) {
  final jsonList =
      (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();
  return jsonList.map((jsonMap) => Photo.fromJson(jsonMap)).toList();
}
