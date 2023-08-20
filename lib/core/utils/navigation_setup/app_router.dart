import 'package:auto_route/auto_route.dart';
import 'package:shopping_application/core/utils/navigation_setup/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
      ];
}
