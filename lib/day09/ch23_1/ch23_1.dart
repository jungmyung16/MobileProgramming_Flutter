import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // AppBar의 배경 색상을 설정
        ),
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  @override
  NativePluginWidgetState createState() => NativePluginWidgetState();
}

class NativePluginWidgetState extends State<NativePluginWidget> {
  String? latitude;
  String? longitude;

  getGeoDate() async {
    LocationPermission permission  = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getGeoDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("20195238 장정명")),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (<Widget>[
              Text(
                'MyLocation',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'latitude : ${latitude}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'longitude : ${longitude}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
