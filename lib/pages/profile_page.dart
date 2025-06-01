import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/router/router_names.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Profile Page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouterNames.home);
            }, 
            child: Text("Go to Home Page"),
          ),
        ],
      ),
    );
  }
}