import 'dart:ui';
import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/app/view/app.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/features/home/navigation_menu/view.dart';
import 'package:bdaya_social_task/features/post_details/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    setPathUrlStrategy();
    await EasyLocalization.ensureInitialized();
  });

  testWidgets("App is working", (WidgetTester tester) async {
    Logger.root.onRecord.listen(bdayaOnRecordHandlerFactory());
    SharedPreferences.setMockInitialValues({});
    getIt.allowReassignment = true;
    configureDependencies(env: 'dev');

    await tester.pumpWidget(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'EG'),
      saveLocale: true,
      child: const App(),
    ));

    await tester.pumpAndSettle();

    await tester.tap(
      find.text('Login'),
      kind: PointerDeviceKind.mouse,
    );

    await tester.pumpAndSettle();
    expect(find.byType(NavigationMenuView), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const Key('post_0')),
      kind: PointerDeviceKind.mouse,
    );
    expect(find.byType(PostDetailsView), findsWidgets);
  });
}
