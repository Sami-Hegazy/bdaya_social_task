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
import '../features/edit_profile/controller.dart' as _i6;
import '../features/home/navigation_menu/controller.dart' as _i11;
import '../features/post_details/controller.dart' as _i12;
import '../services/cache_service.dart' as _i7;
import '../services/grpc_service.dart' as _i4;
import '../services/init_service.dart' as _i5;
import '../services/posts_service.dart' as _i9;
import '../services/routing_service.dart' as _i10;
import '../services/theme_service.dart' as _i13;
import '../services/user_service.dart' as _i8;

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
    gh.lazySingleton<_i4.GrpcService>(() => _i4.GrpcService());
    gh.lazySingleton<_i5.InitService>(() => _i5.InitService());
    gh.lazySingleton<_i6.EditProfileController>(
        () => _i6.EditProfileController());
    gh.lazySingleton<_i7.CacheServiceBase>(
      () => _i7.MockCacheService(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i8.UserService>(
      () => _i8.FakeUser(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i9.PostsService>(() => _i9.PostsService(
          cacheServiceBase: gh<_i7.CacheServiceBase>(),
          grpcService: gh<_i4.GrpcService>(),
        ));
    gh.lazySingleton<_i10.RoutingService>(
        () => _i10.RoutingService(gh<_i8.UserService>()));
    gh.lazySingleton<_i8.UserService>(
      () => _i8.RealUser(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.NavigationMenuController>(
        () => _i11.NavigationMenuController(
              gh<_i9.PostsService>(),
              gh<_i8.UserService>(),
            ));
    gh.lazySingleton<_i7.CacheServiceBase>(
      () => _i7.RealCacheService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.PostDetailsController>(
        () => _i12.PostDetailsController(gh<_i10.RoutingService>()));
    gh.lazySingleton<_i13.ThemeService>(
        () => _i13.ThemeService(gh<_i7.CacheServiceBase>()));
    return this;
  }
}
