import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/widgets/post_widget.dart';

class PostDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postCubit = BlocProvider.of<PostCubit>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: PostWidget(
          post: postCubit.currentPost!,
        ),
      ),
    );
  }
}
