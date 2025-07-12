import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String url;
  late String time;
  late String date1;
  String flag;

  WorldTime(this.url, this.location, this.flag);

  Future<void> getTime() async {
    //year: 2022, month: 7, day: 17, hour: 18, minute: 10, seconds: 58, milliSeconds: 782,
    //dateTime: 2022-07-17T18:10:58.7824156, date: 07/17/2022, time: 18:10, timeZone: Europe/Amsterdam, dayOfWeek: Sunday, dstActive: true
    try {
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      // DateTime now = DateTime.parse(data['dateTime']);
      var now = data['time'];
      var dat = data['date'];
      time = now.toString();
      date1 = dat.toString();
    }
    catch(e) {
      time = 'could not get time data';
    }
  }
}