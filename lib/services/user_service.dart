import 'dart:io';
import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/foundation.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';
import 'package:bdaya_social_task/helper/constant.dart';
import 'package:bdaya_social_task/models/user_info.dart';

abstract class UserService {
  final currentUserIdRx = SharedValue<String?>(value: null);
  final logger = Logger('[UserService]');

  Future<void> init();
  Future<void> login();
  Future<void> logout();
  late LocalUserInfo userInfo;
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
      if (event != null) {
        userInfo = LocalUserInfo.fromJson(event.userInfo);
      }

      currentUserIdRx.$ = event?.uid;
    });

    await userManager.init();
  }

  @override
  Future<void> login() async {
    try {
      final OidcUser? user = await userManager.loginAuthorizationCodeFlow();

      if (user != null) {
        userInfo = LocalUserInfo.fromJson(user.userInfo);
      }

      logger.info('User info : ${user?.userInfo}');
    } on OidcException catch (e) {
      logger.severe('Error Occurred while login', e);
    }
  }

  @override
  Future<void> logout() async {
    await userManager.logout();
  }
}
