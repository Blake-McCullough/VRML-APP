import 'package:VRML_APP/search/team/teamsearchresults.dart';

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
      appBar: AppBar(
        title: Text('Team Search'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    hintText: "Do not leave me empty!",
                  ),
                  controller: myController,
                ),
              ),
              ElevatedButton(
                  child: Text(
                    'Search Echo Arena',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(210, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamSearchResults(
                                game: 'EchoArena',
                                userinput: myController.text)),
                      );
                    }
                  }),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                  child: Text(
                    'Search Onward',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(210, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamSearchResults(
                                game: 'Onward', userinput: myController.text)),
                      );
                    }
                  }),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                  child: Text(
                    'Search Snapshot',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(210, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    if (myController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamSearchResults(
                                game: 'SnapShot',
                                userinput: myController.text)),
                      );
                    }
                  }),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                  child: Text(
                    'Search Pavlov',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(210, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeamSearchResults(
                              game: 'Pavlov', userinput: myController.text)),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
