import 'package:dars_demo/core/api_repo.dart';
import 'package:dars_demo/core/post_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void setup() {
  WidgetsFlutterBinding.ensureInitialized();

  di.registerSingleton(
    BaseApiRepo(
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com")),
    ),
  );
  di.registerSingleton(PostApiRepo(di.get()));
  di.registerSingleton(PostService(di.get()));
}
