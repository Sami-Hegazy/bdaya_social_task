import 'dart:async';
import 'dart:developer';
import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/di/get_it_config.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.onRecord.listen(bdayaOnRecordHandlerFactory());

  getIt.allowReassignment = true;
  setPathUrlStrategy();

  configureDependencies(env: 'prod');
  runApp(await builder());
}
