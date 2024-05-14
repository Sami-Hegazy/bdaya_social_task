import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheServiceBase {
  Future<void> init();
  String? getString(String key);
  Future<void> setString(String key, String? value);

  bool? getBool(String key);
  Future<void> setBool(String key, bool? value);
}

@prod
@LazySingleton(as: CacheServiceBase)
class RealCacheService extends CacheServiceBase {
  SharedPreferences? _instance;

  @override
  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) {
    assert(_instance != null, 'Must Call init before accessing instance');
    return _instance?.getString(key);
  }

  @override
  Future<void> setString(String key, String? value) async {
    final i = _instance;
    assert(i != null, 'Must Call init before accessing instance');
    if (i == null) {
      return;
    }
    if (value != null) {
      await i.setString(key, value);
    } else {
      await i.remove(key);
    }
  }

  @override
  bool? getBool(String key) {
    assert(_instance != null, 'Must Call init before accessing instance');
    return _instance?.getBool(key);
  }

  @override
  Future<void> setBool(String key, bool? value) async {
    final i = _instance;
    assert(i != null, 'Must Call init before accessing instance');
    if (i == null) {
      return;
    }
    if (value != null) {
      await i.setBool(key, value);
    } else {
      await i.remove(key);
    }
  }
}

@dev
@LazySingleton(as: CacheServiceBase)
class MockCacheService extends CacheServiceBase {
  final _cacheMap = <String, String>{};

  @override
  Future<void> init() async {}

  @override
  String? getString(String key) {
    return _cacheMap[key];
  }

  @override
  Future<void> setString(String key, String? value) async {
    if (value == null) {
      _cacheMap.remove(key);
    } else {
      _cacheMap[key] = value;
    }
  }

  @override
  bool? getBool(String key) {
    return true;
  }

  @override
  Future<void> setBool(String key, bool? value) async {}
}
