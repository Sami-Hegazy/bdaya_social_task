import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/services/user_service.dart';

@lazySingleton
class ProfileController extends BdayaCombinedController {
  ProfileController(this.userService /*add getIt dependencies here*/);

  final UserService userService;
}
