import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/router/router_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Home Page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouterNames.profile);
            }, 
            child: Text("Go to Profile Page"),
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/child");
            }, 
            child: Text("Go to Child Page"),
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go("/user", 
              // extra: {
              //   "name" : "Kalana Heshan",
              //   "age" : 22,
              // },
              // );

              // String name = "Kalana from path parameters";
              // GoRouter.of(context).go("/user/$name");

              GoRouter.of(context).goNamed(
                RouterNames.user,
                pathParameters: {"name" : "Kalana frrom path parameters from named routers"}
              );

              
            }, 
            child: Text("Go to User Page"),
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(
                RouterNames.age,
                queryParameters: {"age" : "22"}
              );
            }, 
            child: Text("Go to Age Page"),
          ),

          SizedBox(
            height: 10,
          ),
          
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(RouterNames.back);
            }, 
            child: Text("Go to Back Page"),
          ),
        ],
      ),
    );
  }
}