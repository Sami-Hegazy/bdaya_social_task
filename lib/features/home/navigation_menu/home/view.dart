import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/controller.dart';
import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:bdaya_social_task/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
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
      builder: (context) => HomeView(
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
    final theme = getIt<ThemeService>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 30.0,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                iconSize: 25.0,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send),
                iconSize: 25.0,
                onPressed: () {},
              ),
              Switch(
                value: theme.appTheme.of(context) == CustomTheme.darkTheme
                    ? true
                    : false,
                onChanged: (value) => theme.toggleTheme(),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 110.0,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 21,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                (index == 0)
                                    ? "assets/images/your_acc.png"
                                    : "assets/images/friend_acc.png",
                                height: 50.0,
                              ),
                            ),
                            Text((index == 0) ? "You" : " Friend $index")
                          ],
                        );
                      },
                    ),
                  ),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InstagramPostItem(
                  username: 'user_$index',
                  imageUrl: 'assets/images/pic$index.png',
                  likes: index * 10,
                  comments: index * 5,
                  caption: 'This is post number $index',
                );
              },
              childCount: 14, // Number of posts
            ),
          ),
        ],
      ),
    );
  }
}

class InstagramPostItem extends StatelessWidget {
  final String username;
  final String imageUrl;
  final int likes;
  final int comments;
  final String caption;

  const InstagramPostItem({
    super.key,
    required this.username,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/your_acc.png'),
              ),
              const SizedBox(width: 10.0),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          imageUrl,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$likes likes',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      caption,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Text(
                'View all $comments comments',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ],
    );
  }
}


// Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Builder(builder: (context) {
//               final theme = getIt<ThemeService>();
//               return ListTile(
//                 leading: const Icon(Icons.dark_mode),
//                 title: const Text('Dark Mode'),
//                 trailing: Switch(
//                   value: theme.appTheme.of(context) == CustomTheme.darkTheme
//                       ? true
//                       : false,
//                   onChanged: (value) => theme.toggleTheme(),
//                 ),
//               );
//             }),
//             // SizedBox(
//             //   height: 500,
//             //   child: Builder(
//             //     builder: (context) {
//             //       final postList = controller.postList.of(context);
//             //       return ListView.builder(
//             //         itemCount: postList.length,
//             //         itemBuilder: (context, index) {
//             //           return ListTile(
//             //             // key: postList[indesx].,
//             //             title: Text(postList[index].content),
//             //             subtitle: Text(postList[index].id),
//             //           );
//             //         },
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     )