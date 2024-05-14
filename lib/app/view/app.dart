import 'dart:ui';
import 'package:bdaya_shared_value/bdaya_shared_value.dart';
import 'package:bdaya_social_task/app/view/splash.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:bdaya_social_task/services/init_service.dart';
import 'package:bdaya_social_task/services/routing_service.dart';
import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedValue.wrapApp(
      Builder(builder: (context) {
        return MaterialApp.router(
          theme: getIt<ThemeService>().appTheme.of(context),
          // darkTheme: ThemeData.dark(),
          // themeMode: ,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {...PointerDeviceKind.values},
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<RoutingService>().router,
          builder: (context, child) {
            return FutureBuilder(
              future: getIt<InitService>().init(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.error!);
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return child!;
                }
                return const SplashScreen();
              },
            );
          },
        );
      }),
    );
  }
}
