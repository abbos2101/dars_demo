import 'package:dio/dio.dart';

class BaseApiRepo {
  final Dio dio;

  const BaseApiRepo(this.dio);
}

class PostApiRepo {
  final BaseApiRepo _base;

  const PostApiRepo(this._base);

  Future<Response> posts() => _base.dio.get("/posts");
}
