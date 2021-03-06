import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest_altice/BLoC/Comment/comment_cubit.dart';
import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/providers/comments_provider.dart';
import 'package:fluttertest_altice/providers/posts_provider.dart';
import 'package:fluttertest_altice/utils/routes.dart' as r;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostCubit(PostProvider()),
        ),
        BlocProvider(
          create: (_) => CommentCubit(CommentProvider()),
        )
      ],
      child: MaterialApp(
        title: 'SJ - FlutterTest Altice',
        initialRoute: "home",
        routes: r.appRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
