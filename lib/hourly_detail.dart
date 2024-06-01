import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/weather.dart';

import 'app/prefs.dart';

class HourlyDetailPage extends StatefulWidget {
  final String title;
  final Detail hourly;

  const HourlyDetailPage(
      {super.key, required this.title, required this.hourly});

  @override
  State<StatefulWidget> createState() => _HourlyDetailPageState();
}

class _HourlyDetailPageState extends State<HourlyDetailPage> {
  var futurePreferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title,
              style: const TextStyle(fontFamily: 'Merriweather')),
        ),
        body: PrefsWidget(futurePreferences, (newPrefs) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.hourly.getHour(),
                style: const TextStyle(fontFamily: 'Merriweather'),
              ),
              Text(
                  'Weather overview: ${widget.hourly.weather.map((e) => e.description).join(', ')}')
            ]),
          );
        }));
  }
}
