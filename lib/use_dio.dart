import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UsingDio extends StatefulWidget {
  const UsingDio({Key? key}) : super(key: key);

  @override
  _UsingDioState createState() => _UsingDioState();
}

class _UsingDioState extends State<UsingDio> {
  String dataToBeDisplayed = "Fetching data from server";

  postRequestToTheServer() {
    Dio().post("https://jsonplaceholder.typicode.com/posts",
        data: {"email": "test@test.com", "password": "password"});
  }

  fetchPostsDataFromServer() async {
    print("starting data fetch from the server:");
    final url = "https://jsonplaceholder.typicode.com/posts/";

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);
      print(result);

      setState(() {
        dataToBeDisplayed = result.data.toString();
      });
    } catch (e) {
      print(e);
    }

    ///
    // Dio().get(url).then((res) {
    //   print(res);
    // }).catchError((e) {
    //   print(e);
    // });

    ///
  }

  @override
  void initState() {
    super.initState();

    print("\n This is the init state functionn being called \n");

    fetchPostsDataFromServer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("\n This is the build state functionn being called \n");

    return Scaffold(
      appBar: AppBar(
        title: Text("Use dio"),
      ),
      body: Center(child: Text(dataToBeDisplayed)),
    );
  }
}
