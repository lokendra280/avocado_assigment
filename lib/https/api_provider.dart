import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:video_app/https/custom_exception.dart';
import 'package:video_app/https/dio_client.dart';

class ApiProvider {
  final String baseUrl;

  ApiProvider({
    required this.baseUrl,
  });
  late Dio _dio;

  Future<dynamic> put(
    String url,
    dynamic body, {
    required String? userId,
    String token = '',
  }) async {
    final DioClient _dioClient = DioClient(baseUrl: baseUrl, userId: userId);

    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> get(
    Uri url, {
    String? userId,
    String tokens = '',
    int timeOut = 30,
  }) async {
    final DioClient _dioClient = DioClient(baseUrl: baseUrl, userId: userId);

    dynamic responseJson;

    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };

      if (tokens.isNotEmpty) {
        header['Authorization'] = 'Bearer $tokens';
      }
      final dynamic response = await _dioClient.get(
        url,
        options: Options(
          headers: header,
        ),
      );

      responseJson = _response(response, url.toString(), cacheResult: true);
    } on DioException catch (e, s) {
      responseJson = await _handleErrorResponse(e);
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    return responseJson;
  }

  _handleErrorResponse(DioException e) async {
    if (e.toString().toLowerCase().contains("socketexception")) {
      throw NoInternetException("", 1000);
    } else {
      if (e.response != null) {
        return await _response(e.response!, "");
      } else {
        throw FetchDataException(
          'An error occurred while fetching data.',
          e.response?.statusCode,
        );
      }
    }
  }

  Future<Map<String, dynamic>> _response(Response response, String url,
      {bool cacheResult = false}) async {
    final Map<String, dynamic> res = response.data is Map
        ? response.data
        : (response.data is List)
            ? {"data": response.data}
            : {};

    final responseJson = <String, dynamic>{};
    responseJson['data'] = res;

    responseJson['statusCode'] = response.statusCode;
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(
            getErrorMessage(res, 400), response.statusCode);
      case 404:
        throw ResourceNotFoundException(
            getErrorMessage(res, 404), response.statusCode);

      case 409:
        throw BadRequestException(
            getErrorMessage(res, 40), response.statusCode);
      case 422:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            getErrorMessage(res, 404), response.statusCode);
      case 429:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            "You've made too many requests. Please try again after a while.",
            response.statusCode);
      case 401:
      case 403:
        throw UnauthorisedException(
            getErrorMessage(res, 404), response.statusCode);
      case 500:
        throw InternalServerErrorException(
            getErrorMessage(res, 404), response.statusCode);

      default:
        throw NoInternetException(
            'Error occured while Communication with Server', 1000);
    }
  }

  String getErrorMessage(dynamic res, [int? statusCode]) {
    String message = "";
    try {
      debugPrint(res.toString());
      debugPrint("-------------------GET ERROR ------------------");

      if (res["data"] is Map) {
        if (res["data"]?["message"] is String &&
            (res["data"]?["message"] ?? "").toString().isNotEmpty) {
          message = res["data"]?["message"];
          return message;
        }
      }
      if (res["message"] is String) {
        message = res["message"];
        return message;
      }
      if (res["message"] is List) {
        final List<dynamic> messages = res['message'][0]["messages"];
        for (var element in messages) {
          message += (element as Map<String, dynamic>)['message'] + '\n';
        }
        return message;
      }
      if (res["data"] is String) {
        message = res["data"] ?? "";
      }
    } catch (e) {
      return message.isEmpty
          ? _getErroMessageAccordingtoStatusCode(statusCode)
          : message;
    }
    return message.isEmpty
        ? _getErroMessageAccordingtoStatusCode(statusCode)
        : message;
  }

  String _getErroMessageAccordingtoStatusCode(int? statusCode) {
    if (statusCode == 400) {
      return "Bad Request";
    } else if (statusCode == 404) {
      return "Resource Not Found";
    } else if (statusCode == 422) {
      return "Bad Request";
    } else if (statusCode == 403 || statusCode == 402 || statusCode == 401) {
      return "Unauthorized";
    } else if (statusCode == 500) {
      return "Internal Server Error";
    } else {
      return "Something went wrong";
    }
  }
}
