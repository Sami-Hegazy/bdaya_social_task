import 'package:bdaya_social_task/app/view/app.dart';
import 'package:bdaya_social_task/bootstrap.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (details) {
    print(details.toStringShort());
  };
  bootstrap(() => const App());
}
