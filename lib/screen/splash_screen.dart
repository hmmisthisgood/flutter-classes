import 'package:android_and_ios/utils/shared_pref.dart';
import 'package:flutter/material.dart';

import '../list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUsersLoggedInStatusAndNavigate();
  }

  /// fetch the user's loggd in status from Shared Preferences
  /// and navigate tot the correct page
  getUsersLoggedInStatusAndNavigate() async {
    final isLoggedIn = await SharedPref.getHasUserLoggedIn();

    if (isLoggedIn) {
      //
      // There are two types of routes that we know:
      // 1. MaterialPageRoute
      // 2. CupertinoPageRoute
      await Future.delayed(Duration(seconds: 2), () {
        //  navigation without named routes
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (ctx) => ListLearning(someData: "90")));

        Navigator.pushNamed(context, "/listing_screen");
      });
    } else {
      await Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/login_screen");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.ad_units,
          size: 40,
          color: Colors.purple,

          
        ),
      ),
    );
  }
}
