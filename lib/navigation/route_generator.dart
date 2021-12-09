import 'package:android_and_ios/list.dart';
import 'package:android_and_ios/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route ourRouteGenerator(RouteSettings setting) {
  switch (setting.name) {
    case "/splash_screen":
      return MaterialPageRoute(builder: (context) => SplashScreen());

    case "/listing_screen":
      return MaterialPageRoute(builder: (context) => ListLearning());
    
    
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
