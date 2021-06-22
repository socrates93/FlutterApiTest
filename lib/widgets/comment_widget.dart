import 'package:flutter/material.dart';

import 'package:fluttertest_altice/models/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        title: Text(
          "${comment.email} dice:",
          style: _theme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          comment.body,
          style: _theme.bodyText2,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
