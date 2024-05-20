import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/moments_share/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/reels/view.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/profile/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/search/view.dart';
import 'package:bdaya_social_task/services/posts_service.dart';

@lazySingleton
class NavigationMenuController extends BdayaCombinedController {
  NavigationMenuController(
    this.postsService,
    this.userService,
  );
  final PostsService postsService;
  final UserService userService;

  final selectedIndexRx = SharedValue<int>(value: 0);

  final screensList = [
    PostView.hooked(),
    SearchView.hooked(),
    MomentsShareView.hooked(),
    ReelsView.hooked(),
    ProfileView.hooked(),
  ];

  final List<String> tabs = [
    '/home',
    '/search',
    '/reals',
    'moments-shares',
    '/profile'
  ];
}
