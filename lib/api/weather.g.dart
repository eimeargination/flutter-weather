// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['timezone'] as String,
      (json['timezone_offset'] as num).toInt(),
      Detail.fromJson(json['current'] as Map<String, dynamic>),
      (json['hourly'] as List<dynamic>)
          .map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current.toJson(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      (json['dt'] as num).toInt(),
      (json['sunrise'] as num?)?.toInt(),
      (json['sunset'] as num?)?.toInt(),
      (json['temp'] as num).toDouble(),
      (json['feels_like'] as num).toDouble(),
      (json['pressure'] as num).toInt(),
      (json['humidity'] as num).toInt(),
      (json['dew_point'] as num).toDouble(),
      (json['uvi'] as num).toDouble(),
      (json['clouds'] as num).toInt(),
      (json['visibility'] as num).toInt(),
      (json['wind_speed'] as num).toDouble(),
      (json['wind_deg'] as num).toInt(),
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      (json['id'] as num).toInt(),
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
