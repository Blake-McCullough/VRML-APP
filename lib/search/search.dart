import 'package:VRML_APP/globalvariables.dart';

import 'package:VRML_APP/search/player/playersearch.dart';
import 'package:VRML_APP/search/team/teamsearch.dart';

import 'package:flutter/material.dart';

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
      appBar: AppBar(
          title: Text('Search'),
          automaticallyImplyLeading: false,
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Would you like to search for',
                  style: TextStyle(color: textcolour, fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  'Teams or Players?',
                  style: TextStyle(color: textcolour, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                    child: Text(
                      'Team Search',
                      style: TextStyle(color: textcolour, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(208, 189, 244, 1.0),
                        fixedSize: const Size(210, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Searchteams()),
                      );
                    }),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                    child: Text(
                      'Player Search',
                      style: TextStyle(color: textcolour, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(208, 189, 244, 1.0),
                        fixedSize: const Size(210, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Searchplayers()),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
