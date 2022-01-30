import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/profile/userhttp.dart';
import 'package:flutter/material.dart';

class ProfileDecider extends StatefulWidget {
  const ProfileDecider({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileDeciderState createState() => _ProfileDeciderState();
}

class _ProfileDeciderState extends State<ProfileDecider> {
  Future<Map<String, dynamic>> ProfileDeciderJson = getUserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileDecider'),
        backgroundColor: appbarcolor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        future: ProfileDeciderJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Profile();
          } else if (snapshot.hasError) {
            return Profile();
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
