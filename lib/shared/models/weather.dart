import 'package:json_annotation/json_annotation.dart';

import 'json.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather(this.id, this.main, this.description, this.icon, this.temp);
  final int id;
  final String main;
  final String description;
  final String icon;
  final double temp;

  factory Weather.fromJson(Json json) => _$WeatherFromJson(json);

  Json toJson() => _$WeatherToJson(this);

  late final int tempInFahrenheit = ((temp - 273.15) * 9 / 5 + 32).round();
  late final int tempInCelsius = (temp - 273.15).round();
}
