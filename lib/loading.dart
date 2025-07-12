import 'package:flutter/material.dart';
import 'world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime('Europe/Berlin','Berlin', 'germany.png',);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date1,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: Center(
        child : SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}