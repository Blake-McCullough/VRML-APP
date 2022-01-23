import 'package:VRML_APP/comingsoon.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/search/team/teamsearchresults.dart';
import 'package:VRML_APP/settings/settings.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class Searchteams extends StatefulWidget {
  const Searchteams({
    Key? key,
  }) : super(key: key);

  @override
  _Searchteams createState() => _Searchteams();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _Searchteams extends State<Searchteams> {
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
                'Search Teams',
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
                            builder: (context) => const TeamSearchResults()),
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
                            builder: (context) => const TeamSearchResults()),
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
                            builder: (context) => const TeamSearchResults()),
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
                          builder: (context) => const TeamSearchResults()),
                    );
                  }),
              ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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
                                                builder: (context) =>
                                                    const Search()),
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
                                                  ComingSoon()),
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
