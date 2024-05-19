import 'dart:io';
import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:bdaya_social_task/helper/constant.dart';
import 'package:bdaya_social_task/models/user_info.dart';
import 'package:bdaya_social_task/services/cache_service.dart';
import 'package:flutter/foundation.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';

abstract class UserService {
  final currentUserIdRx = SharedValue<String?>(value: null);
  final logger = Logger('[UserService]');
  Future<void> init();
  Future<void> login();
  Future<void> logout();
}

@dev
@LazySingleton(as: UserService)
class FakeUser extends UserService {
  @override
  Future<void> init() async {
    Logger('[FakeUserService]').info('Init Called');
  }

  @override
  Future<void> login() async {
    currentUserIdRx.$ = 'sami';
  }

  @override
  Future<void> logout() async {
    currentUserIdRx.$ = null;
  }
}

@prod
@LazySingleton(as: UserService)
class RealUser extends UserService {
  final CacheServiceBase _cacheServiceBase;
  RealUser(this._cacheServiceBase);

  final OidcUserManager userManager = OidcUserManager.lazy(
    discoveryDocumentUri:
        OidcUtils.getOpenIdConfigWellKnownUri(Uri.parse(AUTH0_ISSUER_2)),
    clientCredentials:
        const OidcClientAuthentication.none(clientId: AUTH0_CLIENT_ID_2),
    store: OidcDefaultStore(),
    settings: OidcUserManagerSettings(
      scope: ['openid', 'profile', 'email', 'offline_access'],
      postLogoutRedirectUri: kIsWeb
          ? Uri.parse(REDIRECT_WEB_URL)
          : Platform.isIOS || Platform.isMacOS || Platform.isAndroid
              ? Uri.parse(AUTH_REDIRECT_URL_2)
              : Platform.isWindows || Platform.isLinux
                  ? Uri.parse('http://localhost:0')
                  : Uri(),
      redirectUri: kIsWeb
          ? Uri.parse(REDIRECT_WEB_URL)
          : Platform.isIOS || Platform.isMacOS || Platform.isAndroid
              ? Uri.parse(AUTH_REDIRECT_URL_2)
              : Platform.isWindows || Platform.isLinux
                  ? Uri.parse('http://localhost:0')
                  : Uri(),
      options: const OidcPlatformSpecificOptions(
        web: OidcPlatformSpecificOptions_Web(
          navigationMode: OidcPlatformSpecificOptions_Web_NavigationMode.popup,
        ),
      ),
    ),
  );

  @override
  Future<void> init() async {
    Logger('[RealUserService]').info('Init Called');

    userManager.userChanges().listen((event) {
      currentUserIdRx.$ = event?.uid;
    });

    await userManager.init();
  }

  @override
  Future<void> login() async {
    try {
      final OidcUser? user = await userManager.loginAuthorizationCodeFlow();

      if (user != null) {
        // User userInfo = User(
        //   name: user.userInfo['name'],
        //   email: user.userInfo['email'],
        // );
      }

      logger.info('idToken : ${user?.token.idToken}');
      logger.info('idToken : ${user?.idToken}');
      logger.info('idToken : ${user?.token}');

      logger.info('User info : ${user?.userInfo}');
    } on OidcException catch (e) {
      logger.severe('Error Occurred while login', e);
    }
  }

  @override
  Future<void> logout() async {
    await userManager.logout();
  }

  Future<bool> isTokenValid() async {
    final String? token = await _getToken();
    // Implement your token validation logic here
    // For example, you can decode the token and check its expiry
    return token != null; // Placeholder validation logic
  }

  Future<void> refreshToken2() async {
    try {
      await userManager.refreshToken();
    } on OidcException catch (e) {
      logger.severe('Error Occurred while refreshing token', e);
    }
  }

  Future<void> refreshToken() async {
    final String? token = await _getToken();
    if (token != null) {
      // Implement your token refreshing logic here
      // For example, you can use the refresh token to obtain a new access token
      // and update it in SharedPreferences
    }
  }

  Future<void> _saveToken(String token) async {
    await _cacheServiceBase.setString('accessToken', token);
  }

  Future<String?> _getToken() async {
    return _cacheServiceBase.getString('accessToken');
  }
}
