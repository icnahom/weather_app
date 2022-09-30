import 'package:json_annotation/json_annotation.dart';

import 'json.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City(this.name, this.lon, this.lat, this.country);
  final String name;
  @JsonKey(fromJson: _doubleFromString, toJson: _doubleToString)
  final double lon;
  @JsonKey(fromJson: _doubleFromString, toJson: _doubleToString)
  final double lat;
  final String country;

  factory City.fromJson(Json json) => _$CityFromJson(json);

  Json toJson() => _$CityToJson(this);

  // Custom converter
  static double _doubleFromString(String value) => double.parse(value);
  static String _doubleToString(double value) => value.toString();
}
