import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/common.pb.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/post.pb.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/service.pb.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:bdaya_social_task/services/grpc_service.dart';
import 'package:bdaya_social_task/services/posts_service.dart';

@lazySingleton
class PostController extends BdayaCombinedController {
  PostController(
    this.grpcService,
    this.cacheService,
    this.postsService,
  );

  final GrpcService grpcService;
  final CacheServiceBase cacheService;
  final PostsService postsService;

  final postList = SharedValue<List<Post>>(value: []);

  Future<void> getPosts() async {
    final response = await grpcService.postApi.listPosts(
      ListPostsRequest(
        filter: ListPostsFilter(
          reviewStatus: PostReviewStatus.POST_REVIEW_STATUS_ACCEPTED,
        ),
        pagination: InfiniteScrollPaginationInfo(),
      ),
    );

    postList.$ = response.posts;
  }
}
