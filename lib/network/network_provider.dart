import 'package:dio/dio.dart';
import 'package:medic_consult/network/url_config.dart';

import 'api_error.dart';
import 'app_interceptor.dart';

/// description:
/// project:
/// @package: network
/// @author: dammyololade
/// created on: 3/11/21

class NetworkProvider {
  static const int CONNECT_TIME_OUT = 30000;
  static const int RECEIVE_TIME_OUT = 30000;
  Dio dio;

  NetworkProvider({String baseUrl}) {
    dio = new Dio(BaseOptions(
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
      baseUrl: baseUrl ?? UrlConfig.BASE_URL,
    ));
  }

  NetworkProvider.test(this.dio);

  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic> queryParams,
    data,
    FormData formData,
  }) async {
    Response response;
    var params = queryParams ?? {};
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(path, queryParameters: params, data: data);
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(path, queryParameters: params, data: data);
          break;
        case RequestMethod.delete:
          response =
              await dio.delete(path, queryParameters: params, data: data);
          break;
        case RequestMethod.upload:
          response = await dio.post(path,
              data: formData,
              queryParameters: params,
              options: new Options(headers: {
                "Content-Disposition": "form-data",
                "Content-Type": "multipart/form-data",
              }),
              onSendProgress: (sent, total) {});
          break;
      }
      return response;
    } on DioError catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      return Future.error(apiError, stackTrace);
    }
  }
  void printDioLogs(Object object) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(object.toString())
        .forEach((match) => print(match.group(0)));
  }

}

enum RequestMethod { post, get, put, delete, upload }
