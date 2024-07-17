import 'dart:convert';
import 'package:comment_app/constants/url.const.dart';
import 'package:comment_app/models/comment.model.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<List<Comment>> fetchComments() async {
    final response = await http.get(Uri.parse(URL.apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
