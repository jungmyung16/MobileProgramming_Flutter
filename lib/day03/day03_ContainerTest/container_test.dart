import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // AppBar의 배경 색상을 설정
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Widget'),
        ),
        body: Container(
          height: Size.infinite.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.yellow,
              ],
            ),
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/big.jpeg'), fit: BoxFit.cover),
                ),
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      );
  }
}
