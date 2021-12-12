import 'package:android_and_ios/bloc/posts/posts_bloc.dart';
import 'package:android_and_ios/use_dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UseDioProvider extends StatelessWidget {
  UseDioProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => FetchPostsBloc()),
    ], child: UsingDio());
  }
}
