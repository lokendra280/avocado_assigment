import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_app/common/route/route.dart';
import 'package:video_app/features/dashboard/ui/pages/video_page.dart';
import 'package:video_app/features/dashboard/ui/widget/dashboard_widget.dart';
import 'package:video_app/features/startup/ui/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // route for splash page
      case Routes.root:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: routeSettings,
        );
      case Routes.dashboardPage:
        return PageTransition(
          child: const DashboardWidget(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
        );
      default:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          alignment: Alignment.center,
        );
    }
  }
}
