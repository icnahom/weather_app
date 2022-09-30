import 'package:weather_app/shared/services/weather_service.dart';

import 'city/controllers/city_controller.dart';
import 'home/controllers/theme_controller.dart';
import 'home/controllers/weather_controller.dart';
import 'shared/services/api_client.dart';
import 'shared/services/city_service.dart';

class Store {
  final apiKey = 'YOUR_API_KEY';
  final client = ApiClient();

  final cityService = CityService();
  late final weatherService = WeatherService(this);

  late final cityController = CityController(this);
  late final weatherController = WeatherController(this);
  final themeController = ThemeController();
}
