import 'package:auto_route/auto_route.dart';
import 'package:apex_test/navigator/guards/auth_guard.dart';
import 'package:apex_test/navigator/guards/redirect_guard.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: OnBoardingRoute.page,
      path: '/onBoarding',
      guards: [RedirectGuard()],
      initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegisterRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: VerifyEmailRoute.page,
      path: '/verifyEmail',
    ),
    AutoRoute(
      page: RegisterSecondRoute.page,
      path: '/registerSecond',
    ),
    AutoRoute(
      page: SetupPinRoute.page,
      path: '/setupPin',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: CheckPinRoute.page,
      path: '/checkPin',
    ),
  ];
}
