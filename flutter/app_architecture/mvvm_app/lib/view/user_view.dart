import 'package:flutter/material.dart';
import 'package:mvvm_app/viewmodels/user_view_model.dart';

class UserView extends StatelessWidget {
  final UserViewModel userViewModel;
  const UserView({super.key, required this.userViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profile")),
      body: AnimatedBuilder(
        animation: userViewModel,
        builder: (context, child) {
          if (userViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (userViewModel.errorMessage != null) {
            return Center(child: Text('Error: ${userViewModel.errorMessage}'));
          } else if (userViewModel.user != null) {
            return Center(
              child: Text(
                'Hello, ${userViewModel.user?.name} aged ${userViewModel.user?.age}',
              ),
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userViewModel.getUser();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
