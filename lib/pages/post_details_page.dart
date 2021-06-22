import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest_altice/BLoC/Comment/comment_cubit.dart';
import 'package:fluttertest_altice/BLoC/Post/post_cubit.dart';
import 'package:fluttertest_altice/models/comment.dart';
import 'package:fluttertest_altice/widgets/comment_widget.dart';
import 'package:fluttertest_altice/widgets/post_widget.dart';

class PostDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPost = BlocProvider.of<PostCubit>(context).currentPost!;
    final commentCubit = BlocProvider.of<CommentCubit>(context);
    commentCubit.getComments(currentPost.id);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("${currentPost.title}"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PostWidget(post: currentPost),
            ),
            Center(
              child: Text("Sección de comentarios"),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: BlocBuilder<CommentCubit, CommentState>(
                builder: (context, state) {
                  if (state is CommentFetching) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CommentFetched) {
                    return CommentsList(comments: state.comments);
                  } else if (state is CommentError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else
                    return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({Key? key, required List<Comment> comments})
      : this.comments = comments,
        super(key: key);

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (_, i) => CommentWidget(comment: comments[i]),
    );
  }
}
