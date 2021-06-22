import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:fluttertest_altice/models/post.dart';
import 'package:fluttertest_altice/providers/posts_provider.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostProvider _postProvider;
  Post? currentPost;

  PostCubit(this._postProvider) : super(PostInitial());

  Future getPosts() async {
    try {
      emit(PostFetching());

      final resultSet = await _postProvider.getPosts();

      if (resultSet.length > 0) {
        emit(PostFetched(resultSet));
      } else
        emit(PostError("No se obtuvo ningun resultado en la petición."));
    } catch (e) {
      emit(PostError("Error al realizar petición: $e"));
    }
  }
}
