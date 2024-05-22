import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/reels/controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({
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
      builder: (context) => ReelsView(
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

  final ReelsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text('reels').tr(),
      ),
    );
  }
}
