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
  static const reals = 'reals';
  static const momentsShare = 'moments_share';
  static const postDetails = 'posts-details';
  static const editProfile = 'edit-profile';
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
        return NavigationMenuView.hooked();
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
          path: 'profile',
          name: AppRouteName.profile,
          builder: (context, state) {
            return ProfileView.hooked();
          },
          routes: [
            GoRoute(
              path: 'edit-profile',
              name: AppRouteName.editProfile,
              builder: (context, state) {
                return EditProfileView.hooked();
              },
            )
          ],
        ),
        GoRoute(
          path: 'search',
          name: AppRouteName.search,
          builder: (context, state) {
            return SearchView.hooked();
          },
        ),
        GoRoute(
          path: 'reals',
          name: AppRouteName.reals,
          builder: (context, state) {
            return ReelsView.hooked();
          },
        ),
        GoRoute(
          path: 'moments-shares',
          name: AppRouteName.momentsShare,
          builder: (context, state) {
            return MomentsShareView.hooked();
          },
        ),
        GoRoute(
          path: 'posts',
          name: AppRouteName.posts,
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
              path: ':$kPostId',
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
            )
          ],
        )
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
  ]);
}
