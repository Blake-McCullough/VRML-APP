import 'package:VRML_APP/search/player/playerhttp.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamhttp.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'package:flutter/material.dart';
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
      appBar: AppBar(
          title: Text('Results for $userinput in $searcharea'),
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
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
