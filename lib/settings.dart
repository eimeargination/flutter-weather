import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/prefs/prefs.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var futurePreferences = SharedPreferences.getInstance();

  void setTemp(SharedPreferences prefs, String newTemp) {
    setState(() {
      prefs.setTempUnits(newTemp);

      futurePreferences = SharedPreferences.getInstance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: PrefsWidget(futurePreferences, (newPrefs) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          const Text('Choose temperature units'),
                          MaterialButton(
                            onPressed: () {
                              setTemp(newPrefs, kelvin);
                            },
                            child: const Text(kelvin),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setTemp(newPrefs, celsius);
                            },
                            child: const Text(celsius),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setTemp(newPrefs, fahrenheit);
                            },
                            child: const Text(fahrenheit),
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text('Temperature units'),
                      const Spacer(),
                      Text(newPrefs.getTempUnits())
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
