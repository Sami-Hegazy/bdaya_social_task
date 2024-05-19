import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/post.pb.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:bdaya_social_task/services/grpc_service.dart';
import 'package:bdaya_social_task/services/posts_service.dart';

@lazySingleton
class HomeController extends BdayaCombinedController {
  HomeController(
    this.grpcService,
    this.cacheService,
    this.postsService,
  );

  final GrpcService grpcService;
  final CacheServiceBase cacheService;
  final PostsService postsService;
  final postList = SharedValue<List<Post>>(value: []);

  final currentTab = SharedValue(value: 0);
  final currentPage = SharedValue(value: 0);

  // Future<void> getPosts() async {
  //   final response = await grpcService.postApi.listPosts(
  //     ListPostsRequest(
  //       filter: ListPostsFilter(
  //         reviewStatus: PostReviewStatus.POST_REVIEW_STATUS_ACCEPTED,
  //       ),
  //       pagination: InfiniteScrollPaginationInfo(),
  //     ),
  //   );

  //   postList.$ = response.posts;
  // }

  // Future<Post> getUserInfo() async {
  //   final response = await grpcService.postApi.getPost(GetPostRequest(id: '1'));

  //   Post p = response.result;

  //   return p;
  // }
}
