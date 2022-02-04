import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/leaderboard/leaderboardresult.dart';

import 'package:flutter/material.dart';

//CREATES THE PROFILE CRAP
class Leaderboardregion extends StatefulWidget {
  final String leaderboardgame;
  const Leaderboardregion({
    required this.leaderboardgame,
    Key? key,
  }) : super(key: key);

  @override
  _Leaderboardregion createState() => _Leaderboardregion();
}

class _Leaderboardregion extends State<Leaderboardregion> {
  late Future<String> game = widget.leaderboardgame as Future<String>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Leaderboard Region'), backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        builder: (context, snapshot) {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaderboardResults(
                              leaderboardlocation: '',
                              leaderboardgame: widget.leaderboardgame)),
                    );
                  },
                  child: Text(
                    'Global',
                    style: TextStyle(color: buttontextcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttoncolour,
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaderboardResults(
                              leaderboardlocation: 'OCE',
                              leaderboardgame: widget.leaderboardgame)),
                    );
                  },
                  child: Text(
                    'OCE',
                    style: TextStyle(color: buttontextcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttoncolour,
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaderboardResults(
                              leaderboardlocation: 'NA',
                              leaderboardgame: widget.leaderboardgame)),
                    );
                  },
                  child: Text(
                    'NA',
                    style: TextStyle(color: buttontextcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttoncolour,
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaderboardResults(
                              leaderboardlocation: 'EU',
                              leaderboardgame: widget.leaderboardgame)),
                    );
                  },
                  child: Text(
                    'EU',
                    style: TextStyle(color: buttontextcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttoncolour,
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
