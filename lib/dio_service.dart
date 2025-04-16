import 'package:dio/dio.dart';
import 'package:go_router_demo/model/post.dart';

class HttpService {
  late Dio _dio;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/';

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<Response> getRequest(int postId) async {
    String url = '$baseUrl/posts/$postId';
    late Response response;

    try {
      response = await _dio.get(url);
       print('response ->'+response.statusCode.toString());
    } on Exception catch (e) {
      print('exception ' + e.toString());
    }
    return response;
  }

  initInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      print(error.message);
    }, onRequest: (request, handler) {
      print(request.data);
    }, onResponse: (response, handler) {
      print(response.statusCode);
    }));
  }
}
