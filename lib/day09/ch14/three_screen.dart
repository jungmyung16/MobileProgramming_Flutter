import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget {
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
            title: Text('[20195238 장정명] Three Screen'),
          ),
          body: Container(
            color: Colors.yellow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Three Screen', style: TextStyle(color: Colors.white, fontSize: 30),),
                  ElevatedButton(
                    child: Text('Go Four'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/four');
                    },
                  ),
                  ElevatedButton(
                    child: Text('Pop'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}