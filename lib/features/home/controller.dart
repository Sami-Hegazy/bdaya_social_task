import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/common.pb.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/post.pb.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training/v1/service.pb.dart';
import 'package:bdaya_social_task/services/grpc_service.dart';

@lazySingleton
class HomeController extends BdayaCombinedController {
  HomeController(
    this.grpcService,
  );

  final GrpcService grpcService;

  Future<List<Post>> getPosts() async {
    final response = await grpcService.postApi.listPosts(
      ListPostsRequest(
        filter: ListPostsFilter(
          reviewStatus: PostReviewStatus.POST_REVIEW_STATUS_ACCEPTED,
        ),
        pagination: InfiniteScrollPaginationInfo(),
      ),
    );

    print(response.posts);

    return response.posts;
  }
}
