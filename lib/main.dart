import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/prefs/prefs.dart';
import 'package:weather_app/settings.dart';

import 'api/api.dart';
import 'api/weather.dart';
import 'forecast.dart';

late SharedPreferences prefs;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Forecast> futureForecast;
  final futurePreferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    futureForecast = getWeather();
  }

  refreshWeather() {
    setState(() {
      futureForecast = getWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          const SettingsPage(title: 'Settings')),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
          child: PrefsWidget(futurePreferences, (newPrefs) {
        return GetWeatherForecast(
            futureWeather: futureForecast,
            prefs: newPrefs,
            onRefresh: () {
              refreshWeather();
            });
      })),
    );
  }
}
