import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

abstract class UserService {
  final currentUser = SharedValue<String?>(value: null);
  final logger = Logger('[UserService]');
  Future<void> init();
}

@dev
@LazySingleton(as: UserService)
class FakeUser extends UserService {
  @override
  Future<void> init() async {
    Logger('[FakeUserService]').info('Init Called');
  }
}

@prod
@LazySingleton(as: UserService)
class RealUser extends UserService {
  @override
  Future<void> init() async {
    Logger('[RealUserService]').info('Init Called');
  }
}
