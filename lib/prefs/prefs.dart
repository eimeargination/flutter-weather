import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tempKey = 'temp';
const kelvin = 'Kelvin';
const celsius = 'Celsius';
const fahrenheit = 'Fahrenheit';

extension GetPreferences on SharedPreferences {
  String getTempUnits() {
    return getString(tempKey) ?? kelvin;
  }

  setTempUnits(newUnits) {
    setString(tempKey, newUnits);
  }

  double convertTemp(double tempInK) {
    final localTempSetting = getTempUnits();
    if (localTempSetting == celsius) {
      return (tempInK - 273.15);
    } else if (localTempSetting == fahrenheit) {
      return (tempInK - 273.15) * 9 / 5 + 32;
    } else {
      return tempInK;
    }
  }
}

class PrefsWidget extends StatefulWidget {
  final Future<SharedPreferences> prefs;
  final Function(SharedPreferences prefs) onSuccess;

  const PrefsWidget(this.prefs, this.onSuccess, {super.key});

  @override
  State<StatefulWidget> createState() => _PrefsWidgetState();
}

class _PrefsWidgetState extends State<PrefsWidget> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: widget.prefs,
        builder: (BuildContext context,
            AsyncSnapshot<SharedPreferences> prefsSnapshot) {
          if (prefsSnapshot.hasData) {
            return widget.onSuccess(prefsSnapshot.data!);
          } else if (prefsSnapshot.hasError) {
            return Text(prefsSnapshot.error.toString());
          }
          return const CircularProgressIndicator();
        });
  }
}
