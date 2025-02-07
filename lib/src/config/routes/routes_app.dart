import 'package:go_router/go_router.dart';

import '../../features/feature_on_boarding/feature_on_boarding.dart';
import '../../features/feature_users/feature_users.dart';

final routesApp = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashView.routeName,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/home-users-view',
      name: HomeUsersView.routeName,
      builder: (context, state) => const HomeUsersView(),
    ),
    GoRoute(
      path: '/detail-post-user',
      name: DetailPostUserView.routeName,
      builder: (context, state) {
        return DetailPostUserView();
      }
    ),
  ],
);