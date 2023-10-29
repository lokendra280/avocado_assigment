import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_app/common/utils/size_utils.dart';

import 'constant/constant_assets.dart';

class CommonNoDataWidget extends StatelessWidget {
  final String message;
  final String svgUrl;
  final double height;
  final double width;
  const CommonNoDataWidget({
    super.key,
    this.message = "",
    this.svgUrl = Assets.noData,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: SvgPicture.asset(
              svgUrl,
              height: height,
              width: width,
            ),
          ),
          SizedBox(
            height: 30.hp,
          ),
          Text((message.isNotEmpty) ? message : "No Data Found"),
        ],
      ),
    );
  }
}
