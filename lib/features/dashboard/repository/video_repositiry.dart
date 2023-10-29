import 'package:flutter/material.dart';
import 'package:video_app/common/constant/env.dart';
import 'package:video_app/features/dashboard/model/user_model.dart';
import 'package:video_app/features/dashboard/repository/all_video_repository.dart';
import 'package:video_app/features/dashboard/repository/video_api_provider.dart';
import 'package:video_app/https/api_provider.dart';
import 'package:video_app/https/response.dart';

class VideoRepository {
  final AllVideoRepository allVideoRepository;
  Env env;

  final ApiProvider apiProvider;

  late VideoApiProvider videoApiProvider;

  VideoRepository({
    required this.env,
    required this.allVideoRepository,
    required this.apiProvider,
  }) {
    videoApiProvider =
        VideoApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }
  final List<String> _items = [];
  List<String> get getItems => _items;

  Future<DataResponse<List<UserModel>>> getvideolist(
      {bool isLoadMore = false}) async {
    List<UserModel> temp = [];

    try {
      final res = await videoApiProvider.getVideo();
      temp = List.from(res['data']?['data'])
          .map((e) => UserModel.fromMap(e))
          .toList();

      return DataResponse.success(temp);
    } catch (e) {
      debugPrint(e.toString());

      return DataResponse.error(e.toString());
    }
  }
}
