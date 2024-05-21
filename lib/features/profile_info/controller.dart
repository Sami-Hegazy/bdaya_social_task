import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/services/user_service.dart';

@lazySingleton
class ProfileInfoController extends BdayaCombinedController {
  ProfileInfoController(this.userService);

  final UserService userService;
}
