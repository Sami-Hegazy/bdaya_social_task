import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/controller.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/widgets/home_app_bar.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/widgets/post_item.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/posts/widgets/stories.dart';
import 'package:bdaya_social_task/services/routing_service.dart';
import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PostView extends StatelessWidget {
  const PostView({
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
      builder: (context) => PostView(
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

  final PostController controller;

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeService>();
    const momentCount = 5;
    const momentDuration = Duration(seconds: 5);

    final images = List.generate(
      momentCount,
      (idx) => Container(
        color: const Color(0xFF1C1B1F),
        child: Image.asset('assets/images/pic$idx.png'),
      ),
    );

    final postsList = controller.postsService.postsListRx.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeAppBar(theme: theme),
          Stories(momentDuration: momentDuration, images: images),
          SliverToBoxAdapter(
            child: Divider(
              height: 0.5,
              color: Colors.grey[300],
            ),
          ),
          SliverList.builder(
            itemCount: postsList.length,
            itemBuilder: (context, index) {
              return Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                delay: const Duration(milliseconds: 500),
                child: SizedBox(
                  child: PostItem(
                    key: Key('post_$index'),
                    onTap: () {
                      context.goNamed(
                        AppRouteName.postDetails,
                        pathParameters: {kPostId: index.toString()},
                      );
                    },
                    username: 'user_$index',
                    imageUrl: postsList[index].imageUrl,
                    likes: index == 0 ? 5 : index * 10,
                    comments: index * 5,
                    caption: postsList[index].title,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
