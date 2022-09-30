import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/shared/models/city.dart';

import '../city/controllers/city_controller.dart';
import '../shared/models/weather.dart';
import 'controllers/weather_controller.dart';

class MyWeatherCard extends StatelessWidget {
  const MyWeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityController>(
      builder: (context, value, child) {
        if (!value.isCitySelected) {
          return const MyWeatherIdle();
        }
        final selectedCity = value.selectedCity!;
        return Consumer<WeatherController>(
          builder: (context, value, child) {
            if (value.status.isLoading) {
              return const MyWeatherLoading();
            }
            if (value.status.isFailure) {
              return const MyWeatherFailure();
            }
            return MyWeatherSuccess(
              weather: value.weather!,
              metric: value.selectedMetric,
              city: selectedCity,
            );
          },
        );
      },
    );
  }
}

class MyWeatherIdle extends StatelessWidget {
  const MyWeatherIdle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Select a city.');
  }
}

class MyWeatherLoading extends StatelessWidget {
  const MyWeatherLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class MyWeatherSuccess extends StatelessWidget {
  const MyWeatherSuccess(
      {Key? key, required this.weather, required this.metric, required this.city})
      : super(key: key);
  final Weather weather;
  final Metric metric;
  final City city;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            city.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: .75,
              child: FittedBox(
                child: Icon(
                  getWeatherIcon(weather.id),
                ),
              ),
            ),
          ),
          Text(
            metric.isCelsius
                ? '${weather.tempInCelsius}˚C'
                : '${weather.tempInFahrenheit}˚F',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Text(
            weather.main,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class MyWeatherFailure extends StatelessWidget {
  const MyWeatherFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.read<WeatherController>().fetchWeather,
      child: const Text("Couldn't load weather. Tap to retry."),
    );
  }
}

// Return const IconData to help tree shake icons fonts
IconData getWeatherIcon(int code) {
  const fontFamily = 'Pe-icon-7-weather';
  if (code <= 232) {
    return const IconData(
      0xe61a,
      fontFamily: fontFamily,
    );
  }
  if (code <= 321) {
    return const IconData(
      0xe628,
      fontFamily: fontFamily,
    );
  }
  if (code <= 531) {
    return const IconData(
      0xe613,
      fontFamily: fontFamily,
    );
  }
  if (code <= 622) {
    return const IconData(
      0xe60d,
      fontFamily: fontFamily,
    );
  }

  if (code <= 781) {
    return const IconData(
      0xe625,
      fontFamily: fontFamily,
    );
  }

  if (code == 800) {
    return const IconData(
      0xe60c,
      fontFamily: fontFamily,
    );
  }

  if (code <= 804) {
    return const IconData(
      0xe636,
      fontFamily: fontFamily,
    );
  }

  return const IconData(
    0xe63a,
    fontFamily: fontFamily,
  );
}
