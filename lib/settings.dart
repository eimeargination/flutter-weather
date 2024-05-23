import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  void setTemp() {
    setState(() async {
      final newPrefs = await SharedPreferences.getInstance();
      newPrefs.setString('temp', 'Kelvin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder<SharedPreferences>(
          future: prefs,
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          child: Column(
                            children: [
                              const Text('Choose temperature units'),
                              MaterialButton(
                                onPressed: () {
                                  setTemp();
                                },
                                child: Text(snapshot.data?.getString('temp') ?? 'Kelvin'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Text('Temperature units'),
                          const Spacer(),
                          Text(snapshot.data?.getString('temp')?? 'Test')
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Column(
              children: [
                const Text('loading'),
                MaterialButton(onPressed: () {
                  setTemp();
                },
                  child: Text('set temp here'),)
              ],
            );
          },
        ));
  }
}
