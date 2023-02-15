import 'package:dars_demo/core/api_repo.dart';
import 'package:dars_demo/core/post_model.dart';

class PostService {
  final PostApiRepo _api;

  const PostService(this._api);

  Future<List<PostModel>> posts() async {
    final response = await _api.posts();
    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
