class Album {
  int? id;
  String? title;

  Album({
    required this.id,
    required this.title,
  });

  Album.empty();

  //using pattern matching to pparse the received json
  factory Album.fromJson(Map<String, dynamic> jsonMap) {
    return switch (jsonMap) {
      {
        'id': int id,
        'title': String title,
      } =>
        Album(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('unexpcted json format!'),
    };
  }
}
