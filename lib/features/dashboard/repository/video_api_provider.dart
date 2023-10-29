import 'package:video_app/https/api_provider.dart';

class VideoApiProvider {
  final String baseUrl;
  final ApiProvider apiProvider;

  VideoApiProvider({
    required this.baseUrl,
    required this.apiProvider,
  });

  Future<dynamic> getVideo() async {
    Uri uri = Uri.parse("$baseUrl/posts");
    return await apiProvider.get(
      uri,
    );
  }
}
