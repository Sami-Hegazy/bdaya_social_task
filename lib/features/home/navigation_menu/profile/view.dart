import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/profile/controller.dart';
import 'package:bdaya_social_task/helper/extentions.dart';
import 'package:bdaya_social_task/services/routing_service.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
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
      builder: (context) => ProfileView(
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

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(controller.userService.userInfo.name),
            leading: const Icon(Icons.lock_outline_sharp),
            actions: [
              IconButton(
                  icon: const Icon(Icons.person_add),
                  iconSize: 25.0,
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 25.0,
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.logout),
                  iconSize: 25.0,
                  onPressed: () {
                    getIt<UserService>().logout();
                  })
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/your_acc.png",
                        height: 80.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.userService.userInfo.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          NumTextColumn(
                            number: '72',
                            text: context.posts,
                          ),
                          NumTextColumn(
                            number: '352',
                            text: context.followers,
                          ),
                          NumTextColumn(
                            number: '580',
                            text: context.following,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          height: 40.0,
                          width: 200.0,
                          child: Center(
                            child: Text(
                              context.profileInfo,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          context.goNamed(
                            AppRouteName.profileInfo,
                            extra: controller.userService.userInfo,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 0.5,
              color: Colors.grey[300],
            ),
          ),
          SliverFillRemaining(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      physics: const BouncingScrollPhysics(),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      labelColor: Colors.white,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      tabs: [
                        Tab(
                          child: Icon(
                            Icons.grid_on,
                            size: 30.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            Icons.crop_original,
                            size: 30.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Tab(
                          child: Icon(
                            Icons.perm_contact_calendar,
                            size: 30.0,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        MasonryGridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[300],
                              child: Image.asset(imageList[index]),
                            );
                          },
                        ),
                        const Center(child: Text('Share a moment with world')),
                        MasonryGridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[300],
                              child: Image.asset(imageList[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NumTextColumn extends StatelessWidget {
  const NumTextColumn({
    super.key,
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        child: Column(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> imageList = [
  'assets/images/pic0.png',
  'assets/images/pic1.png',
  'assets/images/pic2.png',
  'assets/images/pic3.png',
  'assets/images/pic4.png',
  'assets/images/pic5.png',
  'assets/images/pic6.png',
  'assets/images/pic6.png',
  'assets/images/pic7.png',
  'assets/images/pic8.png',
  'assets/images/pic9.png',
  'assets/images/pic10.png',
  'assets/images/pic11.png',
  'assets/images/pic12.png',
  'assets/images/pic13.png',
];
