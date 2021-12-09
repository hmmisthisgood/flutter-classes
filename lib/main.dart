import 'package:android_and_ios/bottom_nav_bar_widget.dart';
import 'package:android_and_ios/list.dart';
import 'package:android_and_ios/screen/splash_screen.dart';
import 'package:android_and_ios/text_field_widgets.dart';
import 'package:android_and_ios/utils/shared_pref.dart';
import 'package:android_and_ios/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';

import 'navigation/route_generator.dart';
import 'page_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: ourRouteGenerator,
      initialRoute: "/splash_screen",

      //  FutureBuilder<bool>(
      //     future: SharedPref.getHasUserLoggedIn(),
      //     builder: (context, loggedIn) {
      //       if (loggedIn.connectionState == ConnectionState.done) {
      //         if (loggedIn.data != null && loggedIn.data == true) {
      //           return ListLearning();
      //         }

      //         return LoginnScreen();
      //       }
      //       return LoginnScreen();
      //     })

      //  BottomNavBarWidget()
      //  TabViewWidget()

      //PageViewWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
//  Scaffold

    /// Container

    /// Row
    /// Column
    /// ListView
    ///
    /// Padding
    /// MaterialButton/FlatButton
    /// InkWell
    /// Image (network, file, asset )
    /// Icon
    /// Text

    /// ListView
    /// SingleChildScrollView
    /// Gridview

    /// Demonstartion of column
    return ListLearning();
  }
}
