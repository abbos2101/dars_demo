import 'package:dars_demo/core/post_model.dart';
import 'package:dars_demo/core/post_service.dart';
import 'package:flutter/foundation.dart';

enum HomeStates { initial, loading, success, fail }

class HomeProvider extends ChangeNotifier {
  final PostService _service;

  HomeProvider(this._service) {
    loadData();
  }

  var _state = HomeStates.initial;
  var _message = "";
  var _posts = <PostModel>[];

  Future<void> loadData() async {
    _state = HomeStates.loading;
    notifyListeners();
    try {
      _posts = await _service.posts();
      _state = HomeStates.success;
      notifyListeners();
    } catch (e) {
      _state = HomeStates.fail;
      _message = "$e";
      notifyListeners();
    }
  }

  HomeStates get state => _state;

  String get message => _message;

  List<PostModel> get posts => _posts;
}
