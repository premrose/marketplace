import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marketplace/models/post.dart';
import 'package:marketplace/models/post_details.dart';

abstract class ServiceRepository {
  Future<Post> fetchPosts(pageNumber);
  Future<PostDetails> fetchPostsDetails(hashId);
}

class ServicesImp extends ServiceRepository {
  String url = "https://staging3.hashfame.com/api/v1/interview.mplist?";
  @override
  Future<Post> fetchPosts(pageNumber) async {
    try {
      http.Response res = await http.get(Uri.parse("${url}page=$pageNumber"));
      if (res.statusCode == 200) {
        return Post.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostDetails> fetchPostsDetails(hashId) async {
    try {
      http.Response res = await http.get(Uri.parse("${url}id_hash=$hashId"));
      if (res.statusCode == 200) {
        return PostDetails.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to load post details');
      }
    } catch (e) {
      rethrow;
    }
  }
}
