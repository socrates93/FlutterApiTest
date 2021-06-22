import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fluttertest_altice/models/comment.dart';
import 'package:fluttertest_altice/utils/constants.dart' as c;

class CommentProvider {
  Future<List<Comment>> getCommentsByPostId(int id) async {
    final uri = Uri.parse("${c.API_URL}/comments?postId=$id");
    final response = await http.get(uri);

    try {
      final List<Comment> comments = [];

      if (response.statusCode == 200) {
        final List body = json.decode(response.body);

        body.forEach((element) {
          comments.add(Comment.fromJson(element));
        });
      }

      return comments;
    } catch (e) {
      print("Error al obtener comentarios: $e");
      return [];
    }
  }
}
