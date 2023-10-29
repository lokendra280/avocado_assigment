import 'package:video_app/features/dashboard/model/user_model.dart';

class AllVideoRepository {
  final Map<String, UserModel> _video = {};
  Map<String, UserModel> get getVideos => _video;

  addAll(Map<String, UserModel> other) {
    _video.addAll(other);
  }
}
