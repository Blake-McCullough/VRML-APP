import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/leaderboard/leaderboardregion.dart';

import 'package:flutter/material.dart';

//CREATES THE PROFILE CRAP
class Leaderboard extends StatefulWidget {
  const Leaderboard({
    Key? key,
  }) : super(key: key);

  @override
  _Leaderboard createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Leaderboard'),
          automaticallyImplyLeading: false,
          backgroundColor: appbarcolor),
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
                          builder: (context) => Leaderboardregion(
                                leaderboardgame: 'Onward',
                              )),
                    );
                  },
                  child: Text(
                    'Onward',
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
                          builder: (context) => Leaderboardregion(
                                leaderboardgame: 'EchoArena',
                              )),
                    );
                  },
                  child: Text(
                    'Echo Arena',
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
                          builder: (context) => Leaderboardregion(
                                leaderboardgame: 'Pavlov',
                              )),
                    );
                  },
                  child: Text(
                    'Pavlov',
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
                          builder: (context) => Leaderboardregion(
                                leaderboardgame: 'SnapShot',
                              )),
                    );
                  },
                  child: Text(
                    'SnapShot',
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
