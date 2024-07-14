import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Row Column Stack'),
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment(0.0, 0.0),
                child: Container(width: 150, height: 150, color: Colors.yellow,),
              ),
              Align(
                alignment: Alignment(1.0, -1.0),
                child: Container(width: 150, height: 150, color: Colors.blue,),
              ),
              Positioned(
                left: 40,
                top: 40,
                child: Container(width: 150, height: 150, color: Colors.pink,)
              )
            ],
          ),
        )
    );
  }
}