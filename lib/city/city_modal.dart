import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home/controllers/weather_controller.dart';

import 'controllers/city_controller.dart';

class MyCityModal extends StatelessWidget {
  const MyCityModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        final cities = context.watch<CityController>().cities;
        return ListView.builder(
          itemCount: cities.length,
          controller: scrollController,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(cities[index].name),
              onTap: () {
                context.read<CityController>().selectCity(cities[index]);
                context.read<WeatherController>().fetchWeather();
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
