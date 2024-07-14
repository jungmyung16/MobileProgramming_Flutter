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
          title: Text('Gesture Dector'),
        ),
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset('images/icon/user.png'),
              onTap: () {
                print('image click...');
              },
              onVerticalDragStart: (DragStartDetails details) {
                print('verical drag start...global position : ${details.globalPosition.dx}, ${details.globalPosition.dy}');
                print('verical drag start...local position : ${details.localPosition.dx}, ${details.localPosition.dy}');
              }
            ),
            ElevatedButton(
                onPressed: () {
                  print('ElevatedButton click....');
                },
                child: Text('Click Me'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
