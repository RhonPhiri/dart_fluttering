import 'package:flutter/material.dart';
import 'package:mvvm_app/repositories/user_repository.dart';
import 'package:mvvm_app/view/user_view.dart';
import 'package:mvvm_app/viewmodels/user_view_model.dart';

void main() {
  final userrepository = UserRepository();
  final userViewModel = UserViewModel(userrepository);
  runApp(MyApp(userViewModel: userViewModel));
}

class MyApp extends StatelessWidget {
  final UserViewModel userViewModel;

  const MyApp({super.key, required this.userViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserView(userViewModel: userViewModel));
  }
}
