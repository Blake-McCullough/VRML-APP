import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/player/playersearch.dart';
import 'package:VRML_APP/search/team/teamsearch.dart';
import 'package:VRML_APP/settings/settings.dart';
import 'package:flutter/material.dart';

var teamID;
var searcharea;
String? userinput;
//CREATES THE SearchResults CRAP
Map<String, dynamic> x = {};

// Define a custom Form widget.
class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  _Search createState() => _Search();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _Search extends State<Search> {
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
                'Search',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Would you like to search for teams or players?',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Center(
                child: ElevatedButton(
                    child: Text('Teams Search'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Searchteams()),
                      );
                    }),
              ),
              Center(
                child: ElevatedButton(
                    child: Text('Players Search'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Searchplayers()),
                      );
                    }),
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
                                    child: ElevatedButton(
                                        child: Text('Search'),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Search()),
                                          );
                                        }),
                                  ),
                                  Center(
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .popUntil((route) => route.isFirst);
                                      },
                                      icon: Icon(Icons
                                          .home), //icon data for elevated button
                                      label: Text(""), //label text
                                    ),
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
