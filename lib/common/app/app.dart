import 'package:flutter/material.dart';
import 'package:video_app/common/app/theme.dart';
import 'package:video_app/common/constant/constant.dart';
import 'package:video_app/common/constant/env.dart';
import 'package:video_app/common/navigation/navigation_service.dart';
import 'package:video_app/common/route/route.dart';
import 'package:video_app/common/route/route_generator.dart';
import 'package:video_app/common/wrapper/multi_bloc_wrapper.dart';
import 'package:video_app/common/wrapper/multi_repository_wrapper.dart';

class App extends StatelessWidget {
  final Env env;
  const App({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryWrapper(
      env: env,
      child: MultiBlocWrapper(
        env: env,
        child: MaterialApp(
          navigatorKey: NavigationService.navigationKey,
          title: Constants.appTitle,
          initialRoute: Routes.root,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
