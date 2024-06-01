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
      (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.current.toJson(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
      'daily': instance.daily.map((e) => e.toJson()).toList(),
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
      (json['pop'] as num?)?.toDouble(),
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
      'pop': instance.pop,
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

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      (json['dt'] as num).toInt(),
      (json['sunrise'] as num).toInt(),
      (json['sunset'] as num).toInt(),
      (json['moonrise'] as num).toInt(),
      (json['moonset'] as num).toInt(),
      (json['moon_phase'] as num).toDouble(),
      json['summary'] as String,
      Temperature.fromJson(json['temp'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'summary': instance.summary,
      'temp': instance.temp,
      'weather': instance.weather,
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      (json['day'] as num).toDouble(),
      (json['min'] as num).toDouble(),
      (json['max'] as num).toDouble(),
      (json['night'] as num).toDouble(),
      (json['eve'] as num).toDouble(),
      (json['morn'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
