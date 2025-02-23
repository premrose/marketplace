import 'package:marketplace/models/post.dart';
import 'package:marketplace/models/post_details.dart';
import 'package:marketplace/network/services/services.dart';

import '../../service_locator.dart';

abstract class Repository {
  Future<Post> fetchPosts(pageNumber);
  Future<PostDetails> fetchPostsDetails(hashId);
}

class RepositoryImp extends Repository {
  RepositoryImp();

  final ServiceRepository _service = sl<ServiceRepository>();

  @override
  Future<Post> fetchPosts(pageNumber) async {
    try {
      return await _service.fetchPosts(pageNumber);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PostDetails> fetchPostsDetails(hashId) async {
    try {
      return await _service.fetchPostsDetails(hashId);
    } catch (e) {
      rethrow;
    }
  }
}
