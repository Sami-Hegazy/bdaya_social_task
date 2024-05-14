import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  final NavigationMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Sami_Hegazi'),
            leading: const Icon(Icons.lock_outline_sharp),
            actions: [
              IconButton(
                  icon: const Icon(Icons.update),
                  iconSize: 25.0,
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.person_add),
                  iconSize: 25.0,
                  onPressed: () {}),
              IconButton(
                  icon: const Icon(Icons.format_list_bulleted),
                  iconSize: 25.0,
                  onPressed: () {}),
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
                        child: const Text(
                          "Sami Hegazi",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          GestureDetector(
                            child: const Column(
                              children: <Widget>[
                                Text(
                                  "72",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    "posts",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              child: const Column(
                                children: <Widget>[
                                  Text(
                                    "352",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      "followers",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: GestureDetector(
                              child: const Column(
                                children: <Widget>[
                                  Text(
                                    "580",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      "following",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0))),
                          height: 30.0,
                          width: 200.0,
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {},
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
            fillOverscroll: true,
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
                        // StaggeredGridView.countBuilder(
                        //   crossAxisCount: 3,
                        //   itemCount: 20, // Number of items in your grid
                        //   itemBuilder: (BuildContext context, int index) =>
                        //       Container(
                        //     color: Colors.grey,
                        //     child: Center(
                        //       child: Text(
                        //         'Item $index',
                        //         style: const TextStyle(fontSize: 20),
                        //       ),
                        //     ),
                        //   ),
                        //   staggeredTileBuilder: (int index) =>
                        //       StaggeredTile.count(1,
                        //           index.isEven ? 1.5 : 1), // Adjust tile height
                        //   mainAxisSpacing: 4.0,
                        //   crossAxisSpacing: 4.0,
                        // ),
                        // Wrap(
                        //   clipBehavior: Clip.none,
                        //   children: [
                        //     for (var i = 0; i < 100; i++)
                        //       Container(
                        //         margin: const EdgeInsets.all(8),
                        //         color: Colors.amber,
                        //         height: 50,
                        //         width: MediaQuery.of(context).size.width / 4,
                        //       ),
                        //   ],
                        // ),
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

List<String> imageList = [
  'assets/images/pic0.png',
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
  'assets/images/pic15.png',
];
