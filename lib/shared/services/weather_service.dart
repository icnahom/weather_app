import 'dart:convert';
import 'dart:io';

import '../../store.dart';
import '../models/city.dart';
import '../models/json.dart';
import '../models/weather.dart';

class WeatherService {
  WeatherService(this.store);
  final Store store;

  Future<Weather> fetchWeather(City city) async {
    final queryParameters = {
      'lat': city.lat.toString(),
      'lon': city.lon.toString(),
      'apiKey': store.apiKey,
    };
    final url = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await store.client.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final jsonMap = jsonDecode(response.body) as Json;
      final weatherMap = jsonMap['weather'][0] as Json;
      weatherMap['temp'] = jsonMap['main']['temp'];
      return Weather.fromJson(weatherMap);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
