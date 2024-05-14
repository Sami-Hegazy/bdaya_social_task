import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/profile/view.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/home/view.dart';
import 'package:flutter/material.dart';

@lazySingleton
class NavigationMenuController extends BdayaCombinedController {
  NavigationMenuController();

  final selectedIndexRx = SharedValue<int>(value: 0);

  final screensList = [
    HomeView.hooked(),
    const Center(child: Text('second')),
    const Center(child: Text('Third')),
    const Center(child: Text('Fourth')),
    ProfileView.hooked(),
  ];
}
