import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:bdaya_social_task/theme/custom_theme.dart';
import 'package:flutter/material.dart';

@lazySingleton
class ThemeService {
  final SharedValue<ThemeData> appTheme =
      SharedValue<ThemeData>(value: CustomTheme.lightTheme);
  final CacheServiceBase _cacheService;

  ThemeService(this._cacheService);

  static const String isDark = 'is_dark';

  void toggleTheme() {
    if (appTheme.$ == CustomTheme.darkTheme) {
      appTheme.$ = CustomTheme.lightTheme;
      _cacheService.setBool(isDark, false);
      _saveTheme(isSavedDark: false);
    } else if (appTheme.$ == CustomTheme.lightTheme) {
      appTheme.$ = CustomTheme.darkTheme;
      _cacheService.setBool(isDark, true);
      _saveTheme(isSavedDark: true);
    }
  }

  Future<void> loadThemeFromCache() async {
    bool isCacheDark = _cacheService.getBool(isDark) ?? false;
    if (isCacheDark) {
      appTheme.$ = CustomTheme.darkTheme;
    } else {
      appTheme.$ = CustomTheme.lightTheme;
    }
  }

  Future<void> _saveTheme({required bool isSavedDark}) async {
    await _cacheService.setBool(isDark, isSavedDark);
  }
}
