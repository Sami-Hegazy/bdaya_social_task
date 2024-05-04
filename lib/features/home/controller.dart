import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

@lazySingleton
class HomeController extends BdayaCombinedController {
  // final GrpcService grpcService;
  // final CacheServiceBase cacheServiceBase;
  // final CategoriesService categoriesService;
  // HomeController(
  //     this.grpcService, this.cacheServiceBase, this.categoriesService);

  // Future<void> getPosts() async {
  //   final response = await grpcService.postApi.listPosts(ListPostsRequest(
  //     filter: ListPostsFilter(
  //       reviewStatus: PostReviewStatus.POST_REVIEW_STATUS_ACCEPTED,
  //     ),
  //     pagination: InfiniteScrollPaginationInfo(),
  //   ));
  // }
}

//gen command creation
 //buf generate buf.build/bdaya-dev/social-media-training --include-wkt --include-imports