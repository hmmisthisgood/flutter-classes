import 'package:android_and_ios/bloc/posts/post_state.dart';
import 'package:android_and_ios/model/posts.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FetchPostsBloc extends Cubit<PostState> {
  FetchPostsBloc() : super(PostInitialState());

  int postCount = 10;

  fetchPostsWithBloc() async {
    emit(PostLoadingState());

    final url = "https://jsonplaceholder.typicode.com/posts/";

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);
      print(result);

      var _postdata = result.data as List;

      var posts = _postdata.map<Posts>((item) {
        /// converting json item to a Post

        Posts newPost = Posts.fromJson(item);
        return newPost;
      }).toList();

      if (posts.isEmpty) {
        emit(PostsEmpty());
      } else {
        emit(PostFetchedState(data: posts));
      }
    } catch (e) {
      print(e);
      emit(PostError(errorMessage: e.toString()));
    }
  }
}
