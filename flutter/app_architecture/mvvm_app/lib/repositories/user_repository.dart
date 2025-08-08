import 'dart:math';

import 'package:mvvm_app/models/result.dart';
import 'package:mvvm_app/models/user.dart';

class UserRepository {
  Future<Result<User>> fetchuser() async {
    await Future.delayed(Duration(seconds: 2));

    if (Random().nextBool()) {
      return Success(User(name: 'Rhon Phiri', age: 22));
    } else {
      return Failure(Exception('Failed to fetch user'));
    }
  }
}
