import 'package:flutter/material.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; 
    return Scaffold(
      backgroundColor: Colors.purple[500],
      body : SafeArea(
        child : Column(
          children: [
            TextButton.icon(
              onPressed : () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data['location'] = result['location'];
                  data['flag'] = result['flag'];
                  data['time'] = result['time'];
                  data['date'] = result['date'];
                });
              },
              icon : Icon(
                Icons.edit_location,
                color : Colors.white,
              ),
              label : Text(
                "Edit location",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 15.0),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  )
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 60.0,
                letterSpacing: 2.0,
                color: Colors.white,
              )
            ),
            SizedBox(height: 20.0),
            Text(
              data['date'],
              style: TextStyle(
                fontSize: 50.0,
                letterSpacing: 2.0,
                color: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}