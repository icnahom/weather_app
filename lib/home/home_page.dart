import 'package:flutter/material.dart';

import 'metric_button.dart';
import 'select_city_button.dart';
import 'theme_mode_button.dart';
import 'weather_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        leading: const MyThemeModeButton(),
        actions: const [MyMetricButton()],
      ),
      body: SizedBox.expand(
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: MyWeatherCard(),
              ),
            ),
            MySelectCityButton(),
          ],
        ),
      ),
    );
  }
}
