import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/prefs/prefs.dart';

import 'api/weather.dart';

class GetWeatherForecast extends StatelessWidget {
  const GetWeatherForecast(
      {super.key,
      required this.futureWeather,
      required this.prefs,
      required this.onRefresh});

  final Future<Forecast> futureWeather;
  final SharedPreferences prefs;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Forecast>(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Current weather'),
              WeatherDetail(prefs: prefs, current: snapshot.data!.current),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data!.hourly.map((e) => HourPreview(prefs: prefs, preview: e)).toList(),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  onRefresh();
                },
                child: const Text("Refresh weather"),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({super.key, required this.prefs, required this.current});

  final SharedPreferences prefs;
  final Detail current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${prefs.convertTemp(current.temp).round()} degrees'),
        Text('${current.uvi} UV'),
        Text('The weather is currently ${current.weather[0].description}'),
        Image.network(current.weather[0].getIcon()),
      ],
    );
  }
}

class HourPreview extends StatelessWidget {
  const HourPreview({super.key, required this.prefs, required this.preview});

  final SharedPreferences prefs;
  final Detail preview;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(preview.weather[0].getIcon()),
          Text('${prefs.convertTemp(preview.temp).round()}°'),
          Text('${preview.uvi} UV'),
          Text(preview.getHour())
        ],
      ),
    );
  }
}
