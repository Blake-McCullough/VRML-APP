import 'dart:core';

import 'package:VRML_APP/main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

String? region;
final _client = http.Client();
Future<String> getLeaderboards(
    String leaderboardlocation, String leaderboardgame) async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/' +
      leaderboardgame +
      '/Standings/?region=' +
      leaderboardlocation;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response.body);
  return response.body;
}

Future<String> getGameNotifications() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'scheduled title',
      'scheduled body',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
          android: AndroidNotificationDetails('1', 'GameNotifications',
              channelDescription: 'Notifications about upcoming games :)')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
  return ("OKIE");
}
