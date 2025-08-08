import 'package:respo_app/data/models/name.dart';

class User {
  final Name name;
  final String avatarUrl;
  final DateTime lastActive;

  const User({
    required this.name,
    required this.avatarUrl,
    required this.lastActive,
  });
}
