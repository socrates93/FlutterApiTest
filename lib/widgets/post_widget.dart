import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/models/post.dart';
import 'package:fluttertest_altice/providers/users_provider.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final bool resumed;

  const PostWidget({Key? key, required this.post, this.resumed = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postCubit = BlocProvider.of<PostCubit>(context);
    final _theme = Theme.of(context).textTheme;

    return resumed
        ? ResumedPost(post: post, theme: _theme, postCubit: _postCubit)
        : DetailedPost(post: post, theme: _theme);
  }
}

class ResumedPost extends StatelessWidget {
  const ResumedPost({
    Key? key,
    required this.post,
    required TextTheme theme,
    required PostCubit postCubit,
  })  : _theme = theme,
        _postCubit = postCubit,
        super(key: key);

  final Post post;
  final TextTheme _theme;
  final PostCubit _postCubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          post.title,
          style: _theme.headline6,
          maxLines: 2,
        ),
        subtitle: Text(post.body,
            maxLines: 2,
            style: _theme.bodyText2,
            overflow: TextOverflow.ellipsis),
        onTap: () async {
          post.user = await UserProvider().getUserById(post.userId);
          _postCubit.currentPost = post;
          Navigator.of(context).pushNamed("details");
        },
      ),
    );
  }
}

class DetailedPost extends StatelessWidget {
  const DetailedPost({
    Key? key,
    required this.post,
    required TextTheme theme,
  })  : _theme = theme,
        super(key: key);

  final Post post;
  final TextTheme _theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .905,
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: Text(
                            "${post.user!.name[0].toUpperCase()}${post.user!.name[1].toUpperCase()}"),
                      ),
                    ),
                    title: Text(
                      "${post.user!.name} posteo:",
                      style: _theme.bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      post.user!.email,
                      style: _theme.bodyText2!,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  Text(post.body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
