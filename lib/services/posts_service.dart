import 'dart:convert';
import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/gen/bdaya/social_training_local/v1/local_posts.pb.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:bdaya_social_task/services/grpc_service.dart';

@lazySingleton
class PostsService {
  final CacheServiceBase cacheServiceBase;
  final GrpcService grpcService;

  PostsService({required this.cacheServiceBase, required this.grpcService});
  final postsListRx = SharedValue<List<PostsDto>>(value: []);

  Future<void> init() async {
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    final cachedPosts = cacheServiceBase.getString('posts');
    if (cachedPosts != null) {
      final parsedCategories = jsonDecode(cachedPosts) as List<dynamic>;

      postsListRx.$ = parsedCategories
          .map((e) => PostsDto.create()..mergeFromProto3Json(e))
          .toList();
    }
    final backendPosts = posts;
    postsListRx.$ = backendPosts;
    await cacheServiceBase.setString(
      'posts',
      jsonEncode(backendPosts.map((e) => e.toProto3Json()).toList()),
    );
  }
}

final posts = <PostsDto>[
  PostsDto(id: '1', title: 'Post 1', imageUrl: 'assets/images/pic1.png'),
  PostsDto(id: '2', title: 'Post 2', imageUrl: 'assets/images/pic0.png'),
  PostsDto(id: '3', title: 'Post 3', imageUrl: 'assets/images/pic2.png'),
  PostsDto(id: '4', title: 'Post 4', imageUrl: 'assets/images/pic3.png'),
  PostsDto(id: '5', title: 'Post 5', imageUrl: 'assets/images/pic4.png'),
  PostsDto(id: '6', title: 'Post 6', imageUrl: 'assets/images/pic5.png'),
  PostsDto(id: '7', title: 'Post 7', imageUrl: 'assets/images/pic6.png'),
  PostsDto(id: '8', title: 'Post 8', imageUrl: 'assets/images/pic7.png'),
  PostsDto(id: '9', title: 'Post 9', imageUrl: 'assets/images/pic8.png'),
  PostsDto(id: '10', title: 'Post 10', imageUrl: 'assets/images/pic9.png'),
  PostsDto(id: '11', title: 'Post 11', imageUrl: 'assets/images/pic10.png'),
  PostsDto(id: '12', title: 'Post 12', imageUrl: 'assets/images/pic11.png'),
  PostsDto(id: '13', title: 'Post 13', imageUrl: 'assets/images/pic12.png'),
];
