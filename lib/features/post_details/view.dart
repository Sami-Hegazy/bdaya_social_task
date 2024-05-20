import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/features/post_details/widgets/comment.dart';
import 'package:bdaya_social_task/services/posts_service.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({
    super.key,
    required this.controller,
  });

  static Widget hooked({
    BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
    String? instanceName,
    Object? param1,
    Object? param2,
    List<Object?>? keys,
  }) =>
      HookBuilder(
        builder: (context) => PostDetailsView(
          controller: useBdayaViewController(
            hookMode: hookMode,
            instanceName: instanceName,
            keys: keys,
            param1: param1,
            param2: param2,
          ),
        ),
      );

  final PostDetailsController controller;

  @override
  Widget build(BuildContext context) {
    final id = controller.idRx.of(context);
    if (id == null) {
      return const SizedBox.shrink();
    }
    //see also BdayaMultiLoadableAreaWrapper, and BdayaLoadableAreaWrapper.custom
    return BdayaLoadableAreaWrapper(
      area: controller.defaultArea,
      builder: (context) {
        //start using details after loading is done
        // final details = controller.detailsRx.of(context);
        // if (details == null) {
        //   return const SizedBox.shrink();
        // }

        // final postsList = controller.postsService.postsListRx.of(context);
        final postsList = getIt<PostsService>().postsListRx.of(context);

        //show details here
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                // leading: const CustomBackButton(),
                expandedHeight: 500,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    postsList[int.parse(id)].title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      postsList[int.parse(id)].imageUrl,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'All Post Comments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: dummyComments.length,
                itemBuilder: (context, index) {
                  return Comments(
                    comment: dummyComments[index],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> dummyComments = [
  'Great post!',
  'Thanks for sharing.',
  'Nice picture!',
  'Awesome!',
  'Very informative.',
  'I totally agree!',
  'Well said!',
  'This is so helpful!',
  'Love this!',
  'Amazing content!',
  'Very well written.',
  'This is gold!',
  'Keep up the great work!',
  'This is exactly what I needed.',
  'Fantastic!',
  'Brilliant post!',
  'So insightful!',
  'Highly recommend reading this.',
  'Couldn\'t agree more.',
  'You nailed it!',
  'Super useful information.',
  'This was a great read.',
  'Thanks for the tips!',
  'Really enjoyed this post.',
  'Exceptional!',
  'Can’t wait to read more from you.',
  'Top-notch!',
  'This is the best post I’ve seen today.',
  'You explained this perfectly.',
  'Such a great perspective.',
  'Learned a lot from this post.',
  'Really well-explained.',
  'You make it look so easy!',
  'A great reminder, thank you!',
  'This is incredibly valuable.',
  'Well done!',
  'Really inspiring.',
  'I appreciate this post.',
  'This just made my day!',
  'So much wisdom here.',
  'Absolutely spot on!',
  'Perfectly articulated.',
  'Thanks for the inspiration!',
  'This is so detailed!',
  'Incredible insights!',
  'I found this very helpful.',
  'Such a good point!',
  'This is really eye-opening.',
  'You’ve got a new follower!',
  'I love how you explained this.',
];
