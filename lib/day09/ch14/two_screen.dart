import 'package:flutter/material.dart';
import 'user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue, // AppBar의 배경 색상을 설정
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('[20195238 장정명] Two Screen'),
        ),
        body: Container(
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Two Screen',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                    'sendData:${args["arg1"]}, ${args["arg2"]}, ${(args["arg3"] as User).name},'),
                ElevatedButton(
                  child: Text('Go Three'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/three');
                  },
                ),
                ElevatedButton(
                  child: Text('Pop'),
                  onPressed: () {
                    Navigator.pop(context, User('kim', 'busan'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
