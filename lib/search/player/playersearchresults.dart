import 'package:VRML_APP/homescreen/homescreen.dart';

import 'package:VRML_APP/search/Player/Playerhttp.dart';
import 'package:VRML_APP/search/player/playeridresults.dart';

import 'package:flutter/material.dart';
import 'package:VRML_APP/profile/profile.dart';

class PlayerSearchResults extends StatefulWidget {
  final String userinput;

  const PlayerSearchResults({
    required this.userinput,
    Key? key,
  }) : super(key: key);

  @override
  _PlayerSearchResultsState createState() => _PlayerSearchResultsState();
}

class _PlayerSearchResultsState extends State<PlayerSearchResults> {
  late Future<List<Map<String, dynamic>>> parJson =
      getPlayersSearch(widget.userinput);

  late String playersearch = "Results for " + widget.userinput + " in ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playersearch),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerResults(
                                    playerID: snapshot.data![index]['id'])),
                          ),
                      child: Card(
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerResults(
                                    playerID: snapshot.data![index]['id'])),
                          ),
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
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayerResults(
                                          playerID: snapshot.data![index]['id'],
                                        )),
                              );
                            },
                            icon: Icon(Icons.more_vert),
                          ),
                        ),

                        //SizedBox(width: 20),
                      ));
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
