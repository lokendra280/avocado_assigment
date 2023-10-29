import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio = Dio();
  final String baseUrl;
  final String? userId;
  DioClient({
    required this.baseUrl,
    this.userId,
  }) {
    _dio
      ..httpClientAdapter
      ..options.responseType = ResponseType.json
      ..interceptors.add(
        InterceptorsWrapper(
          onResponse: (res, handler) async {
            return handler.next(res);
          },
        ),
      );

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
    }
  }

  Future<Response> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.getUri(
        uri,
        options: options,
        // cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      rethrow;
    }
  }
}
