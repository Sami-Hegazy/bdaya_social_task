import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

@lazySingleton
class ThemeService {
  final SharedValue<FlexColorScheme> appTheme =
      SharedValue<FlexColorScheme>(value: FlexColorScheme.light());
  final CacheServiceBase _cacheService;

  ThemeService(this._cacheService);

  static const String isDark = 'is_dark';

  final darkTheme = FlexColorScheme.dark(scheme: FlexScheme.flutterDash);
  final lightTheme = FlexColorScheme.light(scheme: FlexScheme.greyLaw);

  void toggleTheme() {
    if (appTheme.$ == darkTheme) {
      appTheme.$ = lightTheme;
      _cacheService.setBool(isDark, false);
      _saveTheme(isSavedDark: false);
    } else if (appTheme.$ == lightTheme) {
      appTheme.$ = darkTheme;
      _cacheService.setBool(isDark, true);
      _saveTheme(isSavedDark: true);
    }
  }

  Future<void> loadThemeFromCache() async {
    bool isCacheDark = _cacheService.getBool(isDark) ?? false;
    if (isCacheDark) {
      appTheme.$ = darkTheme;
    } else {
      appTheme.$ = lightTheme;
    }
  }

  Future<void> _saveTheme({required bool isSavedDark}) async {
    await _cacheService.setBool(isDark, isSavedDark);
  }
}
