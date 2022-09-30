import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home/controllers/weather_controller.dart';

class MyMetricButton extends StatelessWidget {
  const MyMetricButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) {
        return IconButton(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
          icon: Text(
            controller.selectedMetric.isCelsius ? '˚C' : '˚F',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          onPressed: controller.changeMetric,
        );
      },
    );
  }
}
