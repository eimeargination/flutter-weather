import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

// To generate - run 'dart run build_runner build' in project root folder
@JsonSerializable(explicitToJson: true)
class Forecast {
  final double lat;
  final double lon;
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final Detail current;
  final List<Detail> hourly;
  final List<Daily> daily;

  const Forecast(this.lat, this.lon, this.timezone, this.timezoneOffset,
      this.current, this.hourly, this.daily);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Detail {
  final int dt;
  final int? sunrise;
  final int? sunset;
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'dew_point')
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_deg')
  final int windDeg;
  final double? pop;
  final List<Weather> weather;

  const Detail(
      this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.pop,
      this.weather);

  String getHour() {
    var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('HH:mm').format(date);
  }

  String? getPopPercent() {
    if (pop == null) {
      return null;
    } else {
      return '${(pop! * 100).round()}%';
    }
  }

  Color previewColour() {
    var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    final absHour = (date.hour - 12).round().abs();
    // Hour now runs from -12 to 12, but abs reduces sign. 12 = nighttime, 0 = midday

    if (absHour <= 2) {
      return Colors.blue.shade50;
    } else if (absHour <= 4) {
      return Colors.blueGrey.shade100;
    } else if (absHour <= 5) {
      return Colors.blueGrey.shade200;
    } else if (absHour <= 7) {
      return Colors.blueGrey.shade300;
    } else if (absHour <= 8) {
      return Colors.blueGrey.shade600;
    } else if (absHour <= 9) {
      return Colors.blueGrey.shade800;
    } else {
      return Colors.blueGrey.shade900;
    }
  }

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  String getIcon() {
    return 'https://openweathermap.org/img/wn/$icon@2x.png';
  }

  const Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  @JsonKey(name: 'moon_phase')
  final double moonPhase;
  final String summary;
  final Temperature temp;

  const Daily(this.dt, this.sunrise, this.sunset, this.moonrise, this.moonset,
      this.moonPhase, this.summary, this.temp);

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
class Temperature {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  const Temperature(
      this.day, this.min, this.max, this.night, this.eve, this.morn);

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
