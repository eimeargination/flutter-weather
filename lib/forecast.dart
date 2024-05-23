import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/prefs.dart';

import 'api/weather.dart';
import 'app/uv_index.dart';

class GetWeatherForecast extends StatelessWidget {
  const GetWeatherForecast(
      {super.key, required this.futureWeather, required this.prefs});

  final Future<Forecast> futureWeather;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Forecast>(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              CurrentWeather(prefs: prefs, current: snapshot.data!.current),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text('Today:'),
              ),
              DailyPreview(prefs: prefs, daily: snapshot.data!.daily.first),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text('Hourly forecast:'),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.hourly.length,
                    itemBuilder: (context, index) {
                      return HourPreview(
                          prefs: prefs, preview: snapshot.data!.hourly[index]);
                    },
                  )),
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

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({super.key, required this.prefs, required this.current});

  final SharedPreferences prefs;
  final Detail current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.network(
                current.weather[0].getIcon(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${prefs.convertTemp(current.temp).round()}${prefs.degreesString()}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    UVIndex(
                      uvi: current.uvi,
                      prefs: prefs,
                    ),
                    Text(
                        'The weather is currently ${current.weather[0].description}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DailyPreview extends StatelessWidget {
  const DailyPreview({super.key, required this.prefs, required this.daily});

  final SharedPreferences prefs;
  final Daily daily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_upward),
              Text(
                  '${prefs.convertTemp(daily.temp.max).round()}${prefs.degreesString()}')
            ],
          ),
          Row(
            children: [
              const Icon(Icons.arrow_downward),
              Text(
                  '${prefs.convertTemp(daily.temp.min).round()}${prefs.degreesString()}')
            ],
          )
        ],
      ),
    );
  }
}

class HourPreview extends StatelessWidget {
  const HourPreview({super.key, required this.prefs, required this.preview});

  final SharedPreferences prefs;
  final Detail preview;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: preview.previewColour(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(preview.weather[0].getIcon()),
                Text(
                  '${prefs.convertTemp(preview.temp).round()}°',
                  style: TextStyle(
                      color: preview.previewColour().computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white),
                ),
                UVIndex(
                  uvi: preview.uvi,
                  prefs: prefs,
                ),
                Text(
                  preview.getHour(),
                  style: TextStyle(
                      color: preview.previewColour().computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
