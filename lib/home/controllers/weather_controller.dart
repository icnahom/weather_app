import 'package:flutter/cupertino.dart';

import '../../shared/models/city.dart';
import '../../shared/models/status.dart';
import '../../shared/models/weather.dart';
import '../../store.dart';

class WeatherController with ChangeNotifier, StatusProviderMixin {
  WeatherController(this.store);
  final Store store;

  Weather? weather;
  Metric selectedMetric = Metric.celsius;

  City? get _selectedCity => store.cityController.selectedCity;

  Future<void> fetchWeather() async {
    if (_selectedCity == null) return;
    status = Status.loading;
    try {
      weather = await store.weatherService.fetchWeather(_selectedCity!);
      status = Status.success;
    } catch (e) {
      status = Status.failure;
    }
  }

  void changeMetric() {
    if (selectedMetric == Metric.celsius) {
      selectedMetric = Metric.fahrenheit;
    } else if (selectedMetric == Metric.fahrenheit) {
      selectedMetric = Metric.celsius;
    }
    notifyListeners();
  }
}

enum Metric {
  celsius,
  fahrenheit;

  bool get isCelsius => this == celsius;
}
