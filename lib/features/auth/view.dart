import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/services/user_service.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({
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
      builder: (context) => AuthView(
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

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Welcome to Auth'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getIt<UserService>().currentUser.$ = 'Sami';
        },
        child: const Text('Login'),
      ),
    );
  }
}
