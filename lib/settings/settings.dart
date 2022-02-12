import 'package:VRML_APP/main.dart';

import 'package:flutter/material.dart';

bool _darkModeEnabled = true;

// Define a custom Form widget.
class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _Settings extends State<Settings> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Text(
                'SETTINGS',
                style: TextStyle(),
              ),
              Text(
                'Made By Blake McCullough',
                style: TextStyle(),
              ),
              Text(
                'Discord - Spoiled_Kitten#4911',
                style: TextStyle(),
              ),
              Text(
                'https://github.com/Blake-McCullough/',
                style: TextStyle(),
              ),
              Text(
                'privblakemccullough@protonmail.com',
                style: TextStyle(),
              ),
              Text(
                'This is the alpha release :)',
                style: TextStyle(),
              ),
              Text(
                'Found a bug or have a recommendation?',
                style: TextStyle(),
              ),
              Text(
                'Message me on discord!',
                style: TextStyle(),
              ),
              Transform.translate(
                  offset: Offset(112.0, 0.0),
                  child: Row(
                    children: [
                      Text(
                        'Dark or light mode?',
                        style: TextStyle(),
                      ),
                      Switch(
                          activeTrackColor: Color.fromRGBO(187, 134, 252, 1),
                          activeColor: Color.fromRGBO(98, 0, 238, 1),
                          value: _darkModeEnabled,
                          onChanged: (val) {
                            setState(() {
                              final ThemeData theme = Theme.of(context);
                              theme.brightness == Brightness.dark
                                  ? _darkModeEnabled = true
                                  : _darkModeEnabled = false;
                              _darkModeEnabled = val;
                              if (val) {
                                MyApp.of(context)!.changeTheme(ThemeMode.dark);
                              } else {
                                MyApp.of(context)!.changeTheme(ThemeMode.light);
                              }
                            });
                            print(themeText);
                          }),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

var themeText;
