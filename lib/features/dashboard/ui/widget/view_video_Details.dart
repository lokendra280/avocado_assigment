import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';
import 'package:video_app/common/constant/constant_assets.dart';
import 'package:video_app/common/image/custom_network_image.dart';
import 'package:video_app/common/utils/size_utils.dart';
import 'package:video_app/features/dashboard/model/user_model.dart';

class VideoDetailsWidget extends StatelessWidget {
  final UserModel userModel;

  const VideoDetailsWidget({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  width: width,
                  child: const CustomNetWorkImage(
                    imageUrl: Assets.video,
                    boxFit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: CustomTheme.symmetricHozPadding.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 24.hp,
                  ),
                  Text(
                    userModel.title,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomTheme.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10.hp,
                  ),
                  Text(
                    userModel.body,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomTheme.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
