import 'package:VRML_APP/upcoming-games/upcominggames.dart';
import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';

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
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
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
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Made By Blake McCullough',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Discord - Spoiled_Kitten#4911',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'https://github.com/Blake-McCullough/',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'privblakemccullough@protonmail.com',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'This is the alpha release :)',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Found a bug or have a recommendation?',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Message me on discord!',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              ElevatedButton(
                  child: Text(
                    'Upcoming Games',
                    style: TextStyle(color: buttontextcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttoncolour,
                      fixedSize: const Size(210, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpcomingGames()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
