import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> cities = ['서울시', '인천시', '부산시', '대구시', '대전시', '광주시', '울산시', '춘천시'];

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
            title: Text('GirdView'),
          ),
          body: GridView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [Text(cities[index]), Image.asset('images/big.jpeg')],
                ),
              );
            },
            //scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}