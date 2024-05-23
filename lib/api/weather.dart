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

  const Forecast(this.lat, this.lon, this.timezone, this.timezoneOffset,
      this.current, this.hourly);

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
  final List<Weather> weather;

  const Detail(this.dt,
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
      this.weather);

  String getHour() {
    var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    return DateFormat('HH:mm').format(date);
  }

  factory Detail.fromJson(Map<String, dynamic> json) =>
      _$DetailFromJson(json);

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
