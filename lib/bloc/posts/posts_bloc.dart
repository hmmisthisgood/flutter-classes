import 'package:android_and_ios/bloc/posts/post_state.dart';
import 'package:android_and_ios/model/posts.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FetchPostsBloc extends Cubit<PostState> {
  FetchPostsBloc() : super(PostLoadingState());

  int postCount = 10;

  refreshPOsts() {}

  fetchPostsWithBloc() async {
    emit(PostLoadingState());
 
    final url = "https://jsonplaceholder.typicode.com/posts/";

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);

      var _postdata = result.data as List;

      /// we threw and errro manually to check the errro state
      // throw "This is custom exception";

      var posts = _postdata.map<Posts>((item) {
        /// converting json item to a Post

        Posts newPost = Posts.fromJson(item);
        return newPost;
      }).toList();

      ///
      if (posts.isEmpty) {
        emit(PostsEmpty());
      } else {
        emit(PostFetchedState(data: posts));
      }
    } catch (e) {
      print(e);
      emit(PostError(message: e.toString()));
    }
  }
}
