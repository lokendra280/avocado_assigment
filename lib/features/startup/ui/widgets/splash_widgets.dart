import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';

import 'package:video_app/common/constant/constant.dart';
import 'package:video_app/common/navigation/navigation_service.dart';
import 'package:video_app/common/route/route.dart';
import 'package:video_app/common/utils/size_utils.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      NavigationService.pushNamedReplacement(routeName: Routes.dashboardPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    SizeUtils.init(context: context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.hp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.hp),
              child: Text(Constants.appTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall!
                      .copyWith(color: CustomTheme.primaryColor)),
            ),
            SizedBox(height: 24.hp),
          ],
        ),
      ),
    );
  }
}
