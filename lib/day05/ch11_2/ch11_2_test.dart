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
            title: Text('Input Widgets'),
          ),
          body: TestScreen()
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  TextState createState() => TextState();
}

class TextState extends State<TestScreen> {
  bool? isChecked = true;
  String? selectPlatform;
  double slideValue = 5.0;
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Checkbox Test'),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                }),
            Text('checkbox value is $isChecked')
          ],
        ),
        Text('Radio Test'),
        Row(
          children: [
            Radio(
                value: 'android',
                groupValue: selectPlatform,
                onChanged: (String? value) {
                  setState(() {
                    selectPlatform = value;
                  });
                }),
            Text('android')
          ],
        ),
        Row(
          children: [
            Radio(
                value: 'ios',
                groupValue: selectPlatform,
                onChanged: (String? value) {
                  setState(() {
                    selectPlatform = value;
                  });
                }),
            Text('ios')
          ],
        ),
        Text('select platform is $selectPlatform'),
        Text('Slider Test'),
        Slider(
            value: slideValue,
            min: 0,
            max: 10,
            onChanged: (double value) {
              setState(() {
                slideValue = value;
              });
            }),
        Text('slider value is $slideValue'),
        Text('Switch Test'),
        Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          }),
        Text('select value is $switchValue')
      ],
    );
  }
}