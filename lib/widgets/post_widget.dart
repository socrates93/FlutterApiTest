import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postCubit = BlocProvider.of<PostCubit>(context);
    final _theme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        title: Text(
          post.title,
          style: _theme.headline6,
        ),
        subtitle: Text(
          post.body,
          style: _theme.bodyText2,
          overflow: TextOverflow.fade,
        ),
        onTap: () {
          _postCubit.currentPost = post;
          Navigator.of(context).pushNamed("details");
        },
      ),
    );
  }
}
