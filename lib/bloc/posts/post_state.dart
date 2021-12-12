import 'package:android_and_ios/model/posts.dart';

abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostFetchedState extends PostState {
  final List<Posts> data;
  PostFetchedState({required this.data});
}

class PostError extends PostState {
  String errorMessage;
  PostError({required this.errorMessage});
}

class PostsEmpty extends PostState {}

// class PostsRefreshingState extends PostState {}

// class PostsLoadingMoreSTate extends PostState {}
