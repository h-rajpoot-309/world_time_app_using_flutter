import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as sk;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // get request
  void setupWorldTime() async {
    WorldTime test = WorldTime(
      location: 'Karachi',
      flag: 'pakisan.png',
      continent: 'Asia',
      city: 'Karachi',
    );
    await test.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': test.location,
        'flag': test.flag,
        'time': test.time,
        'isDayTime': test.isDayTime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(child: sk.SpinKitCubeGrid(color: Colors.white, size: 100.0)),
    );
  }
}
