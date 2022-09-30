import 'package:flutter/material.dart';

import 'colors.dart';

getLightTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: mainColor,
  );
  final base = ThemeData.from(
    colorScheme: colorScheme,
  );

  return base;
}
