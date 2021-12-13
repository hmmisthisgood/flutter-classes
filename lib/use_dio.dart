import 'package:android_and_ios/bloc/common_bloc_state.dart';
import 'package:android_and_ios/bloc/posts/post_state.dart';
import 'package:android_and_ios/bloc/posts/posts_bloc.dart';
import 'package:android_and_ios/widgets/post_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// flutter_bloc needs to be imported
import 'package:flutter_bloc/flutter_bloc.dart';
//

class UsingDio extends StatefulWidget {
  const UsingDio({Key? key}) : super(key: key);

  @override
  _UsingDioState createState() => _UsingDioState();
}

class _UsingDioState extends State<UsingDio> {
  String dataToBeDisplayed = "Fetching data from server";

  List<Posts> posts = [];

  List videos = [];

  bool hasErrorOccurred = false;
  String errorMessage = "";

  bool isDateFetching = false;

  void fetchPostsDataFromServer() async {
    print("starting data fetch from the server:");
    final url = "https://jsonplaceholder.typicode.com/posts/";

    isDateFetching = true;
    setState(() {});

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);
      print(result);

      /// In dio we do not have to do json.decode() the response data.

      /// converting the list of json data that we received into the list of posts
      /// with lists's map function

      var _postdata = result.data as List;

      posts = _postdata.map<Posts>((item) {
        /// converting json item to a Post

        Posts newPost = Posts.fromJson(item);
        return newPost;
      }).toList();

      setState(() {
        isDateFetching = false;
        dataToBeDisplayed = result.data.toString();
      });
    } catch (e) {
      print(e);
      isDateFetching = false;

      hasErrorOccurred = true;
      errorMessage = e.toString();
      setState(() {});
    }

    ///
    // Dio().get(url).then((res) {
    //   print(res);
    // }).catchError((e) {
    //   print(e);
    // });

    ///
  }

  FetchPostsBloc bloc1 = FetchPostsBloc();

  @override
  void initState() {
    super.initState();

    context.read<FetchPostsBloc>().fetchPostsWithBloc();
  }

  @override
  void dispose() {
    super.dispose();
    print("this is the dispose function being called");
  }

  @override
  Widget build(BuildContext context) {
    print("\n This is the build  functionn being called \n");

    ///these two are same things
    // if (isDateFetching == true) {
    // } else {}

    // isDateFetching == true ? print("this") : print("that");

    return Scaffold(
        appBar: AppBar(
          title: Text("Use dio"),
        ),
        body: BlocConsumer<FetchPostsBloc, PostState>(
          listener: (context, state) {
            setState(() {});
          },
          builder: (context, state) {
            print(state);

            if (state is PostLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is PostError) {
              return Text(state.message);
            }

            if (state is PostsEmpty) {
              return Text("you have no posts");
            }
            if (state is PostFetchedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final _currentPost = state.data[index];

                  print(index.toString());

                  return PostWidget(post: _currentPost);
                },
              );
            }

            return Container();
          },
        )

        //  isDateFetching == true
        //     ? Center(child: CircularProgressIndicator())
        //     : hasErrorOccurred == true
        //         ? Text(errorMessage)
        //         : posts.isEmpty
        //             ? Center(child: Text("There are no posts for you"))
        //             : ListView.builder(
        //                 itemCount: posts.length,
        //                 itemBuilder: (context, index) {
        //                   final _currentPost = posts[index];

        //                   print(index.toString());

        //                   return PostWidget(post: _currentPost);
        //                 },
        //               ),
        );
  }
}
