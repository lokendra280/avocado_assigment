import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_app/common/utils/size_utils.dart';

class CommonSvgWidget extends StatelessWidget {
  final String svgName;
  final double height;
  final double width;
  final Color? color;
  const CommonSvgWidget({
    super.key,
    required this.svgName,
    this.height = 16,
    this.width = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: SvgPicture.asset(
        svgName,
        height: height.hp,
        width: width.wp,
        color: color,
      ),
    );
  }
}
