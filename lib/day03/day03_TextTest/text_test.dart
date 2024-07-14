import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String longText = '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세, 무궁화 삼천리 화려강산 대한사람 대한으로 기리 보전하세.';

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
            title: Text('Text_Widget'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Hello World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    fontSize: 20,
                    height: 2,
                    backgroundColor: Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                ),
                Text(
                  longText,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                RichText(
                    text: TextSpan(
                      text: 'HE',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(
                        text: 'L',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        children: [
                          TextSpan(text: 'LO'),
                          TextSpan(
                            text: 'WO',
                            style: TextStyle(color: Colors.red)
                          )
                        ]
                      ),
                      TextSpan(
                        text: 'RLD',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      )
                    ]
                  )
                )
              ],
            )
      ),
    );
  }
}
