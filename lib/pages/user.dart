import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {

  final String userName;

  const UserPage({
    super.key,
    required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User name is $userName"),
          ],
        ),
      ),
    );
  }
}