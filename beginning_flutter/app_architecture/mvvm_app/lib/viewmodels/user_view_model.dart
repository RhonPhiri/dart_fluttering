import 'package:flutter/widgets.dart';
import 'package:mvvm_app/models/result.dart';
import 'package:mvvm_app/models/user.dart';
import 'package:mvvm_app/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  User? user;
  String? errorMessage;
  bool isLoading = false;

  UserViewModel(this._userRepository);

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();
    final result = await _userRepository.fetchuser();
    if (result is Success<User>) {
      user = result.data;
      errorMessage = null;
    } else if (result is Failure<User>) {
      errorMessage = result.error.toString();
      user = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
