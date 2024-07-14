import 'package:flutter/material.dart';
import 'user.dart';

class OneScreen extends StatelessWidget {
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
          title: Text('[20195238 장정명] One Screen'),
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'One Screen',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                ElevatedButton(
                  child: Text('Go Two'),
                  onPressed: () async {
                    // Navigator.pushNamed(context, '/two');
                    final result = await Navigator.pushNamed(
                      context,
                      '/two',
                      arguments: {
                        "arg1": 10,
                        "arg2": "hello",
                        "arg3": User('kkang', 'Seoul')
                      },
                    );
                    if (result != null && result is User) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Dialog Title'),
                            content: Text('Name: ${result.name}, Address: ${result.address}'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
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
