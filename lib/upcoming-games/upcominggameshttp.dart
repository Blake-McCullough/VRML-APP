import 'dart:convert';
import 'dart:core';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:VRML_APP/profile/profile.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:VRML_APP/main.dart';

String? region;
final _client = http.Client();
Future<String> getcurrentgames() async {
  await Future.delayed(Duration(seconds: 2));
  //Gets the json for the users info
  //Gets the json for the users info
  if (token == null) {
    return Future.error('No Token Set');
  } else {
    tokencode = 'Bearer ' + token;
    final response = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/User/@MyMatches'),
      headers: {
        "content-type": "application/json",
        "Authorization": tokencode,
      },
    );
    print(response.body);
    print("_______________________________________");
    //Delay as server only allows one request per second
    await Future.delayed(Duration(seconds: 2));
    //Gets the notifications
    getcurrentgamesnotification();

    if (response.body.isNotEmpty) {
      return response.body;
    } else {
      return Future.error('Empty Response');
    }
  }
}

Future<String> getcurrentgamesnotification() async {
  //Gets the json for the users info
  //Gets the json for the users info
  if (token == null) {
    return Future.error('No Token Set');
  } else {
    tokencode = 'Bearer ' + token;
    final response = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/User/@MyMatches'),
      headers: {
        "content-type": "application/json",
        "Authorization": tokencode,
      },
    );
    print(response.body);
    print("_______________________________________");
    //Delay as server only allows one request per second

    //Gets the json for the users team/teamsinfo

    //MERGES THE TWO RESPONSES
    var data = json.decode(response.body.toString());

    if (response.body.isNotEmpty) {
      if (data['Message'] == null) {
        int index = 0;
        int itemCount = data['scheduled'].length;
        while (index != itemCount) {
          String titlename = 'You have an match!';
          String bodyname = 'You have an upcoming game at ' +
              data['scheduled'][index]['dateScheduled'].toString() +
              ' against ' +
              data['scheduled'][index]['awayTeam'].toString();

          var dateFormat = DateFormat(
              "dd-MM-yyyy hh:mm aa"); // you can change the format here
          var utcDate = dateFormat.format(DateTime.parse(data['scheduled']
              [index]['dateScheduled'])); // pass the UTC time here
          print(utcDate);
          print('-------------');
          var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
          print(localDate);
          print('-------------');
          DateTime createdDate = DateTime.parse(localDate);
          print(createdDate);
          print('-------------');
          var timenotify = tz.TZDateTime.from(createdDate, tz.local);
          print(timenotify);
          print('-------------');

          if (createdDate.isAfter(DateTime.now().subtract(Duration(days: 0)))) {
            print('itslater$createdDate');

            await flutterLocalNotificationsPlugin.zonedSchedule(
                0,
                titlename,
                bodyname,
                timenotify,
                const NotificationDetails(
                    android: AndroidNotificationDetails(
                        '1', 'Games Time Notification',
                        channelDescription:
                            'Gets your next games notification!')),
                androidAllowWhileIdle: true,
                uiLocalNotificationDateInterpretation:
                    UILocalNotificationDateInterpretation.absoluteTime);
          } else {
            print('itsbefore$createdDate');
          }
          index++;
        }
        return response.body;
      } else {
        return Future.error(data['Message']);
      }
    } else {
      return Future.error('Empty Response');
    }
  }
}
