import 'package:VRML_APP/profile/profileedittingoptions.dart';
import 'package:flutter/material.dart';


import 'package:wheel_chooser/wheel_chooser.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _EditProfile extends State<EditProfile> {
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
      appBar: AppBar(title: Text('Edit Profile')),
      body: WheelChooser(
        onValueChanged: (s) => print(s),
        datas: timezoneOptions,
        unSelectTextStyle: TextStyle(color: Colors.grey),
        selectTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
