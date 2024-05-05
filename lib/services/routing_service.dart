import 'package:bdaya_social_task/features/auth/view.dart';
import 'package:bdaya_social_task/features/home/view.dart';
import 'package:bdaya_social_task/features/post_details/view.dart';
import 'package:bdaya_social_task/features/posts/view.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

class AppRouteName {
  static const auth = 'auth';
  static const home = 'home';
  static const posts = 'posts';
  static const postDetails = 'posts-details';
  static const postComments = 'posts-comments';
  static const postLikes = 'posts-likes';
  static const postShares = 'posts-shares';
}

@lazySingleton
class RoutingService {
  final UserService userService;

  RoutingService(this.userService);

  late final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: AppRouteName.home,
      builder: (context, state) {
        return HomeView.hooked();
      },
    ),
    GoRoute(
      path: '/auth',
      name: AppRouteName.auth,
      builder: (context, state) {
        return AuthView.hooked();
      },
      redirect: (context, state) {
        if (userService.currentUser.of(context) != null) {
          final oldRoute = state.uri.queryParameters['old_route'] ?? '/';
          return oldRoute;
        }
        return null;
      },
    ),
    GoRoute(
      path: '/posts',
      name: AppRouteName.posts,
      builder: (context, state) {
        return PostsView.hooked();
      },
      redirect: (context, state) {
        //route Permission
        if (userService.currentUser.of(context) == null) {
          return state.namedLocation(
            AppRouteName.auth,
            queryParameters: {
              'old_route': state.uri.toString(),
            },
          );
        }
        return null;
      },
      routes: [
        GoRoute(
          path: ':id',
          name: AppRouteName.postDetails,
          builder: (context, state) {
            return PostDetailsView.hooked();
          },
          routes: [
            GoRoute(
              path: 'comments',
              name: AppRouteName.postComments,
              builder: (context, state) {
                return const SizedBox.shrink();
              },
            ),
            GoRoute(
              path: 'likes',
              name: AppRouteName.postLikes,
              builder: (context, state) {
                return const SizedBox.shrink();
              },
            ),
            GoRoute(
              path: 'shares',
              name: AppRouteName.postShares,
              builder: (context, state) {
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ],
    ),
  ]);
}
