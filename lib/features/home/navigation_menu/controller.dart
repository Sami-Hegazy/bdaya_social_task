import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:bdaya_social_task/features/home/navigation_menu/home/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/profile/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/search/view.dart';
import 'package:bdaya_social_task/services/posts_service.dart';

@lazySingleton
class NavigationMenuController extends BdayaCombinedController {
  NavigationMenuController(
    this.postsService,
  );
  final PostsService postsService;

  final selectedIndexRx = SharedValue<int>(value: 0);

  final screensList = [
    HomeView.hooked(),
    SearchView.hooked(),
    Center(child: Text('share_moment'.tr())),
    const Center(child: Text('Reels')),
    ProfileView.hooked(),
  ];
}
