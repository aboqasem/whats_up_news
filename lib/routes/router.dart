import 'package:auto_route/auto_route.dart';
import 'package:whats_up_news/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page),
        CustomRoute(
          page: ArticlesRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
