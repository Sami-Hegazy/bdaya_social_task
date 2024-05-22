import 'package:bdaya_social_task/services/theme_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
      ).animate().fade(delay: const Duration(seconds: 1)).scaleX(),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          iconSize: 25.0,
          onPressed: () {},
        ),
        Switch(
          value: theme.appTheme.of(context) ==
                  FlexColorScheme.dark(scheme: FlexScheme.flutterDash)
              ? true
              : false,
          onChanged: (value) => theme.toggleTheme(),
        ),
        IconButton(
          icon: const Icon(Icons.language),
          iconSize: 25.0,
          onPressed: () async {
            Locale currentLocale = context.locale;
            if (currentLocale.languageCode == 'ar') {
              await context.setLocale(const Locale('en', 'US'));
            } else {
              await context.setLocale(const Locale('ar', 'EG'));
            }
            final engine = WidgetsFlutterBinding.ensureInitialized();
            engine.performReassemble();
          },
        )
      ],
    );
  }
}
