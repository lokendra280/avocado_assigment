import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';
import 'package:video_app/common/constant/constant_assets.dart';

class CustomNetWorkImage extends StatelessWidget {
  final BoxFit? boxFit;
  final String imageUrl;
  final double? height;
  final double? width;
  final String? placeHolder;
  const CustomNetWorkImage({
    super.key,
    required this.imageUrl,
    this.boxFit,
    this.height,
    this.width,
    this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      // key: UniqueKey(),
      image: AssetImage(
        imageUrl,
      ),
      fit: boxFit ?? BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Container(
            height: height,
            width: width,
            color: CustomTheme.grey,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Image(
          height: height,
          width: width,
          image: AssetImage(
            placeHolder ?? Assets.placeholder,
          ),
          fit: boxFit ?? BoxFit.contain,
        );
      },
    );
  }
}
