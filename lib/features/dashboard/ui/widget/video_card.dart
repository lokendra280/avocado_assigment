import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';
import 'package:video_app/common/constant/constant_assets.dart';
import 'package:video_app/common/image/custom_network_image.dart';

class VideoCards extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final String date;
  final EdgeInsetsGeometry? margin;

  const VideoCards({
    Key? key,
    required this.title,
    this.onPressed,
    required this.date,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 300,
              height: 260,
              decoration: BoxDecoration(
                color: CustomTheme.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      maxLines: (title.split(" ").length < 2) ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const CustomNetWorkImage(
                    height: 200,
                    width: 200,
                    imageUrl: Assets.user,
                    boxFit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
