import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

import 'package:fluttertest_altice/models/comment.dart';
import 'package:fluttertest_altice/providers/comments_provider.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentProvider _commentProvider;

  CommentCubit(this._commentProvider) : super(CommentInitial());

  Future getComments(int id) async {
    try {
      emit(CommentFetching());

      final resultSet = await _commentProvider.getCommentsByPostId(id);

      if (resultSet.length > 0) {
        emit(CommentFetched(resultSet));
      } else
        emit(CommentError("Este post no tiene ningún comentario."));
    } catch (e) {
      emit(CommentError(
          "Error al realizar petición. Favor revise su conexión a internet."));
    }
  }
}
