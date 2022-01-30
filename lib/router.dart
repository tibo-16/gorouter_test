import 'package:go_router/go_router.dart';
import 'package:gorouter_test/friend.dart';
import 'package:gorouter_test/home.dart';
import 'package:gorouter_test/profile/profile.dart';

class AppRouter {
  GoRouter get rootRouter => _rootRouter;

  GoRouter get profileRouter => _profileRouter;

  final _rootRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', redirect: (_) => '/home/profile'),
      GoRoute(
        path: '/home/:tab',
        builder: (context, state) {
          final tab = TabX.fromString(state.params['tab']!);
          return Home(
            key: state.pageKey,
            selectedTab: tab,
          );
        },
      ),
    ],
  );

  final _profileRouter = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: '/', redirect: (_) => '/profile'),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const Profile(),
      ),
      GoRoute(path: '/profile/friend', builder: (context, state) => const Friend()),
    ],
  );
}
