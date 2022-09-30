import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/theme_controller.dart';

class MyThemeModeButton extends StatelessWidget {
  const MyThemeModeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return IconButton(
      icon: Icon(
        isLightMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
      ),
      color: Theme.of(context).colorScheme.onBackground,
      onPressed: context.read<ThemeController>().changeTheme,
    );
  }
}
