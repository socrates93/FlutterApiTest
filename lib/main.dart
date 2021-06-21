import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest_altice/cubit/post_cubit.dart';
import 'package:fluttertest_altice/services/posts_provider.dart';

import 'package:fluttertest_altice/utils/routes.dart' as r;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostCubit(PostService()),
        ),
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
