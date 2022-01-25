import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/settings/settings.dart';
import 'package:flutter/material.dart';

import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'playersearchresults.dart';

class Searchplayers extends StatefulWidget {
  const Searchplayers({
    Key? key,
  }) : super(key: key);

  @override
  _Searchplayers createState() => _Searchplayers();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _Searchplayers extends State<Searchplayers> {
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
      appBar:
          AppBar(title: Text('Player Search'), backgroundColor: appbarcolor),
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
                'Search Players',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Do not leave me empty!",
                  ),
                  controller: myController,
                ),
              ),
              ElevatedButton(
                  child: Text(
                    'Search EchoArena',
                    style: TextStyle(
                      color: textcolour,
                    ),
                  ),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      setState(() {
                        searcharea = 'EchoArena';
                        userinput = myController.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayerSearchResults()),
                      );
                    }
                  }),
              ElevatedButton(
                  child: Text('Search Onward'),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      setState(() {
                        searcharea = 'Onward';
                        userinput = myController.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayerSearchResults()),
                      );
                    }
                  }),
              ElevatedButton(
                  child: Text('Search Snapshot'),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      setState(() {
                        searcharea = 'Snapshot';
                        userinput = myController.text;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayerSearchResults()),
                      );
                    }
                  }),
              ElevatedButton(
                  child: Text('Search Pavlov'),
                  onPressed: () {
                    setState(() {
                      searcharea = 'pavlov';
                      userinput = myController.text;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayerSearchResults()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

//CREATES THE SearchResults CRAP
