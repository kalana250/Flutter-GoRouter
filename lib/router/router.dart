import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/data/user_data.dart';
import 'package:gorouter/pages/age_page.dart';
import 'package:gorouter/pages/back.dart';
import 'package:gorouter/pages/child_page.dart';
import 'package:gorouter/pages/home_page.dart';
import 'package:gorouter/pages/login.dart';
import 'package:gorouter/pages/profile_page.dart';
import 'package:gorouter/pages/user.dart';
import 'package:gorouter/router/router_names.dart';

class RouterClass {

  final router = GoRouter(

    initialLocation: "/",
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text("This Page is Not Found!!!"),
        ),
      );
    },

    //redirect to login page if user is not logged in
    // redirect: (context, state) {
    //   bool isUserLodgedIn = UserData.isUserLodgedIn;
    //   if(isUserLodgedIn) {
    //     return "/";
    //   }else{
    //     return "/login";
    //   }
    // },

    routes: [

      //home page
      GoRoute(
        path: "/",
        name:   RouterNames.home,
        builder: (context, state) {
          return HomePage();
        },
      ),

      //profile page
      GoRoute(
        path: "/profile",
        name: RouterNames.profile,
        builder: (context, state) {
          return ProfilePage();
        },

        //route > /profile/child
        routes: [
          GoRoute(
            path: "child",
            name: "child",
            builder: (context, state) {
              return ChildPage();
            },
            )
        ]
      ),

      //user page extra parameters
      // GoRoute(
      //   path: "/user",
      //   name: "user",
      //   builder: (context, state) {

      //     final name = (state.extra as Map <String, dynamic> )['name'] as String;

      //     return UserPage(userName: name);
      //   },
      // )

      //user page path parameters
      GoRoute(
        path: "/user/:name",
        name: RouterNames.user,
        builder: (context, state) {
          return UserPage(userName: state.pathParameters["name"]!);
        },
      ),

      //age page > Query parameters
      GoRoute(
        path: "/age",
        name: RouterNames.age,
        builder: (context, state) {
          final int age = state.uri.queryParameters["age"] == null ? 0 : int.parse(state.uri.queryParameters["age"]! ) ;
          return AgePage(age: age);
        },
      ),

      //login page
      GoRoute(
        path: "/login",
        name: RouterNames.login,
        builder: (context, state) {
          return LoginPage();
        },
      ),

      //back page
      GoRoute(
        path: "/back",
        name: RouterNames.back,
        builder: (context, state) {
          return BackPage();
        },
      ),

    ],
  );

}