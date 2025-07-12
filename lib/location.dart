import 'package:flutter/material.dart';
import 'world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime('Europe/London','London','uk.png'),
    WorldTime( 'Europe/Berlin',  'Athens',  'greece.png'),
    WorldTime( 'Africa/Cairo',  'Cairo',  'egypt.png'),
    WorldTime( 'Africa/Nairobi', 'Nairobi',  'kenya.png'),
    WorldTime( 'America/Chicago',  'Chicago',  'usa.png'),
    WorldTime( 'America/New_York',  'New York',  'usa.png'),
    WorldTime( 'Asia/Seoul',  'Seoul',  'south_korea.png'),
    WorldTime( 'Asia/Jakarta',  'Jakarta',  'indonesia.png'),
  ];

  void setupLocation(WorldTime instance) async {
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date1,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor : Colors.purple,
        title : Text("Choose Location"),
        centerTitle : true,
      ),
      body : ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              onTap: () {
                setupLocation(locations[index]);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}