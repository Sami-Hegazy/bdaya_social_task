import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:bdaya_social_task/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.theme,
  });

  final ThemeService theme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'Instagram',
        style: TextStyle(
          fontFamily: 'Billabong',
          fontSize: 30.0,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          iconSize: 25.0,
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.send),
          iconSize: 25.0,
          onPressed: () {},
        ),
        Switch(
          value: theme.appTheme.of(context) == CustomTheme.darkTheme
              ? true
              : false,
          onChanged: (value) => theme.toggleTheme(),
        ),
        IconButton(
          icon: const Icon(Icons.language),
          iconSize: 25.0,
          onPressed: () {
            Locale currentLocale = context.locale;
            if (currentLocale.languageCode == 'ar') {
              context.setLocale(const Locale('en', 'US'));
            } else {
              context.setLocale(const Locale('ar', 'EG'));
            }
          },
        )
      ],
    );
  }
}
