import 'package:flutter/material.dart';

import 'colors.dart';

getDarKTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: mainColor,
    brightness: Brightness.dark,
  );
  final base = ThemeData.from(
    colorScheme: colorScheme,
  );

  return base;
}
