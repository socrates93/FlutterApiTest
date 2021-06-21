import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fluttertest_altice/models/post.dart';
import 'package:fluttertest_altice/utils/constants.dart' as c;

class PostService {
  Future<List<Post>> getPosts() async {
    final uri = Uri.parse("${c.API_URL}/posts");
    final response = await http.get(uri);

    try {
      final List<Post> posts = [];

      if (response.statusCode == 200) {
        final List body = json.decode(response.body);

        body.forEach((element) {
          posts.add(Post.fromJson(element));
        });

        return posts;
      }

      return posts;
    } catch (e) {
      return [];
    }
  }
}
