import 'package:VRML_APP/search/player/playerhttp.dart';

import 'package:VRML_APP/homescreen/homescreen.dart';

import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/upcoming-games/upcominggames.dart';

import 'package:flutter/material.dart';

import 'package:VRML_APP/main.dart';

class PlayerSearchResults extends StatefulWidget {
  final String userinput;
  final String game;
  const PlayerSearchResults({
    required this.game,
    required this.userinput,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerSearchResultsState createState() => _PlayerSearchResultsState();
}

class _PlayerSearchResultsState extends State<PlayerSearchResults> {
  late Future<List<Map<String, dynamic>>> parJson =
      getPlayersSearch(widget.game, widget.userinput);
  late String playersearch =
      "Results for " + widget.userinput + " in " + widget.game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(playersearch), backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  host + snapshot.data![index]['image']),
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(snapshot.data![index]['name'].toString()),
                    ),

                    //SizedBox(width: 20),
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());

            return Center(
                child: ElevatedButton(
                    child: Text('An error occured :awkward:'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    }));
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
