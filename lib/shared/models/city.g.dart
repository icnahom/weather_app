// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['name'] as String,
      City._doubleFromString(json['lon'] as String),
      City._doubleFromString(json['lat'] as String),
      json['country'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
      'lon': City._doubleToString(instance.lon),
      'lat': City._doubleToString(instance.lat),
      'country': instance.country,
    };
