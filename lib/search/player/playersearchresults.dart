import 'package:VRML_APP/search/player/playerhttp.dart';
import 'package:VRML_APP/search/search.dart';

import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';

class PlayerSearchResults extends StatefulWidget {
  const PlayerSearchResults({
    Key? key,
  }) : super(key: key);

  @override
  _PlayerSearchResultsState createState() => _PlayerSearchResultsState();
}

class _PlayerSearchResultsState extends State<PlayerSearchResults> {
  Future<List<Map<String, dynamic>>> parJson = getPlayersSearch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colourscheme,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Center(
                    child: Text(
                  'Results for ' + userinput! + " in " + searcharea,
                  style: TextStyle(
                    color: textcolour,
                  ),
                )),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BACKKKKKKKK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                for (var i in snapshot.data!)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(host + i['image']),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          i["name"],
                          style: TextStyle(
                            color: textcolour,
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                playerID = i["id"];
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PlayerResults()),
                              );
                            },
                            child: Text(
                              "Go to player Info",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return Center(
              child: Text(
                'an error occured :awkward:',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PlayerResults extends StatefulWidget {
  const PlayerResults({
    Key? key,
  }) : super(key: key);

  @override
  _PlayerResultsState createState() => _PlayerResultsState();
}

class _PlayerResultsState extends State<PlayerResults> {
  Future<Map<String, dynamic>> parJson = getPlayerSearchID();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 225,
                  height: 225,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(host + snapshot.data!['logo']),
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  children: [
                    const Text('Name',
                        style: TextStyle(
                            color: Colors.indigo,
                            decoration: TextDecoration.underline)),
                    Text(
                      snapshot.data!['name'],
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Country',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['country'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Role',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['role'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return Center(
              child: Text('an error occured :awkward:'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
