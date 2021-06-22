import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fluttertest_altice/models/user.dart';
import 'package:fluttertest_altice/utils/constants.dart' as c;

class UserProvider {
  Future<User?> getUserById(int id) async {
    final uri = Uri.parse("${c.API_URL}/users/$id");
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final body = json.decode(response.body)[0];

        return User.fromJson(body);
      }

      return null;
    } catch (e) {
      print("Error al obtener usuario por id: $e");
      return null;
    }
  }
}
