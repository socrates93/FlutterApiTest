part of 'post_cubit.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostFetching extends PostState {
  const PostFetching();
}

class PostFetched extends PostState {
  final List<Post>? posts;

  const PostFetched(this.posts);
}

class PostError extends PostState {
  final String error;

  const PostError(this.error);
}
