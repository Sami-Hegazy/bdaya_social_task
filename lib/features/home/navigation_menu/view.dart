import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class NavigationMenuView extends StatelessWidget {
  const NavigationMenuView({
    super.key,
    required this.controller,
  });

  static Widget hooked({
    BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
    String? instanceName,
    Object? param1,
    Object? param2,
    List<Object?>? keys,
  }) {
    return HookBuilder(
      builder: (context) => NavigationMenuView(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 45,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 0,
        selectedIndex: controller.selectedIndexRx.of(context),
        onDestinationSelected: (value) {
          controller.selectedIndexRx.$ = value;
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
      body: controller.screensList[controller.selectedIndexRx.of(context)],
    );
  }
}
