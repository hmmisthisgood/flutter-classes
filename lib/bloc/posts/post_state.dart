import 'package:android_and_ios/model/posts.dart';

abstract class PostState  {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostFetchedState extends PostState {
  final List<Posts> data;
  final String? successMessage;
  PostFetchedState({required this.data, this.successMessage});
}

class PostError extends PostState {
  String message;
  PostError({required this.message});
}

class PostsEmpty extends PostState {}

// class PostsRefreshingState extends PostState {}

// class PostsLoadingMoreSTate extends PostState {}
