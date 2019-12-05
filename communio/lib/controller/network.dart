import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

final dio = new Dio();

onStart() async {
  final Directory tempDir = await getTemporaryDirectory();
  final String tempPath = tempDir.path;
  final CookieJar cj = new PersistCookieJar(dir: tempPath);
  dio.interceptors.add(CookieManager(cj));  
}

Future<Response> get(url, {Map<String, String> headers}) async {
  final response = await dio.get(url, options: Options(headers: headers));
  return response;
}

Future<Response> post(url, {Map<String, String> headers, body}) async {
  final response =
      await dio.post(url, data: body, options: Options(headers: headers));

  return response;
}

Future<Response> put(url, {Map<String, String> headers, body}) async {
  final response =
      await dio.put(url, data: body, options: Options(headers: headers));

  return response;
}

Future<Response> delete(url, {Map<String, String> headers}) async {
  final response = await dio.delete(url, options: Options(headers: headers));

  return response;
}
