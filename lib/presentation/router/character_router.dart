import 'package:auto_route/auto_route.dart';

import 'character_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ManiRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: FavoriteRoute.page),
          ],
        ),
      ];
}
