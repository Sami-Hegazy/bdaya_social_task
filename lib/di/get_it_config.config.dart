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
import '../features/home/controller.dart' as _i4;
import '../features/post_details/controller.dart' as _i9;
import '../features/posts/controller.dart' as _i5;
import '../services/init_service.dart' as _i6;
import '../services/routing_service.dart' as _i8;
import '../services/user_service.dart' as _i7;

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
    gh.lazySingleton<_i4.HomeController>(() => _i4.HomeController());
    gh.lazySingleton<_i5.PostsController>(() => _i5.PostsController());
    gh.lazySingleton<_i6.InitService>(() => _i6.InitService());
    gh.lazySingleton<_i7.UserService>(
      () => _i7.FakeUser(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i8.RoutingService>(
        () => _i8.RoutingService(gh<_i7.UserService>()));
    gh.lazySingleton<_i7.UserService>(
      () => _i7.RealUser(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.PostDetailsController>(
        () => _i9.PostDetailsController(gh<_i8.RoutingService>()));
    return this;
  }
}
