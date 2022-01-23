import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/search.dart';

import 'package:VRML_APP/settings/settings.dart';
import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';

// Define a custom Form widget.
class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MainScreen extends State<MainScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'HOME',
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
              new Expanded(
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Profile()),
                                        );
                                      },
                                      icon: Icon(Icons
                                          .person), //icon data for elevated button
                                      label: Text(""), //label text
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Search()),
                                        );
                                      },
                                      icon: Icon(Icons
                                          .search), //icon data for elevated button
                                      label: Text(""), //label text
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        child: Text('Home'),
                                        onPressed: () {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        }),
                                  ),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Leaderboard()),
                                        );
                                      },
                                      icon: Icon(Icons
                                          .leaderboard), //icon data for elevated button
                                      label: Text(""), //label text
                                    ),
                                  ),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Settings()),
                                        );
                                      },
                                      icon: Icon(Icons
                                          .settings), //icon data for elevated button
                                      label: Text(""), //label text
                                    ),
                                  ),
                                ]),
                              ]),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
