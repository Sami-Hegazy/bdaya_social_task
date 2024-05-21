import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:go_router/go_router.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class NavigationMenuView extends StatelessWidget {
  const NavigationMenuView({
    super.key,
    required this.controller,
    required this.navigationShell,
  });

  static Widget hooked({
    BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
    String? instanceName,
    Object? param1,
    Object? param2,
    List<Object?>? keys,
    required StatefulNavigationShell navigationShell,
  }) {
    return HookBuilder(
      builder: (context) => NavigationMenuView(
        navigationShell: navigationShell,
        controller: useBdayaViewController(
          hookMode: hookMode,
          instanceName: instanceName,
          keys: keys,
          param1: param1,
          param2: param2,
        ),
      ),
    );
  }

  final NavigationMenuController controller;
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 45,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        selectedIndex: controller.selectedIndexRx.of(context),
        onDestinationSelected: (index) {
          controller.selectedIndexRx.$ = index;
          _goBranch(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: ''),
          NavigationDestination(icon: Icon(Icons.search), label: ''),
          NavigationDestination(icon: Icon(Icons.add_box_outlined), label: ''),
          NavigationDestination(
              icon: Icon(Icons.slow_motion_video_sharp), label: ''),
          NavigationDestination(icon: Icon(Icons.person_pin), label: ''),
        ],
      ),
      body: navigationShell,
    );
  }
}
