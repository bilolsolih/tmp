


import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/repositories/auth_repository.dart';
import 'routing/router.dart' show navigatorKey;
import 'routing/routes.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio = Dio();


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final jwt = await navigatorKey.currentContext!.read<AuthRepository>().getJwtToken();
    if (jwt != null) {
      options.headers['Authorization'] = "Bearer $jwt";
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await navigatorKey.currentContext!.read<AuthRepository>().refreshToken();
      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = "Bearer $newToken";
        return handler.resolve(
          await _dio.request(
            err.requestOptions.baseUrl + err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers,
            ),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          ),
        );
      } else {
        await navigatorKey.currentContext!.read<AuthRepository>().logout();
        navigatorKey.currentContext!.go(Routes.login);
        return handler.reject(err);
      }
    }
  }
}