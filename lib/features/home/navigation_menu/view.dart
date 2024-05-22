import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    getDevice() {
      return MediaQuery.of(context).size.width <= 800 ? "Mobile" : "Tablet";
    }

    final List<IconData> icons = [
      Icons.home,
      Icons.search,
      Icons.explore_outlined,
      Icons.slow_motion_video_sharp,
      Icons.person_pin,
    ];

    List<String> title = [
      'home'.tr(),
      'search'.tr(),
      'explore'.tr(),
      'reels'.tr(),
      'profile'.tr(),
    ];

    return Scaffold(
      bottomNavigationBar: getDevice() == 'Mobile'
          ? NavigationBar(
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
                NavigationDestination(
                    icon: Icon(Icons.add_box_outlined), label: ''),
                NavigationDestination(
                    icon: Icon(Icons.slow_motion_video_sharp), label: ''),
                NavigationDestination(icon: Icon(Icons.person_pin), label: ''),
              ],
            )
          : null,
      body: getDevice() == 'Mobile'
          ? navigationShell
          : Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 18, bottom: 18),
                      child: const Text(
                        'Instagram',
                        style: TextStyle(
                          fontFamily: 'Billabong',
                          fontSize: 30.0,
                        ),
                      )
                          .animate()
                          .fade(delay: const Duration(seconds: 1))
                          .scaleX(),
                    ),
                    SizedBox(
                      width: 180,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: icons.length,
                        itemBuilder: (context, index) {
                          return VerticalNavItem(
                            icon: icons[index],
                            title: title[index],
                            onTap: () {
                              controller.selectedIndexRx.$ = index;
                              _goBranch(index);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: navigationShell,
                ),
              ],
            ),
    );
  }
}

class VerticalNavItem extends StatelessWidget {
  const VerticalNavItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final void Function()? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        title: AutoSizeText(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          minFontSize: 6,
        ),
        leading: Icon(
          icon,
          size: 35,
        ),
        onTap: onTap,
      ),
    );
  }
}
