import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'controller.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
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
      builder: (context) => EditProfileView(
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

  final EditProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 50,
              // You can use a placeholder image or load the user's profile picture here
              backgroundImage: AssetImage('assets/images/friend_acc.png'),
            ),
            const SizedBox(height: 20),
            ReadOnlyTextField(label: controller.userService.userInfo.name),
            ReadOnlyTextField(label: controller.userService.userInfo.givenName),
            ReadOnlyTextField(
                label: controller.userService.userInfo.familyName),
            ReadOnlyTextField(label: controller.userService.userInfo.email),
            ReadOnlyTextField(label: controller.userService.userInfo.website),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save changes functionality here
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadOnlyTextField extends StatelessWidget {
  final String label;

  const ReadOnlyTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        // border: const OutlineInputBorder(),
      ),
    );
  }
}
