import 'package:bloc/bloc.dart';
import 'package:fluttertest_altice/models/post.dart';
import 'package:fluttertest_altice/services/posts_provider.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostService _postService;

  PostCubit(this._postService) : super(PostInitial());

  Future getPosts() async {
    try {
      emit(PostFetching());

      final resultSet = await _postService.getPosts();

      if (resultSet.length > 0) {
        emit(PostFetched(resultSet));
      } else
        emit(PostError("No se obtuvo ningun resultado en la petición."));
    } catch (e) {
      emit(PostError("Error al realizar petición: $e"));
    }
  }
}
