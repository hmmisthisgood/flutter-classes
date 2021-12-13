import 'package:android_and_ios/list.dart';
import 'package:android_and_ios/screen/splash_screen.dart';
import 'package:android_and_ios/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route ourRouteGenerator(RouteSettings setting) {
  // setting.arguments

  switch (setting.name) {
    case "/splash_screen":
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case "/listing_screen":
      return MaterialPageRoute(
          builder: (context) => ListLearning(someData: ""));
    case "/login_screen":
      return MaterialPageRoute(builder: (_) => LoginnScreen());
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
