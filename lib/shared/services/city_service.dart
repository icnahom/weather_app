import 'package:flutter/services.dart';

import '../models/city.dart';
import 'csv_to_json.dart';

class CityService {
  Future<List<City>> loadCities() async {
    final csvString = await rootBundle.loadString('assets/cities_list.csv');
    final jsonList = csvToJsonList(csvString);
    return jsonList.map(City.fromJson).toList();
  }
}
