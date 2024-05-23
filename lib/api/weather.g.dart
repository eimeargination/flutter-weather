// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['timezone'] as String,
      (json['timezone_offset'] as num).toInt(),
      Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current,
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      (json['dt'] as num).toInt(),
      (json['sunrise'] as num).toInt(),
      (json['sunset'] as num).toInt(),
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
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
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
    };
