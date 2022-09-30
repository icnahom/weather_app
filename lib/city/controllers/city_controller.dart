import 'package:flutter/cupertino.dart';

import '../../shared/models/city.dart';
import '../../shared/models/status.dart';
import '../../store.dart';

class CityController with ChangeNotifier, StatusProviderMixin {
  CityController(this.store);
  final Store store;

  List<City> cities = [];
  City? selectedCity;

  bool get isCitySelected => selectedCity != null;

  Future<void> loadCities() async {
    status = Status.loading;
    try {
      cities = await store.cityService.loadCities();
      status = Status.success;
    } catch (e) {
      status = Status.failure;
    }
  }

  void selectCity(City city) {
    if (selectedCity == city) return;
    selectedCity = city;
    notifyListeners();
  }
}
