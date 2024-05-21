import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/moments_share/controller.dart';
import 'package:bdaya_social_task/helper/extentions.dart';
import 'package:flutter/material.dart';

class MomentsShareView extends StatelessWidget {
  const MomentsShareView({
    super.key,
    required this.controller,
  });

  static Widget hooked({
    BdayaGetItHookMode hookMode = BdayaGetItHookMode.lazySingleton,
    String? instanceName,
    Object? param1,
    Object? param2,
    List<Object?>? keys,
  }) {
    return HookBuilder(
      builder: (context) => MomentsShareView(
        controller: useBdayaViewController(
          hookMode: hookMode,
          instanceName: instanceName,
          keys: keys,
          param1: param1,
          param2: param2,
        ),
      ),
    );
  }

  final MomentsShareController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.shareMoment),
      ),
    );
  }
}
