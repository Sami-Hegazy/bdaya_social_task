import 'dart:async';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:bdaya_social_task/services/posts_service.dart';
import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:async/async.dart';

@lazySingleton
class InitService {
  final memoizer = AsyncMemoizer<void>();

  Future<void> init() {
    return memoizer.runOnce(() => Future.wait([
          _actualInit(),
          // Future.delayed(const Duration(seconds: 3)),
        ]));
  }

  Future<void> _actualInit() async {
    await getIt<UserService>().init();
    await getIt<CacheServiceBase>().init();
    await getIt<ThemeService>().loadThemeFromCache();
    await getIt<PostsService>().init();
  }
}
