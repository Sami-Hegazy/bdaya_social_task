import 'package:bdaya_social_task/features/auth/login_view.dart';
import 'package:bdaya_social_task/features/edit_profile/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/moments_share/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/profile/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/reels/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/search/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/view.dart';
import 'package:bdaya_social_task/features/post_details/view.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

const kPostId = 'postId';

class AppRouteName {
  static const auth = 'auth';
  static const home = 'home';
  static const posts = 'posts';
  static const profile = 'profile';
  static const search = 'search';
  static const reels = 'reels';
  static const momentsShare = 'moments-share';
  static const postDetails = 'posts-details';
  static const profileInfo = 'profile-info';
  static const postComments = 'posts-comments';
  static const postLikes = 'posts-likes';
  static const postShares = 'posts-shares';
}

@lazySingleton
class RoutingService {
  final UserService userService;

  RoutingService(this.userService);

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorSearch =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');

  static final _rootNavigatorMoments =
      GlobalKey<NavigatorState>(debugLabel: 'shellMoments');

  static final _rootNavigatorReels =
      GlobalKey<NavigatorState>(debugLabel: 'shellReels');

  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  late final router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavigationMenuView.hooked(
            navigationShell: navigationShell,
            keys: [state.pageKey],
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRouteName.home,
                builder: (context, state) {
                  return PostView.hooked();
                },
                redirect: (context, state) {
                  if (userService.currentUserIdRx.of(context) == null) {
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
                    path: 'postId=:$kPostId',
                    name: AppRouteName.postDetails,
                    builder: (context, state) {
                      return PostDetailsView.hooked();
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSearch,
            routes: [
              GoRoute(
                path: '/search',
                name: AppRouteName.search,
                builder: (context, state) {
                  return SearchView.hooked();
                },
                redirect: (context, state) {
                  if (userService.currentUserIdRx.of(context) == null) {
                    return state.namedLocation(
                      AppRouteName.auth,
                      queryParameters: {
                        'old_route': state.uri.toString(),
                      },
                    );
                  }
                  return null;
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorMoments,
            routes: [
              GoRoute(
                path: '/moments-share',
                name: AppRouteName.momentsShare,
                builder: (context, state) {
                  return MomentsShareView.hooked();
                },
                redirect: (context, state) {
                  if (userService.currentUserIdRx.of(context) == null) {
                    return state.namedLocation(
                      AppRouteName.auth,
                      queryParameters: {
                        'old_route': state.uri.toString(),
                      },
                    );
                  }
                  return null;
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorReels,
            routes: [
              GoRoute(
                path: '/reels',
                name: AppRouteName.reels,
                builder: (context, state) {
                  return ReelsView.hooked();
                },
                redirect: (context, state) {
                  if (userService.currentUserIdRx.of(context) == null) {
                    return state.namedLocation(
                      AppRouteName.auth,
                      queryParameters: {
                        'old_route': state.uri.toString(),
                      },
                    );
                  }
                  return null;
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorProfile,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRouteName.profile,
                builder: (context, state) {
                  return ProfileView.hooked();
                },
                redirect: (context, state) {
                  if (userService.currentUserIdRx.of(context) == null) {
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
                    path: 'profile-info',
                    name: AppRouteName.profileInfo,
                    builder: (context, state) {
                      return ProfileInfoView.hooked();
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        name: AppRouteName.auth,
        builder: (context, state) {
          return LoginView.hooked();
        },
        redirect: (context, state) {
          if (userService.currentUserIdRx.of(context) != null) {
            final oldRoute = state.uri.queryParameters['old_route'] ?? '/';
            return oldRoute;
          }
          return null;
        },
      ),
    ],
  );
}
