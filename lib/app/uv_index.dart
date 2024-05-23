import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app/prefs.dart';

extension GetUVData on double {
  String uvClassification() {
    if (this <= 2.0) {
      return 'Low';
    } else if (this <= 5.0) {
      return 'Medium';
    } else if (this <= 7.0) {
      return 'High';
    } else if (this <= 10.0) {
      return 'Very high';
    } else {
      return 'Extremely high';
    }
  }

  Color uvColor() {
    if (this <= 1.0) {
      return Colors.white;
    } else if (this <= 2.0) {
      return Colors.lightGreen;
    } else if (this <= 5.0) {
      return Colors.yellow;
    } else if (this <= 7.0) {
      return Colors.orange;
    } else if (this <= 10.0) {
      return Colors.red;
    } else {
      return Colors.purple;
    }
  }

  String? uvEmoji() {
    if (this <= 1.0) {
      return null;
    } else if (this <= 2.0) {
      return '🕶️';
    } else if (this <= 5.0) {
      return '🧴';
    } else if (this <= 7.0) {
      return '⛱️';
    } else if (this <= 10.0) {
      return '🥵️';
    } else {
      return '💀';
    }
  }

  String uvValue(SharedPreferences prefs) {
    if (prefs.getShowSpecificUv()) {
      return toString();
    } else {
      return round().toString();
    }
  }
}

class UVIndex extends StatelessWidget {
  const UVIndex({
    super.key,
    required this.uvi,
    required this.prefs
  });

  final SharedPreferences prefs;
  final double uvi;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: uvi.uvColor(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'UV ${uvi.uvValue(prefs)} ${uvi.uvEmoji() ?? ''}',
            style: TextStyle(
                color: uvi.uvColor().computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white),
          ),
        ));
  }
}
