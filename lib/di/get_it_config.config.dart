// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/auth/controller.dart' as _i3;
import '../features/profile_info/controller.dart' as _i14;
import '../features/home/navigation_menu/controller.dart' as _i4;
import '../features/home/navigation_menu/moments_share/controller.dart' as _i9;
import '../features/home/navigation_menu/posts/controller.dart' as _i16;
import '../features/home/navigation_menu/profile/controller.dart' as _i15;
import '../features/home/navigation_menu/reels/controller.dart' as _i8;
import '../features/home/navigation_menu/search/controller.dart' as _i7;
import '../features/post_details/controller.dart' as _i17;
import '../services/cache_service.dart' as _i10;
import '../services/grpc_service.dart' as _i5;
import '../services/init_service.dart' as _i6;
import '../services/posts_service.dart' as _i12;
import '../services/routing_service.dart' as _i13;
import '../services/theme_service.dart' as _i18;
import '../services/user_service.dart' as _i11;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthController>(() => _i3.AuthController());
    gh.lazySingleton<_i4.NavigationMenuController>(
        () => _i4.NavigationMenuController());
    gh.lazySingleton<_i5.GrpcService>(() => _i5.GrpcService());
    gh.lazySingleton<_i6.InitService>(() => _i6.InitService());
    gh.lazySingleton<_i7.SearchViewController>(
        () => _i7.SearchViewController());
    gh.lazySingleton<_i8.ReelsController>(() => _i8.ReelsController());
    gh.lazySingleton<_i9.MomentsShareController>(
        () => _i9.MomentsShareController());
    gh.lazySingleton<_i10.CacheServiceBase>(
      () => _i10.MockCacheService(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i11.UserService>(
      () => _i11.FakeUser(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i12.PostsService>(() => _i12.PostsService(
          cacheServiceBase: gh<_i10.CacheServiceBase>(),
          grpcService: gh<_i5.GrpcService>(),
        ));
    gh.lazySingleton<_i13.RoutingService>(
        () => _i13.RoutingService(gh<_i11.UserService>()));
    gh.lazySingleton<_i14.ProfileInfoController>(
        () => _i14.ProfileInfoController(gh<_i11.UserService>()));
    gh.lazySingleton<_i15.ProfileController>(
        () => _i15.ProfileController(gh<_i11.UserService>()));
    gh.lazySingleton<_i11.UserService>(
      () => _i11.RealUser(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.CacheServiceBase>(
      () => _i10.RealCacheService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.PostController>(() => _i16.PostController(
          gh<_i5.GrpcService>(),
          gh<_i10.CacheServiceBase>(),
          gh<_i12.PostsService>(),
        ));
    gh.lazySingleton<_i17.PostDetailsController>(
        () => _i17.PostDetailsController(gh<_i13.RoutingService>()));
    gh.lazySingleton<_i18.ThemeService>(
        () => _i18.ThemeService(gh<_i10.CacheServiceBase>()));
    return this;
  }
}
