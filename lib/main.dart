import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home/controllers/theme_controller.dart';
import 'package:weather_app/shared/themes/dark_theme.dart';
import 'package:weather_app/shared/themes/light_theme.dart';

import 'city/city_failure_page.dart';
import 'city/city_loading_page.dart';
import 'city/controllers/city_controller.dart';
import 'home/home_page.dart';
import 'store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store();
  store.themeController.loadTheme();
  store.cityController.loadCities();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: store.cityController),
        ChangeNotifierProvider.value(value: store.weatherController),
        ChangeNotifierProvider.value(value: store.themeController),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      darkTheme: getDarKTheme(),
      themeMode: context.watch<ThemeController>().themeMode,
      builder: (context, child) {
        return Consumer<CityController>(
          builder: (context, value, _) {
            if (value.status.isLoading) {
              return const MyCityLoadinagPage();
            }
            if (value.status.isFailure) {
              return const MyCityFailurePage();
            }
            return child!;
          },
        );
      },
      home: const MyHomePage(),
    );
  }
}
