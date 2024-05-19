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
import '../features/home/navigation_menu/controller.dart' as _i4;
import '../features/home/navigation_menu/home/controller.dart' as _i12;
import '../features/home/navigation_menu/profile/controller.dart' as _i5;
import '../features/post_details/controller.dart' as _i13;
import '../features/posts/controller.dart' as _i6;
import '../services/cache_service.dart' as _i9;
import '../services/grpc_service.dart' as _i7;
import '../services/init_service.dart' as _i8;
import '../services/routing_service.dart' as _i11;
import '../services/theme_service.dart' as _i14;
import '../services/user_service.dart' as _i10;

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
    gh.lazySingleton<_i5.ProfileController>(() => _i5.ProfileController());
    gh.lazySingleton<_i6.PostsController>(() => _i6.PostsController());
    gh.lazySingleton<_i7.GrpcService>(() => _i7.GrpcService());
    gh.lazySingleton<_i8.InitService>(() => _i8.InitService());
    gh.lazySingleton<_i9.CacheServiceBase>(
      () => _i9.MockCacheService(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i10.UserService>(
      () => _i10.FakeUser(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i11.RoutingService>(
        () => _i11.RoutingService(gh<_i10.UserService>()));
    gh.lazySingleton<_i12.HomeController>(() => _i12.HomeController(
          gh<_i7.GrpcService>(),
          gh<_i9.CacheServiceBase>(),
        ));
    gh.lazySingleton<_i9.CacheServiceBase>(
      () => _i9.RealCacheService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.UserService>(
      () => _i10.RealUser(gh<_i9.CacheServiceBase>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.PostDetailsController>(
        () => _i13.PostDetailsController(gh<_i11.RoutingService>()));
    gh.lazySingleton<_i14.ThemeService>(
        () => _i14.ThemeService(gh<_i9.CacheServiceBase>()));
    return this;
  }
}
