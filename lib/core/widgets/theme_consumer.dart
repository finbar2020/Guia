import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/state_dark_light_dev.dart';

class ThemeConsumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData theme, T value) builder;

  const ThemeConsumer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, T>(
      builder: (context, themeNotifier, value, child) {
        ThemeData currentTheme = themeNotifier.currentTheme;
        return builder(context, currentTheme, value);
      },
    );
  }
}
