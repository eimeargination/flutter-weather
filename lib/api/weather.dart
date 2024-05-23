import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';


// To generate - run 'dart run build_runner build' in lib folder
@JsonSerializable()
class Weather {
  final double lat;
  final double lon;
  final String timezone;
  @JsonKey(name: 'timezone_offset')
  final int timezoneOffset;
  final Current current;

  const Weather(
      this.lat, this.lon, this.timezone, this.timezoneOffset, this.current);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  /// Connect the generated [_$WeatherToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Current {
  final int dt;
  final int sunrise;
  final int sunset;
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

  const Current(
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
  );

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  /// Connect the generated [_$WeatherToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
