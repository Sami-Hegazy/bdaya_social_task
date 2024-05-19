import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Translate on BuildContext {
  String get login => tr('login');
  String get signUp => tr('sign_up');
  String get likes => tr('likes');
  String get viewComments => tr('view_comments');
  String get search => tr('search');
  String get followers => tr('followers');
  String get following => tr('following');
  String get editProfile => tr('Edit Profile');
  String get shareMoment => tr('share_moment');
  String get posts => tr('posts');
}
