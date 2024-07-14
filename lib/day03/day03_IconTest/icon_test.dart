import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  onPressed() {
    print('icon button is clicked...');
  }

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
          title: Text('Icon Button'),
        ),
        body: Column(
          children: [
            Icon(Icons.alarm, size: 100, color: Colors.red,),
            FaIcon(FontAwesomeIcons.bell, size: 100,),
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.alarm, size: 100,)
            )
          ],
        ),
      ),
    );
  }
}
