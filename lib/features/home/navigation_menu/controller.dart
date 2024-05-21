import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';

@lazySingleton
class NavigationMenuController extends BdayaCombinedController {
  NavigationMenuController();

  final selectedIndexRx = SharedValue<int>(value: 0);
}
