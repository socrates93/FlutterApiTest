part of 'comment_cubit.dart';

@immutable
abstract class CommentState {
  const CommentState();
}

class CommentInitial extends CommentState {
  const CommentInitial();
}

class CommentFetching extends CommentState {
  const CommentFetching();
}

class CommentFetched extends CommentState {
  final List<Comment> comments;

  const CommentFetched(this.comments);
}

class CommentError extends CommentState {
  final String error;

  const CommentError(this.error);
}
