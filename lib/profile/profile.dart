import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/profile/editprofile.dart';
import 'package:VRML_APP/profile/userhttp.dart';
import 'package:flutter/material.dart';
import 'package:vertical_picker/vertical_picker.dart';
import 'package:VRML_APP/globalvariables.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

String? teamname;
final host = 'https://vrmasterleague.com';

//CREATES THE PROFILE CRAP
class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Map<String, dynamic>> profileJson = getUserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: appbarcolor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        future: profileJson,
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
                    Text('Username:',
                        style: TextStyle(
                            fontSize: 20,
                            color: textcolour,
                            decoration: TextDecoration.underline)),
                    Text(snapshot.data!['username'],
                        style: TextStyle(
                          color: textcolour,
                        ))
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, //Center Row contents vertically,
                            children: [
                              Column(children: [
                                Text('Timezone:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textcolour,
                                        decoration: TextDecoration.underline)),
                                Text(snapshot.data!['timezone'],
                                    style: TextStyle(
                                      color: textcolour,
                                    )),
                              ]),
                              Column(children: [
                                Text('Country:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: textcolour,
                                        decoration: TextDecoration.underline)),
                                Text(snapshot.data!['country'],
                                    style: TextStyle(
                                      color: textcolour,
                                    ))
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Text('Discord:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: textcolour,
                                      decoration: TextDecoration.underline)),
                              Text(snapshot.data!['discordTag'],
                                  style: TextStyle(
                                    color: textcolour,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ElevatedButton(
                            child: Text(
                              'Edit Profile (N/A)',
                              style: TextStyle(
                                  color: buttontextcolour, fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: buttoncolour,
                                fixedSize: const Size(210, 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {},
                          ),
                        ])),
                SizedBox(
                  height: 60.0,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 225.0,
                ),
                Column(
                  children: [
                    Text('You must sign-in',
                        style: TextStyle(
                            fontSize: 30,
                            color: textcolour,
                            decoration: TextDecoration.underline)),
                    Text(' to see this',
                        style: TextStyle(
                            fontSize: 30,
                            color: textcolour,
                            decoration: TextDecoration.underline)),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(
                          'Signin',
                          style:
                              TextStyle(color: buttontextcolour, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttoncolour,
                            fixedSize: const Size(210, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          final reLoadPage = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                          if (reLoadPage == null) {
                            setState(() {
                              profileJson = getUserDetails();
                            });
                          } else if (reLoadPage) {
                            setState(() {
                              profileJson = getUserDetails();
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ],
            );
            //return Center(
            //  child: ElevatedButton(
            //    child: Text('Signin'),
            //  onPressed: () {
            //  Navigator.push(
            //  context,
            //MaterialPageRoute(builder: (context) => MyApp()),
            //);
            //}));
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
