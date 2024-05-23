import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/api-key.dart';
import 'package:weather_app/api/weather.dart';

Future<Forecast> getWeather() async {
  const url = 'https://api.openweathermap.org/data/3.0/onecall?lat=55.005038&lon=-1.618434&exclude=minutely,alerts&appid=$apiKey';
  final response =
  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Forecast.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.body.toString());
    throw Exception('Failed to load activity ${response.statusCode}');
  }
}
