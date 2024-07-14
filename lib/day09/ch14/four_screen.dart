import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget {
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
          title: Text('[20195238 장정명] Four Screen'),
        ),
        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Four Screen', style: TextStyle(color: Colors.white, fontSize: 30),),
                ElevatedButton(
                  child: Text('Pop'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}